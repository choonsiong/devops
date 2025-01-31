<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World</title>
</head>
<body>
    <h1>Hello World: apache/php</h1>
    <?php
    $load = sys_getloadavg();
    ?>
    Date: <?php echo date("c"); ?><br/>
    Server utilization (load): <?php echo $load[0]; ?><br/>
    Default time zone: <?php echo date_default_timezone_get(); ?>
</body>
</html>