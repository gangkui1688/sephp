<?php


class exceptions extends Exception
{
    public static $_msg = [];
    public static $_file = [];


    public static function throw_debug($message = "", $code = 0, Throwable $previous = null)
    {
        throw new self($message, intval($code), $previous);
    }
}