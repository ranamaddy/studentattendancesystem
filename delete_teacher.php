<?php

include('conig.php');
// Get teacher ID from POST request
$teacherId = $_POST["teacher_id"];

// Prepare DELETE query
$sql = "DELETE FROM Teachers WHERE teacher_id = $teacherId";

// Execute DELETE query
if (mysqli_query($conn, $sql)) {
  header("Location: view_teachers.php");
  exit;
} else {
  echo "<div class='alert alert-danger'>Error deleting teacher: " . mysqli_error($conn) . "</div>";
}

mysqli_close($conn);
?>
