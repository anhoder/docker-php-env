<?php

$redis = new Redis();
$redis->connect('alan_redis', '6379');
var_dump($redis->get('name'));
