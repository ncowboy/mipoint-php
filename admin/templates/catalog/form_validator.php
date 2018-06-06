<?php
session_start();
$_SESSION[errors] = [];
$ref = $_SERVER[HTTP_REFERER];
$id = (int)strip_tags(htmlspecialchars($_POST[id]));
$data = [
  'name' => (string)strip_tags(htmlspecialchars($_POST[name])),
  'alias' => (string)strip_tags(htmlspecialchars($_POST[alias])),
  'price' => strip_tags(htmlspecialchars($_POST[price])),
  'short_desc' => (string)($_POST[short_desc]),
  'full_desc' => (string)($_POST[full_desc])
];

function formFieldsValidate($name, $alias, $price){
  try{
    if(empty($name) || empty($alias) || empty($price)) {
      throw new Exception('Обязательные поля не заполнены');
    }
    if(!preg_match('/^[0-9]+$/', $price)) {
      throw new Exception('Цена должна быть целым числом');
    }
    return true;
  }catch(Exception $e){
              $_SESSION[errors][] = $e->getMessage();
              return FALSE;
            }   
}

function formFilesValidate(){
  define('MAX_SIZE', 3145728);
  define('JPEG', 'image/jpeg');
  $uploadDir = 'img/catalog/';
  if(isset($_FILES)){
   $files_all = []; 
    foreach($_FILES as $key =>$file){
      if(!empty($file[name])) {
        $uploadFile = $uploadDir . basename($file[name]); 
        $tmp = $file['tmp_name'];
          try{
            if($file[size] >= MAX_SIZE) {
              throw new Exception('Файл слишком большой. Допуcтимый размер: не более 3мб');
            }
            if(mime_content_type($tmp) !== JPEG){
              throw new Exception('Недопустимое расширение файла. Только jpeg');
            }
            move_uploaded_file($tmp, $uploadFile);
            $files_all[$key] = $file[name];
            }catch (Exception $e){
              $_SESSION[errors][] = $e->getMessage();
               return FALSE;
            } 
          }  
        }
    }
    return $files_all;
}

$fieldsValid = formFieldsValidate($data[name], $data[alias], $data[price]);
$filesValid = formFilesValidate();

if ($fieldsValid && empty($filesValid) || $fieldsValid && $filesValid) {
  $data[images] = $filesValid;
  strpos($ref, 'create') ? actionItemCreate($data) : actionItemUpdate($id, $data);
  header("Location: /admin/catalog");
}else{
  strpos($ref, 'create') ? header("Location: ". $ref . '?&!') : header("Location: ". $ref . '&!');
}



