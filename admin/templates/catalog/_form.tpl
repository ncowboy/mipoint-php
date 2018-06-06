<?php 
@session_start();
$errors = $_SESSION[errors];
$get_id = $_GET[id] ?? '';
$id = (int)htmlspecialchars(strip_tags($get_id));
if(!isset($_GET['!'])){
  unset($errors);
}
?>
<?php if(isset($errors)) :?>
  <?php foreach($errors as $error): ?>
    <p class="help-block"><?= $error ?></p>
  <?php endforeach;?>
<?php endif;?>    
<form action="form_validator.php" enctype="multipart/form-data" method="POST">
  <input type="hidden" name="id" value = "<?=$id?>">  
  <div class="form-group">
    <label for="name">Название</label>
    <input type="text" class="form-control" name="name" value="<?=$isUpdate ? $item[name]: ''?>" >
  </div>
  <div class="form-group">
    <label for="alias">Название на русском</label>
    <input type="text" class="form-control" name="alias" value="<?=$isUpdate ? $item[alias]: ''?>" >
  </div>
  <div class="form-group">
    <label for="price">Цена</label>
    <input type="text" class="form-control" name="price" value="<?=$isUpdate ? $item[price]: ''?>">
  </div>
  <div class="form-group">
    <label for="short_desc">Короткое описание</label>
    <textarea class="form-control" name="short_desc"><?=$isUpdate ? $item[short_desc]: ''?></textarea>
  </div>
  <div class="form-group">
    <label for="short_desc">Полное описание</label>
    <textarea class="form-control" name="full_desc"><?=$isUpdate ? $item[full_desc]: ''?></textarea>
  </div>
  <div class="form-group">
    <label for="img_cat">Картинка для списка товаров</label>
    <input type="file" class="file-input" name="img_cat">
  </div>
  <div class="form-group">
    <label for="small_img">Маленькая картинка</label>
    <input type="file" class="file-input" name="small_img">
  </div>
  <div class="form-group">
    <label for="full_img">Большая картинка</label>
    <input type="file" class="file-input" name="full_img">
  </div>
  <div class="form-group">
    <input name="submit" type="submit" value="<?=$isUpdate?'Сохранить':'Добавить'?>" class="btn btn-success">
    <a class="btn btn-danger" href="/admin/catalog">Отмена</a>
  </div>
</form>


