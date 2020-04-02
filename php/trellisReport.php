<?php
echo 'Trellis Report ';
$servername = "localhost";
$username = "username";
$password = "password";
/*$dbcnx = mysql_connect ('trellisdb', 'root', 'docker'); 
$result = @mysql_query('SHOW DATABASES'); 

while ($row = mysql_fetch_array($result)) { 
    print_r ($row);
}*/
try {
    $conn = new PDO("mysql:host=$servername;dbname=myDB", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
    }
catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
