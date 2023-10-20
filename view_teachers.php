<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Teacher Management | Student Attendance System</title>
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
    <h1 class="mt-4 mb-4">Teacher Management</h1>

    <?php
      include('conig.php');

      // Fetch teacher records
      $sql = "SELECT teacher_id, teacher_name, designation, department, other_details FROM Teachers";
      $result = mysqli_query($conn, $sql);

      if (mysqli_num_rows($result) > 0) {
        echo "<table class='table table-striped table-bordered'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th>Teacher Name</th>";
        echo "<th>Designation</th>";
        echo "<th>Department</th>";
        echo "<th>Other Details</th>";
        echo "<th>Actions</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        while ($row = mysqli_fetch_assoc($result)) {
          $teacherId = $row["teacher_id"];
          $teacherName = $row["teacher_name"];
          $designation = $row["designation"];
          $department = $row["department"];
          $otherDetails = $row["other_details"];

          echo "<tr>";
          echo "<td>$teacherName</td>";
          echo "<td>$designation</td>";
          echo "<td>$department</td>";
          echo "<td>$otherDetails</td>";
          echo "<td>";
          echo "<a href='edit_teacher.php?id=$teacherId' class='btn btn-primary'>Edit</a>";
          echo "<form action='delete_teacher.php' method='post'>";
          echo "<input type='hidden' name='teacher_id' value='$teacherId'>";
          echo "<button type='submit' class='btn btn-danger' onclick='return confirm(`Are you sure you want to delete this teacher?`)'>Delete</button>";
          echo "</form>";
          echo "</td>";
          echo "</tr>";
        }

        echo "</tbody>";
        echo "</table>";
      } else {
        echo "<div class='alert alert-info'>No teachers found.</div>";
      }

      mysqli_close($conn);
    ?>

    <a href="add_teacher.php" class="btn btn-primary mt-4">Add Teacher</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>

