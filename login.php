<?php
	require('database_connection.php');

	if (isset($_POST['login-submit'])) {
		if (isset($_POST['input_email']) && isset($_POST['input_password'])) {

            $email = $_POST['input_email'];
            $pass = $_POST['input_password'];

            $stmt = $pdo->prepare("SELECT * FROM customer WHERE emailid = :emailaddr");
            $stmt->execute([':emailaddr' => $email]);
            $row = $stmt->fetch();

            if (($row !== false) && ($stmt->rowCount() > 0)) {
                if ($row['password'] == $pass) {
                    $_SESSION['is_auth'] = true;
                    $_SESSION['user_id'] = $row['id'];
                    $_SESSION['first_name'] = $row['first_name'];
                    $_SESSION['last_name'] = $row['last_name'];
                    $_SESSION['email'] = $row['emailid'];

                    // redirect to the home page.
                    header('location: index.php');
                    exit;
                }
                else {
                    echo "Invalid email or password. Please try again.";
                }
            }
            else {
                echo "Invalid email or password. Please try again.";
            }
        }
        else {
            echo "Please enter an email and password to login.";
        }

	}

