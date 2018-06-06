<?php
session_start();

function authWithCredentials(){
  connect();
  $username = strip_tags($_POST[username]);
  $password = strip_tags($_POST[password]);
  $sql = "SELECT * FROM users WHERE username='$username' AND password=MD5('$password')";
  $result = result(connect(), $sql);
  if(mysqli_num_rows($result) === 0){
    $_SESSION[login_error] = 'пользователь не найден';
    header("Location: /login?errors=true");
  }else{
    $_SESSION[user] = $username;
    $_SESSION[pass] = md5($password);
    header("Location: /admin");
    if(isset($_POST[rememberMe])){
      setcookie('user', $username, time() + 3600 * 24 * 30);
      setcookie('pass', md5($password), time() + 3600 * 24 * 30);
    }
  }
}
if(isset($_POST[submit])){
  authWithCredentials();
}





