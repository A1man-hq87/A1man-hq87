<?php
include "./db.php";
if (isset($_POST["hidden"])) {
  $title = $_POST["edittitle"];
  $desc = $_POST["editdesc"];
  $id = $_POST["hidden"];
  $sql = "UPDATE `notes` SET `sno`='$id',`title`='$title',`description`='$desc' WHERE 'sno'='$id'";
  $res = mysqli_query($conn, $sql);
}

echo '<!-- Button trigger modal --><!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit notes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form method="POST">
      <input type="hidden" id=hidden" name="hidden">
      <div class="mb-3">
          <label for="title" class="form-label">Title</label>
          <input type="text" class="form-control" id="edittitle" placeholder="Enter note tittle" name="edittitle">
      </div>
      <div class="mb-3">
          <label for="desc">Description</label>
          <textarea class="form-control" id="editdesc" rows="3" placeholder="Enter your notes" name="editdesc"></textarea>
      </div>
      <button type="submit" class="btn btn-primary" name="submit">Update notes</button>
  </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>';
?>
<div></div>