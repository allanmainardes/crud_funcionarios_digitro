<?php 

namespace Mainardes\ProjetoCrud\Model;

require_once('BdConfig.php');

class Connection{
    
    public static $instance;

    public static function getInstance() {
        if (!isset(self::$instance)) {
            self::$instance = new \PDO('mysql:host=172.18.0.2;port=3306;dbname='.DB_SETTINGS['name'], DB_SETTINGS['user'], DB_SETTINGS['password'], array(\PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
            self::$instance->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            self::$instance->setAttribute(\PDO::ATTR_ORACLE_NULLS, \PDO::NULL_EMPTY_STRING);
        }
        return self::$instance;
    }
}

?>