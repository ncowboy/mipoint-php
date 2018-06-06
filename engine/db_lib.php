<?php
require_once '../config/config.php';

function connect(){
  return mysqli_connect(HOST, USER, PASS, DB);
}

function result($link, $sql){
  $res = mysqli_query($link, $sql)or die('Ошибка: ' . mysqli_error($link));
  return $res;
}