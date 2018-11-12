<?php
namespace PHPTest;

class Sample
{
    public function getArgv($argv)
    {
        return $argv;
    }

    public function getException()
    {
        throw new \Exception("Error Processing Request", 1);
    }

    /**
     * phpcs でエラーになる
     * @return int timestamp
     */
    public function get_Timestamp()
    {
        return strtotime("now");
    }

    /**
     * phan でエラーになる
     * @return timestamp
     */
    public function getTimestamp()
    {
        return strtotime("now");
    }
}
