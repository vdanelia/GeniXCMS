<?php

class DbTest extends PHPUnit_Framework_TestCase
{
    //static $mysqli = '';

    public function setUp()
    {
        //System::config('config');
        define('DB_DRIVER', 'mysqli');
        define('DB_HOST', 'localhost');
        define('DB_USER', 'root');
        define('DB_PASS', '');
        define('DB_NAME', 'db_test');
        //self::$mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

        //mysqli_select_db($link, 'db_test');
        Db::query("CREATE TABLE test_table (what VARCHAR(50) NOT NULL)");
        //return self::$mysqli;
    }

    public function tearDown()
    {
        Db::query("DROP TABLE test_table");
    }

    public function testquery () {

        $this->assertEquals('SELECT * FROM `test_table`', Db::query());
    }

}