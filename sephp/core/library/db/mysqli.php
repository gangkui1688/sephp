<?php
namespace sephp\core\lib\db;
use sephp\sephp;
use sephp\core\req;

class mysqli
{
    /**
     * @var  string  Instance name
     */
    protected static $_instance;

    protected static $links;

    protected $_crypt_key = null;

    protected $_crypt_fields = array();

    /**
     * @var  int  Query type
     */
    protected $_type;

    /**
     * @var  string  SQL statement
     */
    protected $_sql;

    /**
     * @var string  $_table  table
     */
    protected $_table;

    /**
     * @var array $_columns insert columns
     */
    protected $_columns = array();

    /**
     * @var array  $_values insert  values
     */
    protected $_values = array();

    /**
     * @var array  $_set  insert or update values
     */
    protected $_set = array();

    /**
     * @var array  $_select  columns to select
     */
    protected $_select = array();

    /**
     * @var bool  $_distinct  whether to select distinct values
     */
    protected $_distinct = false;

    /**
     * @var array  $_from  table name
     */
    protected $_from = array();

    /**
     * @var array  $_where  where statements
     */
    protected $_where = array();

    /**
     * @var array  $_having  having clauses
     */
    protected $_having = array();

    /**
     * @var  array  Quoted query parameters
     */
    protected $_parameters = array();

    /**
     * @var array  $_join  join objects
     */
    protected $_join = array();

    /**
     * @var array  $_on  ON clauses
     */
    protected $_on = array();

    /**
     * @var array  $_group_by  group by clauses
     */
    protected $_group_by = array();

    /**
     * @var array  $_order_by  order by clause
     */
    protected $_order_by = array();

    /**
     * @var  integer  $_limit
     */
    protected $_limit = null;

    /**
     * @var integer  $_offset  offset
     */
    protected $_offset = null;

    /**
     * @var  bool  Return results as associative arrays or objects
     */
    protected $_as_object = false;

    protected $_as_row = false;

    protected $_as_field = false;

    /**
     * @param array $config
     * [
     *      host => 主机地址
     *      root => 用户名
     *      pass => 密码
     *      dbname => 数据名称
     *      port => 端口号
     * ]
     * @return mysqli|string
     * @throws \Exception
     */
    public static function instance($config = [])
    {
        if (empty(self::$_instance))
        {
            $db_config = empty($config) ? sephp::$_config['db'] : $config;

            try {
                self::$links = mysqli_connect(
                    $db_config['host'],
                    $db_config['root'],
                    $db_config['pass'],
                    $db_config['dbname'],
                    $db_config['port']
                );

                // 让int、float 返回正确的类型，而不是返回string MYSQLI_OPT_INT_AND_FLOAT_NATIVE=201
                mysqli_options(self::$links, 201, true);

                // 查询编码
                $charset = isset($db_config['charset']) ? str_replace('-', '', strtolower($db_config['charset'])) : 'uft8';
                mysqli_query(self::$links, " SET character_set_connection=" . $charset . ", character_set_results=" . $charset . ",
                 character_set_client=binary, sql_mode='' ");

            } catch (\Exception $e) {

                throw new \Exception(mysqli_error(self::$links), $e->getCode());

            }

            self::$_instance = new self();

            if ( ! empty($db_config['crypt_key']))
            {
                self::$_instance->_crypt_key = $db_config['crypt_key'];
            }

            if ( ! empty($db_config['crypt_fields']))
            {
                self::$_instance->_crypt_fields = $db_config['crypt_fields'];
            }


        }
        return self::$_instance;
    }

    public function start_trans()
    {
        mysqli::autocommit(self::$links,false);
    }

    public function commit()
    {
        mysqli::commit();
        mysqli::autocommit(self::$links,true);

    }

    public function rollback()
    {
        mysqli::rollback();
        mysqli::autocommit(self::$links,true);
    }
    /**
     * Enables or disables selecting only unique columns using "SELECT DISTINCT"
     *
     * @param   boolean  $value  enable or disable distinct columns
     * @return  $this
     */
    public function distinct($value = true)
    {
        $this->_distinct = (bool) $value;

        return $this;
    }

    public function crypt_key($key = null)
    {
        if ($key !== null)
        {
            $this->_crypt_key = $key;
        }
        return $this;
    }

    public function crypt_fields($fields)
    {
        $table = $this->_table;

        if (is_string($fields))
        {
            $fields = explode(',', $fields);
        }

        foreach ($fields as $val)
        {
            if ($val !== '')
            {
                $this->_crypt_fields[$table][] = $val;
            }
        }

        // 去重复
        $this->_crypt_fields[$table] = array_unique($this->_crypt_fields[$table]);

        return $this;
    }

    /**
     * Return the table prefix defined in the current configuration.
     *
     *     $prefix = $db->table_prefix();
     *
     * @param string $table
     *
     * @return  string
     */
    public function table_prefix($table = null)
    {
        if ($table !== null)
        {
            $table = '`'.$table.'`';
            return $table;
        }
        return sephp::$_config['db']['prefix'];
    }

    /**
     * Quote a value for an SQL query.
     *
     *     $this->quote(null);   // 'null'
     *     $this->quote(10);     // 10
     *     $this->quote('fred'); // 'fred'
     *
     * @param   mixed $value
     *
     * @return  string
     *
     * @uses    string
     */
    public function quote($value)
    {
        if ($value === null)
        {
            return 'null';
        }
        elseif ($value === true)
        {
            return "'1'";
        }
        elseif ($value === false)
        {
            return "'0'";
        }
        elseif (is_object($value))
        {
            // 未使用，因为query并没有分开到db_query类去
            if ($value instanceof db_build)
            {
                // Create a sub-query
                return '('.$value->compile($this).')';
            }
            elseif ($value instanceof db_expression)
            {
                // Use a raw expression
                return $value->value();
            }
            else
            {
                // Convert the object to a string
                return $this->quote((string) $value);
            }
        }
        elseif (is_array($value))
        {
            return '('.implode(', ', array_map(array($this, __FUNCTION__), $value)).')';
        }
        elseif (is_int($value))
        {
            return "'{$value}'";
        }
        elseif (is_float($value))
        {
            // Convert to non-locale aware float to prevent possible commas
            return sprintf('%F', $value);
        }

        return $this->escape($value);
    }

    /**
     * Escape query for sql
     *
     * @param   mixed   $value  value of string castable
     * @return  string  escaped sql string
     */
    public function escape($value)
    {
        // SQL standard is to use single-quotes for all values
        return "'$value'";
    }

    /**
     * Quote a field value for an SQL query.
     * for method select、where、order by fields
     *
     * @param mixed $value
     * @param string $select    是否SELECT子句里面的参数，是才能带AS匿名
     * @param string $inside    是否从SUM、MIX、MIN等函数里面提取出来的字段名
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2018-03-16 14:02
     */
    public function quote_field($value, $select = true, $inside = false)
    {
        if ($value === '*')
        {
            return $value;
        }

        // 使用sum、max、min函数的不处理
        if (strcspn($value, "()'") !== strlen($value))
        {
            // 匹配空格、tab符号、`符号
            if (preg_match("#\(([ \t\w\`]+)\)#i", $value, $matchs))
            {
                $match_value = $matchs[1];
                $quote_value = $this->quote_field($match_value, $select, true);
                $value = str_replace("(".$match_value.")", "(".$quote_value.")", $value);
            }
            return $value;
        }

        // 使用AS的匿名
        if ($offset = strripos($value, ' AS '))
        {
            $alias = substr($value, $offset);
            $value = substr($value, 0, $offset);
        }
        // 使用空格的匿名
        elseif ($offset = strrpos($value, ' '))
        {
            $alias = substr($value, $offset);
            $value = substr($value, 0, $offset);
        }
        else
        {
            $alias = '';
        }

        $parts = explode('.', $value);
        // 没有带表前缀
        if (count($parts) === 1)
        {
            $table = $this->_table;
            $field = $parts[0];
        }
        else
        {
            $table = $parts[0];
            $field = $parts[1];
        }

        // 因为字段都是用quote_identifier函数处理过的，所以这里需要去掉 `` 符号
        $table = str_replace("`", "", $table);
        $field = str_replace("`", "", $field);
        $table = $this->table_prefix($table);

        // 当前字段属于加密字段
        if (!empty($this->_crypt_fields[$table]) && in_array($field, $this->_crypt_fields[$table]))
        {
            $value = "AES_DECRYPT({$value}, '{$this->_crypt_key}')";
            // 只处理SELECT子句中的字段，排除函数提取出来的字段
            if ($select && !$inside && empty($alias))
            {
                $alias = " AS `{$field}`";
            }
        }

        return $value.$alias;
    }

    // 字段值是否加密
    public function quote_value($field, $value)
    {
        $table = $this->_table;

        $field = str_replace("`", "", $field);

        // 当前字段属于加密字段
        if (!empty($this->_crypt_fields[$table]) && in_array($field, $this->_crypt_fields[$table]))
        {
            $value = "AES_ENCRYPT('{$value}', '{$this->_crypt_key}')";
        }

        return $value;
    }

    /**
     * Quotes an identifier so it is ready to use in a query.
     *
     * @param	string	$string	the string to quote
     * @return	string	the quoted identifier
     */
    public function quote_identifier($value)
    {
        if ($value === '*')
        {
            return $value;
        }
        elseif (is_object($value))
        {
            // 暂未使用
            if ($value instanceof db_build)
            {
                // Create a sub-query
                return '('.$value->compile($this).')';
            }
            elseif ($value instanceof db_expression)
            {
                // Use a raw expression
                return $value->value();
            }
            else
            {
                // Convert the object to a string
                return $this->quote_identifier((string) $value);
            }
        }

        // 如果传进来的SQL片段带有转义字符，直接返回，不进行下面的转义
        if (preg_match('/^(["\']).*\1$/m', $value))
        {
            return $value;
        }

        // 使用sum、max、min函数的处理
        if (strcspn($value, "()'") !== strlen($value))
        {
            if (preg_match("#\(([ \t\w\`]+)\)#i", $value, $matchs))
            {
                $match_value = $matchs[1];
                $quote_value = $this->quote_identifier($match_value);
                $value = str_replace("(".$match_value.")", "(".$quote_value.")", $value);
            }
            return $value;
        }

        // 去掉多余的空格
        $value = preg_replace('/\s+/', ' ', trim($value));
        $value = str_replace('`', '', $value);


        // 使用AS的匿名
        if ($offset = strripos($value, ' AS '))
        {
            $alias = substr($value, $offset);
            $value = substr($value, 0, $offset);
            $alias = " AS ".$this->quote_identifier( trim(str_ireplace("AS ", "", $alias)) );
        }
        // 使用空格的匿名
        elseif ($offset = strrpos($value, ' '))
        {
            $alias = substr($value, $offset);
            $value = substr($value, 0, $offset);
            $alias = " ".$this->quote_identifier( $alias );
        }
        else
        {
            $alias = '';
        }

        // 如果字段带表名
        if (strpos($value, '.') !== false)
        {
            $parts = explode('.', $value);
            $parts[0] = $this->quote_identifier($parts[0]);
            $parts[1] = $this->quote_identifier($parts[1]);
            $value = implode('.', $parts);
        }
        else
        {
            $value = "`{$value}`";
        }

        return $value.$alias;
    }

    /**
     * Choose the columns to select from.
     *
     * @param	mixed	$select	can be a string or array
     *
     * @return  $this
     */
    public function select($select = '*')
    {
        $this->_type = db::SELECT;

        if (is_string($select))
        {
            $select = explode(',', $select);
        }

        foreach ($select as $val)
        {
            if ($val !== '')
            {
                $this->_select[] = $val;
            }
        }

        return $this;
    }

    /**
     * Generates the FROM portion of the query
     *
     * @param	mixed	$from	can be a string or array
     * @return  $this
     */
    public function from($from)
    {
        foreach ((array) $from as $val)
        {
            if (strpos($val, ',') !== FALSE)
            {
                foreach (explode(',', $val) as $v)
                {
                    $v = trim($v);
                    $v = $this->table_prefix($v);
                    $v = $this->quote_identifier($v);
                    $this->_from[] = $v;
                }
            }
            else
            {
                $val = trim($val);
                $val = $this->table_prefix($val);
                $val = $this->quote_identifier($val);
                $this->_from[] = $val;
            }
        }

        $this->_from = array_unique($this->_from);
        $this->_table = $this->table_prefix($this->_from[0]);

        return $this;
    }

    /**
     * Alias of and_where()
     *
     * @return  $this
     */
    public function where()
    {
        return call_user_func_array(array($this, 'and_where'), func_get_args());
    }

    public function and_where($column, $op = null, $value = null)
    {
        if (empty($column))
        {
            return $this;
        }
        elseif (is_array($column))
        {
            foreach ($column as $key => $val)
            {
                if (is_array($val))
                {
                    $this->and_where($val[0], $val[1], $val[2]);
                }
                else
                {
                    $this->and_where($key, '=', $val);
                }
            }
        }
        else
        {
            if(func_num_args() === 2)
            {
                $value = $op;
                $op = '=';
            }
            $this->_where[] = array('AND' => array($column, $op, $value));
        }

        return $this;
    }

    /**
     * Creates a new "OR WHERE" condition for the query.
     *
     * @param   mixed   $column  column name or array($column, $alias) or object
     * @param   string  $op      logic operator
     * @param   mixed   $value   column value
     *
     * @return  $this
     */
    public function or_where($column, $op = null, $value = null)
    {
        if (is_array($column))
        {
            foreach ($column as $key => $val)
            {
                if (is_array($val))
                {
                    $this->or_where($val[0], $val[1], $val[2]);
                }
                else
                {
                    $this->or_where($key, '=', $val);
                }
            }
        }
        else
        {
            if(func_num_args() === 2)
            {
                $value = $op;
                $op = '=';
            }
            $this->_where[] = array('OR' => array($column, $op, $value));
        }
        return $this;
    }

    /**
     * Alias of and_where_open()
     *
     * @return  $this
     */
    public function where_open()
    {
        return $this->and_where_open();
    }

    /**
     * Opens a new "AND WHERE (...)" grouping.
     *
     * @return  $this
     */
    public function and_where_open()
    {
        $this->_where[] = array('AND' => '(');

        return $this;
    }

    /**
     * Opens a new "OR WHERE (...)" grouping.
     *
     * @return  $this
     */
    public function or_where_open()
    {
        $this->_where[] = array('OR' => '(');

        return $this;
    }

    /**
     * Closes an open "AND WHERE (...)" grouping.
     *
     * @return  $this
     */
    public function where_close()
    {
        return $this->and_where_close();
    }

    /**
     * Closes an open "AND WHERE (...)" grouping.
     *
     * @return  $this
     */
    public function and_where_close()
    {
        $this->_where[] = array('AND' => ')');

        return $this;
    }

    /**
     * Closes an open "OR WHERE (...)" grouping.
     *
     * @return  $this
     */
    public function or_where_close()
    {
        $this->_where[] = array('OR' => ')');

        return $this;
    }

    /**
     * Applies sorting with "ORDER BY ..."
     *
     * @param   mixed   $column     column name or array($column, $alias) or object
     * @param   string  $direction  direction of sorting
     *
     * @return  $this
     */
    public function order_by($column, $direction = null)
    {
        $this->_order_by[] = array($column, $direction);

        return $this;
    }

    /**
     * Return up to "LIMIT ..." results
     *
     * @param   integer  $number  maximum results to return
     *
     * @return  $this
     */
    public function limit($number)
    {
        $this->_limit = (int) $number;

        return $this;
    }

    /**
     * Adds addition tables to "JOIN ...".
     *
     * @param   mixed   $table  column name or array($column, $alias)
     * @param   string  $type   join type (LEFT, RIGHT, INNER, etc)
     *
     * @return  $this
     */
    public function join($table, $type = NULL)
    {
        if ($type !== '')
        {
            $type = strtoupper(trim($type));

            if ( ! in_array($type, array('LEFT', 'RIGHT', 'OUTER', 'INNER', 'LEFT OUTER', 'RIGHT OUTER'), TRUE))
            {
                $type = '';
            }
            else
            {
                $type .= ' ';
            }
        }

        // Assemble the JOIN statement
        $table = $this->table_prefix($table);
        $table = $this->quote_identifier($table);
        $this->_join[] = $type.'JOIN '.$table;

        return $this;
    }

    /**
     * Adds "ON ..." conditions for the last created JOIN statement.
     *
     * @param   mixed   $c1  column name or array($column, $alias) or object
     * @param   string  $op  logic operator
     * @param   mixed   $c2  column name or array($column, $alias) or object
     *
     * @return  $this
     */
    public function on($c1, $op, $c2)
    {
        $joins = $this->_join;
        // 将内部指针指向数组中的最后一个元素
        end($joins);
        // 返回数组内部指针当前指向元素的键名
        $key = key($joins);

        $this->_on[$key][] = array($c1, $op, $c2, 'AND');

        return $this;
    }


    /**
     * Adds "AND ON ..." conditions for the last created JOIN statement.
     *
     * @param   mixed   $c1  column name or array($column, $alias) or object
     * @param   string  $op  logic operator
     * @param   mixed   $c2  column name or array($column, $alias) or object
     *
     * @return  $this
     */
    public function and_on($c1, $op, $c2)
    {
        return $this->on($c1, $op, $c2);
    }

    /**
     * Adds "OR ON ..." conditions for the last created JOIN statement.
     *
     * @param   mixed   $c1  column name or array($column, $alias) or object
     * @param   string  $op  logic operator
     * @param   mixed   $c2  column name or array($column, $alias) or object
     *
     * @return  $this
     */
    public function or_on($c1, $op, $c2)
    {
        $joins = $this->_join;
        // 将内部指针指向数组中的最后一个元素
        end($joins);
        // 返回数组内部指针当前指向元素的键名
        $key = key($joins);

        $this->_on[$key][] = array($c1, $op, $c2, 'OR');

        return $this;
    }


    /**
     * Creates a "GROUP BY ..." filter.
     *
     * @param   mixed  $columns  column name or array($column, $column) or object
     * @param   ...
     *
     * @return  $this
     */
    public function group_by($columns)
    {
        $columns = func_get_args();

        foreach($columns as $idx => $column)
        {
            // if an array of columns is passed, flatten it
            if (is_array($column))
            {
                foreach($column as $c)
                {
                    $columns[] = $c;
                }
                unset($columns[$idx]);
            }
        }

        $this->_group_by = array_merge($this->_group_by, $columns);

        return $this;
    }

    /**
     * Alias of and_having()
     *
     * @param   mixed  $column column name or array($column, $alias) or object
     * @param   string $op     logic operator
     * @param   mixed  $value  column value
     *
     * @return  $this
     */
    public function having($column, $op = null, $value = null)
    {
        return call_user_func_array(array($this, 'and_having'), func_get_args());
    }

    /**
     * Creates a new "AND HAVING" condition for the query.
     *
     * @param   mixed  $column column name or array($column, $alias) or object
     * @param   string $op     logic operator
     * @param   mixed  $value  column value
     *
     * @return  $this
     */
    public function and_having($column, $op = null, $value = null)
    {
        if(func_num_args() === 2)
        {
            $value = $op;
            $op = '=';
        }

        $this->_having[] = array('AND' => array($column, $op, $value));

        return $this;
    }

    /**
     * Creates a new "OR HAVING" condition for the query.
     *
     * @param   mixed   $column  column name or array($column, $alias) or object
     * @param   string  $op      logic operator
     * @param   mixed   $value   column value
     *
     * @return  $this
     */
    public function or_having($column, $op = null, $value = null)
    {
        if(func_num_args() === 2)
        {
            $value = $op;
            $op = '=';
        }

        $this->_having[] = array('OR' => array($column, $op, $value));

        return $this;
    }

    /**
     * Alias of and_having_open()
     *
     * @return  $this
     */
    public function having_open()
    {
        return $this->and_having_open();
    }

    /**
     * Opens a new "AND HAVING (...)" grouping.
     *
     * @return  $this
     */
    public function and_having_open()
    {
        $this->_having[] = array('AND' => '(');

        return $this;
    }

    /**
     * Opens a new "OR HAVING (...)" grouping.
     *
     * @return  $this
     */
    public function or_having_open()
    {
        $this->_having[] = array('OR' => '(');

        return $this;
    }

    /**
     * Closes an open "AND HAVING (...)" grouping.
     *
     * @return  $this
     */
    public function having_close()
    {
        return $this->and_having_close();
    }

    /**
     * Closes an open "AND HAVING (...)" grouping.
     *
     * @return  $this
     */
    public function and_having_close()
    {
        $this->_having[] = array('AND' => ')');

        return $this;
    }

    /**
     * Closes an open "OR HAVING (...)" grouping.
     *
     * @return  $this
     */
    public function or_having_close()
    {
        $this->_having[] = array('OR' => ')');

        return $this;
    }

    /**
     * Start returning results after "OFFSET ..."
     *
     * @param   integer  $number  starting result number
     *
     * @return  $this
     */
    public function offset($number)
    {
        $this->_offset = (int) $number;

        return $this;
    }

    /**
     * Returns results as associative arrays
     *
     * @return  $this
     */
    public function as_assoc()
    {
        $this->_as_object = false;

        return $this;
    }

    /**
     * Returns results as objects
     *
     * @param   mixed $class classname or true for stdClass
     *
     * @return  $this
     */
    public function as_object($class = true)
    {
        $this->_as_object = $class;

        return $this;
    }

    public function as_row()
    {
        $this->_as_row = true;

        return $this;
    }

    public function as_field()
    {
        $this->_as_field = true;

        return $this;
    }

    /**
     * Set the value of a parameter in the query.
     *
     * @param   string $param parameter key to replace
     * @param   mixed  $value value to use
     *
     * @return  $this
     */
    public function param($param, $value)
    {
        // Add or overload a new parameter
        $this->_parameters[$param] = $value;

        return $this;
    }

    /**
     * Bind a variable to a parameter in the query.
     *
     * @param  string $param parameter key to replace
     * @param  mixed  $var   variable to use
     *
     * @return $this
     */
    public function bind($param, & $var)
    {
        // Bind a value to a variable
        $this->_parameters[$param] =& $var;

        return $this;
    }

    /**
     * Add multiple parameters to the query.
     *
     * @param array $params list of parameters
     *
     * @return  $this
     */
    public function parameters(array $params)
    {
        // Merge the new parameters in
        $this->_parameters = $params + $this->_parameters;

        return $this;
    }

    public function query($sql, $type = null)
    {
        // make sure we have a SQL type to work with
        if (is_null($type))
        {
            // get the SQL statement type without having to duplicate the entire statement
            $stmt = preg_split("/[\s]+/", substr($sql, 0, 10), 2);
            switch(strtoupper(reset($stmt)))
            {
                case 'DESCRIBE':
                case 'EXECUTE':
                case 'EXPLAIN':
                case 'SELECT':
                case 'SHOW':
                    $type = db::SELECT;
                    break;
                case 'INSERT':
                case 'REPLACE':
                    $type = db::INSERT;
                    break;
                case 'UPDATE':
                    $type = db::UPDATE;
                    break;
                case 'DELETE':
                    $type = db::DELETE;
                    break;
                default:
                    $type = 0;
            }
        }

        $this->_sql = $sql;
        $this->_type = $type;

        return $this;
    }

    /**
     * Compile the SQL query and return it.
     *
     * @return  string
     */
    public function compile()
    {
        $sql = $this->_sql;

        if ( empty($sql))
        {
            switch ($this->_type)
            {
                case db::SELECT:
                    $sql = $this->get_compiled_select();
                    break;
                case db::INSERT:
                    $sql = $this->get_compiled_insert();
                    break;
                case db::UPDATE:
                    $sql = $this->get_compiled_update();
                    break;
                case db::DELETE:
                    $sql = $this->get_compiled_delete();
                    break;
                default:
                    break;
            }
        }

        // function bind()、param()、parameters()
        if ( ! empty($this->_parameters))
        {
            // Quote all of the values
            $values = array_map(array($this, 'quote'), $this->_parameters);

            // Replace the values in the SQL
            $sql = $this->tr($sql, $values);
        }
        return str_replace('#PB#_', sephp::$_config['db']['prefix'], trim($sql));
    }

    public function get_compiled_sql()
    {
        return $this->compile();
    }

    public function get_compiled_select($reset = TRUE)
    {
        // Start a selection query
        $sql = 'SELECT ';

        if ($this->_distinct === TRUE)
        {
            // Select only unique results
            $sql .= 'DISTINCT ';
        }

        if (empty($this->_select))
        {
            // Select all columns
            $sql .= '*';
        }
        else
        {
            foreach ($this->_select as $key => $val)
            {
                $val = $this->quote_identifier($val);
                $val = $this->quote_field($val);
                $this->_select[$key] = $val;
            }

            // Select all columns
            $sql .= implode(', ', array_unique($this->_select));
        }

        if ( ! empty($this->_from))
        {
            // Set tables to select from
            $sql .= ' FROM '.implode(', ', array_unique($this->_from));
        }

        if ( ! empty($this->_join))
        {
            //$sql .= "\n".implode("\n", $this->qb_join);
            // Add tables to join[$table]
            $sql .= ' '.$this->_compile_join($this->_join);
        }

        if ( ! empty($this->_where))
        {
            // Add selection conditions
            $sql .= ' WHERE '.$this->_compile_conditions($this->_where);
        }

        if ( ! empty($this->_group_by))
        {
            // Add sorting
            $sql .= ' GROUP BY '.implode(', ', array_map(array($this, 'quote_identifier'), $this->_group_by));
        }

        if ( ! empty($this->_having))
        {
            // Add filtering conditions
            $sql .= ' HAVING '.$this->_compile_conditions($this->_having);
        }

        if ( ! empty($this->_order_by))
        {
            // Add sorting
            $sql .= ' '.$this->_compile_order_by($this->_order_by);
        }

        if ($this->_limit !== NULL)
        {
            // Add limiting
            $sql .= ' LIMIT '.$this->_limit;
        }

        if ($this->_offset !== NULL)
        {
            // Add offsets
            $sql .= ' OFFSET '.$this->_offset;
        }

        return $sql;
    }

    public function get_compiled_insert($reset = TRUE)
    {
        // Start an insertion query
        $sql = 'INSERT INTO '.($this->_table);

        // Add the column names
        $sql .= ' ('.implode(', ', array_map(array($this, 'quote_identifier'), $this->_columns)).') ';
        if (is_array($this->_values))
        {
            // Callback for quoting values
            $quote = array($this, 'quote');

            $groups = array();
            foreach ($this->_values as $group)
            {
                foreach ($group as $i => $value)
                {
                    if (is_string($value) AND isset($this->_parameters[$value]))
                    {
                        // Use the parameter value
                        $group[$i] = $this->_parameters[$value];
                    }

                    if (is_string($i))
                    {
                        $field = $i;
                    }
                    else
                    {
                        $field = $this->_columns[$i];
                    }

                    $value = $this->quote_value($field, $value);
                    $group[$i] = $value;
                }

                $val = '('.implode(', ', array_map($quote, $group)).')';
                $val = str_replace("'AES_ENCRYPT", "AES_ENCRYPT", $val);
                $val = str_replace("')'", "')", $val);
                $groups[] = $val;
                //$groups[] = '('.implode(', ', array_map($quote, $group)).')';
            }

            // Add the values
            $sql .= 'VALUES '.implode(', ', $groups);
        }
        else
        {
            // Add the sub-query
            $sql .= (string) $this->_values;
        }
        return $sql;
    }

    public function get_compiled_update($reset = TRUE)
    {
        // Start an update query
        $sql = 'UPDATE '.$this->_table;

        if ( ! empty($this->_join))
        {
            // Add tables to join
            $sql .= ' '.$this->_compile_join($this->_join);
        }

        // Add the columns to update
        $sql .= ' SET '.$this->_compile_set($this->_set);

        if ( ! empty($this->_where))
        {
            // Add selection conditions
            $sql .= ' WHERE '.$this->_compile_conditions($this->_where);
        }

        if ( ! empty($this->_order_by))
        {
            // Add sorting
            $sql .= ' '.$this->_compile_order_by($this->_order_by);
        }

        if ($this->_limit !== null)
        {
            // Add limiting
            $sql .= ' LIMIT '.$this->_limit;
        }

        return $sql;
    }

    public function get_compiled_delete($reset = TRUE)
    {
        // Start a deletion query
        $sql = 'DELETE FROM '.$this->_table;

        if ( ! empty($this->_where))
        {
            // Add deletion conditions
            $sql .= ' WHERE '.$this->_compile_conditions($this->_where);
        }

        if ( ! empty($this->_order_by))
        {
            // Add sorting
            $sql .= ' '.$this->_compile_order_by($this->_order_by);
        }

        if ($this->_limit !== null)
        {
            // Add limiting
            $sql .= ' LIMIT '.$this->_limit;
        }

        return $sql;
    }

    /**
     * Execute the current query on the given database.
     *
     * @param   mixed   $is_master Database master or slave
     *
     * @return  object  SELECT queries
     */
    public function execute($is_master = false)
    {
        // Compile the SQL query
        $sql = $this->compile();

        if ( $this->_as_row || $this->_as_field )
        {
            if (!preg_match("/limit/i", $sql))
            {
                $sql = preg_replace("/[,;]$/i", '', trim($sql)) . " LIMIT 1 ";
            }
        }
        db::$query_sql[] = $sql;
        $rsid = mysqli_query(self::$links,$sql);

        if(mysqli_errno(self::$links) > 0)
        {
            throw new \Exception(mysqli_error(self::$links) . ' | '. $sql);
        }
        if ($this->_type === db::SELECT)
        {
            $rows = array();
            while ($row = mysqli_fetch_array($rsid,MYSQLI_ASSOC))
            {
                $rows[] = $row;
            }
            mysqli_free_result($rsid);//释放结果集
            $result = null;
            if ( empty($rows[0]) )
            {
                $result = null;
            }
            elseif ( $this->_as_field )
            {
                $result = reset($rows[0]);
            }
            elseif ( $this->_as_row )
            {
                $result = $rows[0];
            }
            else
            {
                $result = $rows;
            }
            $this->reset();
            return $result;
        }
        elseif ($this->_type === db::INSERT)
        {
            $this->reset();
            // Return a list of insert id and rows created
            return array(
                mysqli_insert_id(self::$links),
                mysqli_affected_rows(self::$links)
            );
        }
        elseif ($this->_type === db::UPDATE or $this->_type === db::DELETE)
        {
            $this->reset();
            // Return the number of rows affected
            return mysqli_affected_rows(self::$links);//db::affected_rows();
        }

        return $this;
    }

    // 暂时没用
    public function get_fields($table)
    {
        // $sql = "SHOW COLUMNS FROM $table"; //和下面的语句效果一样
        $rows = self::query("Desc `{$table}`");
        $fields = array();
        foreach ($rows as $k => $v)
        {
            // 过滤自增主键
            // if ($v['Key'] != 'PRI')
            if ($v['Extra'] != 'auto_increment')
            {
                $fields[] = $v['Field'];
            }
        }
        return $fields;
    }

    //-------------------------------------------------------------
    // INSERT
    //-------------------------------------------------------------
    public function insert($table = null)
    {
        $this->_type = db::INSERT;

        if ($table)
        {
            // Set the initial table name
            $this->_table = $this->table_prefix($table);
        }

        return $this;
    }

    /**
     * Set the columns that will be inserted.
     *
     * @param   array $columns column names
     * @return  $this
     */
    public function columns(array $columns)
    {
        $this->_columns = array_merge($this->_columns, $columns);

        return $this;
    }

    /**
     * Adds values. Multiple value sets can be added.
     *
     * @throws \FuelException
     * @param array $values
     * @return $this
     */
    public function values(array $values)
    {
        if ( ! is_array($this->_values))
        {
           throw new \Exception('INSERT INTO ... SELECT statements cannot be combined with INSERT INTO ... VALUES');
        }

        // Get all of the passed values
        $values = func_get_args();

        // And process them
        foreach ($values as $value)
        {
            if (is_array(reset($value)))
            {
                $this->_values = array_merge($this->_values, $value);
            }
            else
            {
                $this->_values[] = $value;
            }
        }

        return $this;
    }

    /**
     * This is a wrapper function for calling columns() and values().
     *
     * @param array $pairs column value pairs
     *
     * @return	$this
     */
    public function set(array $pairs)
    {
        if ($this->_type == db::INSERT)
        {
            // 把key存到 _columns 里面
            $this->columns(array_keys($pairs));
            // 把值存到 _values 里面
            $this->values($pairs);
        }
        elseif ($this->_type == db::UPDATE)
        {
            foreach ($pairs as $column => $value)
            {
                $this->_set[] = array($column, $value);
            }
        }
        return $this;
    }

    //-------------------------------------------------------------
    // UPDATE
    //-------------------------------------------------------------
    public function update($table = null)
    {
        $this->_type = db::UPDATE;

        if ($table)
        {
            // Set the initial table name
            $this->_table = $this->table_prefix($table);
        }

        return $this;
    }

    /**
     * Set the value of a single column.
     *
     * @param   mixed  $column  table name or array($table, $alias) or object
     * @param   mixed  $value   column value
     *
     * @return  $this
     */
    public function value($column, $value)
    {
        $this->_set[] = array($column, $value);

        return $this;
    }

    //-------------------------------------------------------------
    // DELETE
    //-------------------------------------------------------------
    public function delete($table = null)
    {
        $this->_type = db::DELETE;

        if ($table)
        {
            // Set the initial table name
            $this->_table = $this->table_prefix($table);
        }

        return $this;
    }

    /**
     * Compiles an array of JOIN statements into an SQL partial.
     *
     * @param   object $db    Database instance
     * @param   array  $joins join statements
     *
     * @return  string
     */
    protected function _compile_join(array $joins)
    {
        foreach ($joins as $key=>$join)
        {
            $conditions = array();

            foreach ($this->_on[$key] as $condition)
            {
                // Split the condition
                list($c1, $op, $c2, $chaining) = $condition;

                // Add chain type
                $conditions[] = ' '.$chaining.' ';

                if ($op)
                {
                    // Make the operator uppercase and spaced
                    $op = ' '.strtoupper($op);
                }

                // Quote each of the identifiers used for the condition
                $c1 = $this->quote_identifier($c1);
                $c2 = $this->quote_identifier($c2);
                $conditions[] = $c1.$op.' '.(is_null($c2) ? 'NULL' : $c2);
            }

            // remove the first chain type
            array_shift($conditions);

            // if there are conditions, concat the conditions "... AND ..." and glue them on...
            empty($conditions) or $joins[$key] .= ' ON ('.implode('', $conditions).')';

        }

        $sql = implode(' ', $joins);
        return $sql;
    }

    /**
     * Compiles an array of conditions into an SQL partial. Used for WHERE
     * and HAVING.
     *
     * @param   object $db         Database instance
     * @param   array  $conditions condition statements
     *
     * @return  string
     */
    protected function _compile_conditions(array $conditions)
    {
        $last_condition = NULL;

        $sql = '';
        foreach ($conditions as $group)
        {
            // Process groups of conditions
            foreach ($group as $logic => $condition)
            {
                if ($condition === '(')
                {
                    if ( ! empty($sql) AND $last_condition !== '(')
                    {
                        // Include logic operator
                        $sql .= ' '.$logic.' ';
                    }

                    $sql .= '(';
                }
                elseif ($condition === ')')
                {
                    $sql .= ')';
                }
                else
                {
                    if ( ! empty($sql) AND $last_condition !== '(')
                    {
                        // Add the logic operator
                        $sql .= ' '.$logic.' ';
                    }

                    // Split the condition
                    list($column, $op, $value) = $condition;

                    // Support db::expr() as where clause
                    if ($column instanceOf db_expression and $op === null and $value === null)
                    {
                        $sql .= (string) $column;
                    }
                    else
                    {
                        if ($value === NULL)
                        {
                            if ($op === '=')
                            {
                                // Convert "val = NULL" to "val IS NULL"
                                $op = 'IS';
                            }
                            elseif ($op === '!=')
                            {
                                // Convert "val != NULL" to "valu IS NOT NULL"
                                $op = 'IS NOT';
                            }
                        }

                        // Database operators are always uppercase
                        $op = strtoupper($op);

                        if (($op === 'BETWEEN' OR $op === 'NOT BETWEEN') AND is_array($value))
                        {
                            // BETWEEN always has exactly two arguments
                            list($min, $max) = $value;

                            if (is_string($min) AND array_key_exists($min, $this->_parameters))
                            {
                                // Set the parameter as the minimum
                                $min = $this->_parameters[$min];
                            }

                            if (is_string($max) AND array_key_exists($max, $this->_parameters))
                            {
                                // Set the parameter as the maximum
                                $max = $this->_parameters[$max];
                            }

                            // Quote the min and max value
                            $value = $this->quote($min).' AND '.$this->quote($max);
                        }
                        elseif ($op === 'FIND_IN_SET')
                        {
                        }
                        else
                        {
                            if (is_string($value) AND array_key_exists($value, $this->_parameters))
                            {
                                // Set the parameter as the value
                                $value = $this->_parameters[$value];
                            }

                            // Quote the entire value normally
                            $value = $this->quote($value);
                        }

                        // Append the statement to the query
                        $column = $this->quote_identifier($column);
                        $column = $this->quote_field($column, false);
                        if ($op === 'FIND_IN_SET')
                        {
                            $sql .= $op."( '{$value}', {$column} )";
                        }
                        else
                        {
                            $sql .= $column.' '.$op.' '.$value;
                        }
                    }
                }

                $last_condition = $condition;
            }
        }

        return $sql;
    }


    /**
     * Compiles an array of set values into an SQL partial. Used for UPDATE.
     *
     * @param   object $db     Database instance
     * @param   array  $values updated values
     *
     * @return  string
     */
    protected function _compile_set(array $values)
    {
        $set = array();
        foreach ($values as $group)
        {
            // Split the set
            list($column, $value) = $group;

            // Quote the column name
            $column = $this->quote_identifier($column);

            if (is_string($value) AND array_key_exists($value, $this->_parameters))
            {
                // Use the parameter value
                $value = $this->_parameters[$value];
            }

            $value = $this->quote_value($column, $value);
            $value = $this->quote($value);
            $value = str_replace("'AES_ENCRYPT", "AES_ENCRYPT", $value);
            $value = str_replace("')'", "')", $value);
            $set[$column] = $column.' = '.$value;
        }

        return implode(', ', $set);
    }

    /**
     * Compiles an array of ORDER BY statements into an SQL partial.
     *
     * @param   object  $db       Database instance
     * @param   array   $columns  sorting columns
     *
     * @return  string
     */
    protected function _compile_order_by(array $columns)
    {
        $sort = array();

        foreach ($columns as $group)
        {
            list($column, $direction) = $group;

            $direction = strtoupper($direction);
            if ( ! empty($direction))
            {
                $direction = ' '.($direction == 'ASC' ? 'ASC' : 'DESC');
            }

            $column = $this->quote_identifier($column);
            $column = $this->quote_field($column, false);
            $sort[] = $column.$direction;
        }

        return 'ORDER BY '.implode(', ', $sort);
    }

    /**
     * Parse the params from a string using strtr()
     *
     * @param   string  $string  string to parse
     * @param   array   $array   params to str_replace
     * @return  string
     */
    public function tr($string, $array = array())
    {
        if (is_string($string))
        {
            $tr_arr = array();

            foreach ($array as $from => $to)
            {
                substr($from, 0, 1) !== ':' and $from = ':'.$from;
                $tr_arr[$from] = $to;
            }
            unset($array);

            return strtr($string, $tr_arr);
        }
        else
        {
            return $string;
        }
    }

    /**
     * Reset the query parameters
     * @return $this
     */
    public function reset()
    {
        $this->_sql        = null;
        $this->_type       = null;
        $this->_table      = null;
        $this->_select     = array();
        $this->_from       = array();
        $this->_join       = array();
        $this->_on         = array();
        $this->_where      = array();
        $this->_group_by   = array();
        $this->_having     = array();
        $this->_order_by   = array();
        $this->_distinct   = false;
        $this->_limit      = null;
        $this->_offset     = null;
        // insert
        $this->_columns    = array();
        $this->_values     = array();
        // update
        $this->_set        = array();

        $this->_as_object  = false;
        $this->_as_row     = false;
        $this->_as_field   = false;

        $this->_parameters = array();

        return $this;
    }

    //入库数据处理，安全数据
    public function strsafe($array)
    {
        $arrays = array();
        if(is_array($array)===true)
        {
            foreach ($array as $key => $val)
            {
                if(is_array($val)===true)
                {
                    $arrays[$key] = $this->strsafe($val);
                }
                else
                {
                    //先去掉转义，避免下面重复转义了
                    $val = stripslashes($val);
                    //进行转义
                    $val = addslashes($val);
                    //处理addslashes没法处理的 _ % 字符
                    //$val = strtr($val, array('_'=>'\_', '%'=>'\%'));
                    $arrays[$key] = $val;
                }
            }
            return $arrays;
        }
        else
        {
            $array = stripslashes($array);
            $array = addslashes($array);
            //$array = strtr($array, array('_'=>'\_', '%'=>'\%'));
            return $array;
        }
    }

    //出库数据整理
    public function strclear($str)
    {
        if(is_array($str)===true)
        {
            foreach ($str as $key => $val)
            {
                if(is_array($val)===true)
                {
                    $str[$key] = $this->strclear($val);
                }
                else
                {
                    //处理stripslashes没法处理的 _ % 字符
                    //$val = strtr($val, array('\_'=>'_', '\%'=>'%'));
                    $val = stripslashes($val);
                    $str[$key] = $val;
                }
            }
        }
        elseif (is_string($str))
        {
            //$str = strtr($str, array('\_'=>'_', '\%'=>'%'));
            $str = stripslashes($str);
        }
        return $str;
    }


    public function get_error()
    {
        return mysqli_error(self::$links);
    }

    public function get_version()
    {
        return mysqli_get_server_version(self::$links);
    }

    public function get_info()
    {
        return mysqli_get_server_info(self::$links);
    }
}
