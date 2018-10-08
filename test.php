<?php

class  abc
{
    /**
     * 生成优惠券数组
     * @param $num
     * @return array
     */
    public function generatorGoodsQuan($num)
    {
        $array = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
            'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
            'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
        for ($i = 0; $i < $num; $i++) {
        $randChar = array_rand($array, 1);
        $quan[] = uniqid($array[$randChar]);
    }
        return $quan;
    }
    /**
     * 优惠券数组排重
     *
     * @param $quan
     * @param $num
     * @return mixed
     */
    private function checkUniQuan($quan, $num)
    {
        $quan = array_unique($quan);
        if (count($quan) < $num) {
            $quan = array_merge($quan, $this->generatorGoodsQuan($num - count($quan)));
            return $this->checkUniQuan($quan, $num);
        } else {
            return $quan;
        }
    }
    /**
     * 数据库排重
     * @param $shopId
     * @param $goodsId
     * @param $quan
     * @param $num
     * @return array|mixed
     */
    private function checkDatabaseQuan($shopId, $goodsId, $quan, $num)
    {
        $data=[];
        if(empty($data))
            return $quan;
        else{
            $quan=array_diff($quan,$data);
            $quan = array_merge($quan, $this->generatorGoodsQuan($num - count($quan)));
            $quan=$this->checkUniQuan($quan,$num);
            return $this->checkDatabaseQuan($shopId, $goodsId, $quan, $num);
        }
    }
    /**
     * 集合方法 生成针对某个店铺，某个商品的一定数量的优惠券
     * @param $shopId
     * @param $goodsId
     * @param $num
     * @return array|mixed
     */
    public function getQuanSn($shopId, $goodsId, $num)
    {
        $quan = $this->generatorGoodsQuan($num);
        $quan = $this->checkUniQuan($quan,  $num);
        return $this->checkDatabaseQuan($shopId, $goodsId, $quan, $num);
    }

    public function getUuid()
    {
        mt_srand(microtime(true)*10000);//optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(mt_rand(), true)));
        $hyphen = chr(45);// "-"
        $uuid = substr($charid,mt_rand(0,16),16);
        $uuid = substr($uuid, 0, 4).$hyphen
            .substr($uuid, 4, 4).$hyphen
            .substr($uuid,8, 4).$hyphen
            .substr($uuid,12, 4);
        return $uuid;
    }
}

$acb = new abc();

//var_dump($acb->getQuanSn(100,100,100000));


for($i=0;$i<10;$i++)
{
    var_dump(microtime(true)*10000,mt_rand(),$acb->getUuid());
}