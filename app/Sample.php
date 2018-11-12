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
     * @return int timestamp
     */
    public function get_Timestamp()
    {
        return strtotime("now");
    }
}
