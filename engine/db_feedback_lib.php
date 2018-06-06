<?php
function getFeedbackItemsFromDb(){
  $items = [];
  $connect = mysqli_connect(HOST, USER, PASS, DB);
  $sql = "SELECT * FROM feedbacks";
  $result = mysqli_query($connect, $sql);
  while($row = mysqli_fetch_assoc($result)){
    $items[] = $row;
  }
  mysqli_close($connect);
  return $items;
}

function addFeedbackIntoDb($text, $author){
  $connect = mysqli_connect(HOST, USER, PASS, DB);
  $sql = "INSERT INTO feedbacks(datetime, author, text) VALUES(NOW(), '$text', '$author')";
  mysqli_query($connect, $sql);
  mysqli_close($connect);
}

