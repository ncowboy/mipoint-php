<?php

function getCatalogItemsFromDb(){
  $items = [];
  $sql = "SELECT * FROM items";
  $result = result(connect(), $sql);
  while($row = mysqli_fetch_assoc($result)){
    $items[] = $row;
  }
  mysqli_close(connect());
  return $items;
}

function getCatalogItemFromDb($id){
  $sql = "SELECT * FROM items WHERE id=$id";
  $result = result(connect(), $sql);
  mysqli_close(connect());
  return mysqli_fetch_assoc($result);
}

function addItemIntoDb($item){
  $sql = "INSERT INTO items(name, alias, price, short_desc, full_desc, img_cat, small_img, full_img)"
      . "VALUES('$item[name]', '$item[alias]', '$item[price]', '$item[short_desc]', "
      . "'$item[full_desc]', '{$item[images][img_cat]}' , '{$item[images][small_img]}' , "
      . "'{$item[images][full_img]}')";
  $result = result(connect(), $sql);
  mysqli_close(connect());
  return $result;
}

function updateDbItem($id, $item){
  $sql = "UPDATE items SET name='{$item[name]}', alias='{$item[alias]}', "
  . "price='{$item[price]}', short_desc='{$item[short_desc]}', full_desc='{$item[full_desc]}'";
  if(!empty($item[images])){
    foreach ($item[images] as $key=>$value){
      $sql .= ", $key = '{$value}'";
    }
  }
  $sql .= "WHERE id={$id}";
  $result = result(connect(), $sql);
  mysqli_close(connect());
  return $result;
}

function deleteDbItem($id) {
  $sql = "DELETE FROM items WHERE id={$id}";
   $result = result(connect(), $sql);
  mysqli_close(connect());
  return $result;
}

