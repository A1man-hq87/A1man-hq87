<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="icon" type="image/jpg" href="image/W.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Note</title>

    <link rel="stylesheet" href="note.css">
</head>

<body>
    <?php include "./db.php"; ?>
    <?php include "./editModal.php"; ?>
    <?php
    if (isset($_POST["submit"])) {
        if (!isset($_POST["hidden"])) {
            $title = $_POST["title"];
            $desc = $_POST["desc"];
            $sql = "INSERT INTO `notes`(`title`, `description`) VALUES ('$title', '$desc')";
            $res = mysqli_query($conn, $sql);
        }
    }
    ?>
    <header>
        <a href="https://www.instagram.com/silver87_gg/"><img src="image/W.png" alt="logo" width="75" height="75"" class=" logo"></a>


        <nav>
            <ul class="nav_links">
                <li><a href="about.html">ABOUT</a></li>
                <li><a href="index.php">HOME</a></li>
                <li><a href="note_page.php">NOTES</a></li> <!--In note there is category--><!--add category in note-->
                <li><a href="date_calendar.html">CALENDAR</a></li>
                <li><a href="feedback.html">FEEDBACK</a></li>
            </ul>
        </nav>
        <a class="cta" href="registration.php"><button>Login</button></a>
    </header>

    <section>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" id="search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <div class="container my-4">
            <div class="row justify-content-center">
                <div class="col-lg10">
                    <form class="form" method="POST">
                        <div class="mb-3">
                            <label for="title" class="form-label">Title</label>
                            <input type="text" class="form-control" id="title" placeholder="Enter note tittle" name="title">
                        </div>
                        <div class="mb-3">
                            <label for="desc">Description</label>
                            <textarea class="form-control" id="desc" rows="3" placeholder="Enter your notes" name="desc"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" name="submit">Add notes</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <h1>your notes store here</h1>
                    <?php
                    $sql = "SELECT * FROM `notes`";
                    $res = mysqli_query($conn, $sql);
                    $notNotes = true;
                    while ($fetch = mysqli_fetch_assoc($res)) {
                        $notNotes = false;
                        echo '<div class="card my-3">
                        <div class="card-body">
                          <h5 class="card-title">' . $fetch["title"] . '</h5>
                          <p class="card-text">' . $fetch["description"] . '</p>
                          <button type="button" class="btn btn-primary edit" data-bs-toggle="modal" data-bs-target="#exampleModal" id="' . $fetch["sno"] . '">
                          edit
                        </button>                        
                          <a href="./delete.php?id=' . $fetch["sno"] . '" class="btn btn-danger">Delete</a>
                        </div>
                      </div>';
                    }
                    if ($notNotes) {
                        echo '<div class="card my-3">
                        <div class="card-body">
                          <h5 class="card-title">Message</h5>
                          <p class="card-text">no notes</p>
                        </div>
                      </div>';
                    }
                    ?>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
            const edit = document.querySelectorAll(".edit");
            const editTitle = document.getElementById("edittitle");
            const editdesc = document.getElementById("editdesc");
            const hiddenInput = document.getElementById("hidden");
            const cardBody = document.querySelectorAll(".card-body");
            edit.forEach(element => {
                element.addEventListener("click", () => {
                    const titleText = element.parentElement.children[0].innerText;
                    const descText = element.parentElement.children[1].innerText;
                    editTitle.value = titleText;
                    editdesc.value = descText;
                    hiddenInput.value = element.id;
                    console.log(hiddenInput);
                });
            });
            const search = document.getElementById('search');
            search.addEventListener("input", () => {
                const value = search.value.toLowerCase();
                cardBody.forEach(element => {

                    if (element.children[0].innerText.toLowerCase().indexOf(value) !== -1) {
                        element.style.display = "block";
                    } else {
                        element.style.display = "none";
                    }
                })
            });
        </script>

        <!-- Simple Footer -->
        <footer>
            <p>&copy; 2023 W-Tracking</p>
            <p><a href="https://www.example.com">Terms of Service</a> | <a href="https://www.example.com/privacy">Privacy Policy</a></p>
            </p>
            <div class="social-icons">
                <a href="https://www.instagram.com"><i class="fa-brands fa-instagram fa-gl"></i></a>
                <a href="https://www.facebook.com"><i class="fa-brands fa-facebook"></i></a>
                <a href="https://www.twitter.com"><i class="fa-brands fa-twitter fa-gl"></i></a>
            </div>
        </footer>
</body>

</html>