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
        $pdo = new PDO($dsn, 'root', '123456');
        var_dump($pdo);

        ## Redis测试
        $redis = new Redis();
        var_dump($redis);
    ?>
</body>
</html>