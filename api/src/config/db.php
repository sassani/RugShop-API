<?php
    class DB
    {
        public static function mySql()
        {
            $dsn = getenv('MYSQL_DSN');
            $user = getenv('MYSQL_USER');
            $password = getenv('MYSQL_PASS');
            try {
                $mysql = new PDO( $dsn,$user, $password);
                return $mysql;
            } catch (PDOException $e) {
                echo 'Connection failed: ',  $e->getMessage(), "\n";
                return null;
            }
        }
    }
