<?php
include "./db.php";
$id = $_GET["id"];
$deleteQuery = "DELETE FROM `notes` WHERE `sno`='$id'";
$res = mysqli_query($conn, $deleteQuery);

// Check if the delete operation was successful
if ($res) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . mysqli_error($conn);
}

header("location: ./note_page.php");
?>

<div></div>