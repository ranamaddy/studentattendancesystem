<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Teacher | Student Attendance System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <style>
    body {
      padding: 20px;
    }
  </style>
</head>
<body>
<?php
include('menu.php');
?>

  <div class="container">
    <h1 class="mt-4 mb-4">Add Teacher</h1>

    <?php
    include('conig.php');

      // Process form data if submitted
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $teacherName = $_POST["teacher_name"];
        $designation = $_POST["designation"];
        $department = $_POST["department"];
        $otherDetails = $_POST["other_details"];

        // Sanitize and validate data
        $teacherName = mysqli_real_escape_string($conn, $teacherName);
        $designation = mysqli_real_escape_string($conn, $designation);
        $department = mysqli_real_escape_string($conn, $department);
        $otherDetails = mysqli_real_escape_string($conn, $otherDetails);

        // Prepare INSERT query
        $sql = "INSERT INTO Teachers (teacher_name, designation, department, other_details) VALUES ('$teacherName', '$designation', '$department','$otherDetails')";

        // Execute INSERT query
        if (mysqli_query($conn, $sql)) {
          echo "<div class='alert alert-success'>Teacher added successfully.</div>";
        } else {
          echo "<div class='alert alert-danger'>Error adding teacher: " . mysqli_error($conn) . "</div>";
        }
      }
    ?>

    <form action="add_teacher.php" method="post">
      <div class="mb-3">
        <label for="teacher_name" class="form-label">Teacher Name:</label>
        <input type="text" class="form-control" id="teacher_name" name="teacher_name" required>
      </div>

      <div class="mb-3">
        <label for="designation" class="form-label">Designation:</label>
        <input type="text" class="form-control" id="designation" name="designation" required>
      </div>

      <div class="mb-3">
        <label for="department" class="form-label">Department:</label>
        <input type="text" class="form-control" id="department" name="department" required>
      </div>

      <div class="mb-3">
        <label for="other_details" class="form-label">Other Details:</label>
        <textarea class="form-control" id="other_details" name="other_details" rows="3"></textarea>
      </div>

      <button type="submit" class="btn btn-primary">Add Teacher</button>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>

