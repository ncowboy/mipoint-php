<?php
session_start();

function checkoutWithSession(){
  if (!isset($_SESSION[user])) return false;
  connect();
  $username = $_SESSION[user];
  $sql = "SELECT * FROM users WHERE username='$username'";
  $result = result(connect(), $sql);
  $user = mysqli_fetch_assoc($result);
  if($user['password'] == $_SESSION[pass]){
    $isAuth = true;
  }else{
    session_unset();
    session_destroy();
    $isAuth = false;
  }
  return $isAuth;
}

function checkoutWithCookie(){
  $isAuth = false;
  if(isset($_COOKIE[user]) && isset($_COOKIE[pass])){
    connect();
    $username = $_COOKIE[user];
    $sql = "SELECT * FROM users WHERE username='$username'";
    $result = result(connect(), $sql);
    $user = mysqli_fetch_assoc($result);
    if($user['password'] == $_COOKIE[pass]){
      $isAuth = true;
      setcookie('user', $username, time() + 3600 * 24 * 30);
      setcookie('pass', $user[pass], time() + 3600 * 24 * 30);
      }else{
        setcookie('user','',time() - 10000);
	setcookie('pass','',time() - 10000);
      }
  }
  return $isAuth;
}


if(!checkoutWithSession()){
  checkoutWithCookie();
}

if(isset($_POST['exit'])){
  session_unset();
  session_destroy();
  setcookie('user','',time() - 10000);
  setcookie('pass','',time() - 10000);
  header("Location: /");
}



