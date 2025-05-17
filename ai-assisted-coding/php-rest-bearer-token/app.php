<?php
function getBearerToken() {
    $headers = null;
    if (isset($_SERVER['Authorization'])) {
        $headers = trim($_SERVER["Authorization"]);
    } elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) { // Nginx or fast CGI
        $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
    } elseif (function_exists('apache_request_headers')) {
        $requestHeaders = apache_request_headers();
        // Server-side fix for bug in old Android versions (a nice-to-have)
        $requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
        if (isset($requestHeaders['Authorization'])) {
            $headers = trim($requestHeaders['Authorization']);
        }
    }
    if (!empty($headers) && preg_match('/Bearer\\s(\S+)/', $headers, $matches)) {
        return $matches[1];
    }
    return null;
}

function getBearerToken2() {
    if (isset($_SERVER['HTTP_AUTHORIZATION'])) {
        // Extract the header value
        $header = $_SERVER['HTTP_AUTHORIZATION'];
        if (preg_match('/Bearer\s(\S+)/', $header, $matches)) {
            // Return the token part
            return $matches[1];
        }
    }
    return null; // Return null if no token is found
}
?>
