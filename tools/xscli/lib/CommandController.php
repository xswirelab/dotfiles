<?php

namespace App;

abstract class CommandController
{
    protected $app;

    abstract public function run($argv);

    public function __construct(XsCli $app)
    {
        $this->app = $app;
    }

    protected function getApp()
    {
        return $this->app;
    }
}