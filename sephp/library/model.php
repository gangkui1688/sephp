<?php


abstract class model{

    public static $table;
    public static $pk;
    public static $field = [];


    abstract public function getlist();
    abstract public function getdump();

}