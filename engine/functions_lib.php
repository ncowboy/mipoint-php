<?php

require_once 'db_lib.php';

define('CATALOG_OPEN_TAG', '<div class="item-preview"><a href="/catalog?item_id=');
define('IMG_CONTAINER_TAG', '"></a><div class="image-container"><img src="img/catalog/');
define('ALT', '" alt="');
define('TEXT_CONTAINER_TAG', '"></div><div class="text-container"><p class="image-preview-header">');
define('P_TAG_CLOSE', '</p>');
define('CATALOG_CLOSE_TAGS', '</div></div>');
define('MENU_CAT_OPEN', '<li class="sub-menu-item"><a href="catalog?item_id=');
define('MENU_CAT_LI_CLOSE', '">'); 
define('MENU_CAT_CLOSE', '</a></li>');
define('FB_TAG_OPEN', '<div class="feedback">');
define('FB_DATETIME', '<div class="feedback-datetime">');
define('FB_AUTHOR', '<div class="feedback-author">');
define('FB_TEXT', '<div class="feedback-text">');
define('DIV_CLOSE', '</div>');

function catalogView(){
  $items = getCatalogItemsFromDb();
  if(isset($items)){
    foreach ($items as $item) {
      echo CATALOG_OPEN_TAG . $item[id] .  IMG_CONTAINER_TAG . $item[img_cat] . ALT . 
          $item[alias] . TEXT_CONTAINER_TAG . $item[alias] . P_TAG_CLOSE . $item[short_desc] . 
          CATALOG_CLOSE_TAGS;
    }
  }
}

function menuCatalogView(){
  $menuItems = getCatalogItemsFromDb();
  if(isset($menuItems)){
    foreach ($menuItems as $menuItem) {
      echo MENU_CAT_OPEN . $menuItem[id] . MENU_CAT_LI_CLOSE . $menuItem[alias] .
          MENU_CAT_CLOSE;
    }
  }
}

function feedbacksView(){
  $items = getFeedbackItemsFromDb();
  if(isset($items)){
    foreach ($items as $item) {
      echo FB_TAG_OPEN . FB_DATETIME . date('j F Y, G:i', strtotime($item[datetime])) . DIV_CLOSE . 
           FB_AUTHOR . $item[author] . DIV_CLOSE . 
           FB_TEXT . $item[text] . DIV_CLOSE . DIV_CLOSE ;
    }
  }
}

function catalogItemView($id){
  $catalogItem = getCatalogItemFromDb($id);
  isset($catalogItem) ? include_once '../templates/catalog_item.tpl' : include_once '../templates/404.tpl' ;
}

function breadCrumbsRender($array){
 $last_value = array_pop($array);
  foreach ($array as $value) {
   echo '<li><a href="' . $value[href] . '">' . $value[name] . '</a></li>';
    }
   echo '<li class="active">' . $last_value[name] . '</li>'; 
  }

function uriController(){
  $uri = $_SERVER['REQUEST_URI'];
  $requestDelimiter = stripos($uri, '?');
    if($requestDelimiter) {
     return mb_substr($uri, 0, $requestDelimiter);
     }else{
       return $uri;
      }
 }

 