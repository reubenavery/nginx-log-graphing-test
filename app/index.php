<?php

$matches = array();
preg_match('/\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/', $_SERVER['HTTP_HOST'], $matches);
$host_no_port = $matches[0];
$kibana_port = '5601';

?>

<html>
<head><title>Reuben's Nginx Graph Test</title></head>
<body>
<p>Welcome to this little text kit for graphing response codes from Nginx logs over time.</p>
<p>View results on <a href="http://<?php print "{$host_no_port}:{$kibana_port}" ?>/">Kibana Dashboard</a></p>
<p>Tests:</p>
<ul>
    <li><a href="mock200.php" target="_blank">Generate a 200 result</a></li>
    <li><a href="mock400.php" target="_blank">Generate a 400 result</a></li>
    <li><a href="mock404.php" target="_blank">Generate a 404 result</a></li>
    <li><a href="mock500.php" target="_blank">Generate a 500 result</a></li>
    <li><a href="mock503.php" target="_blank">Generate a 503 result</a></li>
</ul>
</body>
</html>
