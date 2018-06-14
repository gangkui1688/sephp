<?php


class exceptions extends Exception
{
    public static $_msg = [];
    public static $_file = [];


    public function __construct($message = "", $code = 0, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }

    public static function throw_debug($msg = null)
    {
        throw new self($msg);
        exit();
    }
}