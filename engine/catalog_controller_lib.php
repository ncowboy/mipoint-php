<?php

function actionItemCreate($data){
  if(isset($data)){
    addItemIntoDb($data);
  }
}

function actionItemUpdate($id, $data){
  if(isset($data)){
    updateDbItem($id, $data);
  }
}

function actionItemDelete($id){
    if(deleteDbItem($id)){
      header("Location: /admin/catalog");
    }
}
