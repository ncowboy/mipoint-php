<?php
if(uriController() === '/add-to-cart'){
  $get_id = $_GET[item_id] ?? '';
  $id = (int)strip_tags(htmlspecialchars($get_id));
  !isset($_SESSION[basket_id]) ? $_SESSION[basket_id] = createBasket() : '';
  if(!findBasketId()){
    setcookie('basket_id', createBasket(), time() + 3600 * 24 * 30);
  } else {
    $_SESSION[basket_id] = findBasketId();
  }
  $basket_id = $_SESSION[basket_id];
  
  if(addToBasket($basket_id, $id)){
    header("Location: $_SERVER[HTTP_REFERER]");
   }
}

function findBasketId(){
  if(!isset($_COOKIE[basket_id])){
    if(!isset($_SESSION[basket_id])){
      return false;
    }else{
      @setcookie('basket_id',$_SESSION[basket_id], time() + 3600 * 24 * 30);
      return $_SESSION[basket_id];
    }
  } return $_COOKIE[basket_id];
}
