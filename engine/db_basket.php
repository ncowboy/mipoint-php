<?php
function createBasket(){
  $s_id = session_id();
  $sql = "INSERT INTO baskets (id_session) VALUES('$s_id')";
  $connect = mysqli_connect(HOST, USER, PASS, DB);
  mysqli_query($connect, $sql);
  return mysqli_insert_id($connect);
}

function addToBasket($basket_id, $item_id){
  if(findItemInBasket($basket_id, $item_id) == 0) {
  $sql = "INSERT INTO items_in_basket (id_item, id_basket) "
      . "VALUES($item_id, $basket_id)";
  }else{
    $sql = "UPDATE items_in_basket SET quantity = quantity + 1 "
        . "WHERE id_basket = $basket_id AND id_item = $item_id";
  }
  $result = result(connect(), $sql);
  mysqli_close(connect());
  return $result;
}

function findItemInBasket($basket_id, $item_id){
  $sql = "SELECT * FROM items_in_basket WHERE id_basket = $basket_id AND id_item= $item_id";
  $result = result(connect(), $sql);
   mysqli_close(connect());
  return mysqli_num_rows($result);
}

function basketTotal($basket_id){
  $sql = "SELECT id_basket, sum(quantity) as total_count, sum(price * quantity) 
    as total_sum FROM items_in_basket  
    INNER JOIN items ON items_in_basket.id_item = items.id where id_basket=$basket_id
      GROUP BY id_basket";
  $result = mysqli_fetch_assoc(result(connect(), $sql));
   mysqli_close(connect());
  return $result;
}

function findBasketItems($basket_id){
  $sql = "SELECT id_basket, id_item, quantity, alias, price, img_cat FROM items_in_basket 
  INNER JOIN items ON items_in_basket.id_item = items.id where id_basket=$basket_id";
  $result = result(connect(), $sql);
  while($row = mysqli_fetch_assoc($result)){
    $items[] = $row;
  }
   mysqli_close(connect());
  return $items;
}

function updateBasketItem($value, $basket_id, $item_id){
  $sql = "UPDATE items_in_basket SET quantity=$value WHERE id_basket=$basket_id
      AND id_item = $item_id";
  $result = result(connect(), $sql);
  mysqli_close(connect());
  return $result;
}

function basketItemDelete($id_item, $id_basket){
  $sql = "DELETE FROM items_in_basket WHERE id_basket=$id_basket AND id_item=$id_item";
  result(connect(), $sql);
  mysqli_close(connect());
}

function basketDelete($id){
  $sql = "DELETE FROM baskets WHERE id=$id";
  $result = result(connect(), $sql);
  mysqli_close(connect());
  return $result;
}

