<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎使用</title>
</head>
<body>
    <h1>Hello, World</h1>
    <?php
        echo "123456";

        ## MySQL测试
        $dsn = 'mysql:host=alan_mysql;dbname=test';
        $pdo = new PDO($dsn, 'root', '');
        $stmt = $pdo->query("select * from sys_user");
        foreach ($stmt as $row) {
            var_dump($row);
        }

        ## Redis测试
        $redis = new Redis();
        $redis->connect('alan_redis', 6379);
        $redis->set('test', 123);
        var_dump($redis->get('test'));
    ?>
</body>
</html>