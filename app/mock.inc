<?php

function mockResult($code, $description) {
    $msg = "${description} (mocked)";
    header("HTTP/1.0 $code $msg");
    http_response_code($code);
    echo "<h1>HTTP/1.0 $code $msg</h1>";
}
