<?php
if (isset($_POST[qty_update])){
  $qty_upd = $_POST[qty_update];
  $basket_upd = $_POST[id_basket];
  $item_upd = $_POST[id_item];
  if(updateBasketItem($qty_upd, $basket_upd, $item_upd)){
    $qty_upd == 0 ? basketItemDelete($item_upd, $basket_upd) : '';
    header("Location: $_SERVER[HTTP_REFERER]");
  }
} 

if (isset($_POST[item_delete])){
  $basket_id = $_POST[id_basket];
  $item_id = $_POST[id_item];
  if(basketItemDelete($item_id, $basket_id)){
    header("Location: $_SERVER[HTTP_REFERER]");
  }
}

if (isset($_POST[basket_delete])){
  $basket_id = $_POST[id_basket];
  if(basketDelete($basket_id)){
    setcookie('basket_id','',time() - 10000);
    session_unset();
    session_destroy();
    header("Location: /catalog");
  }
}


