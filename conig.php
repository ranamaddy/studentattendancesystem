<?php
// Connect to the database
$dbHost = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "StudentAttendanceSystem";

$conn = mysqli_connect($dbHost, $dbUsername, $dbPassword, $dbName);

if (!$conn) {
  die("Failed to connect to database: " . mysqli_connect_error());
}
?>