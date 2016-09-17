<?php
$code = 200;
$msg = "OK (mocked)";

header("HTTP/1.0 200 $msg");
http_response_code($code);
?>
<html>
<head><title><?php echo $msg ?></title></head>
<body><h1>HTTP/1.0 <?php echo $msg ?></h1></body>
</html>
