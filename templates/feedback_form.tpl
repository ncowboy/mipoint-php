<?php 
  if (isset($_POST)){
    $author = (string)htmlspecialchars(strip_tags($_POST[author]));
    $text = (string)htmlspecialchars(strip_tags($_POST[text]));
    addFeedbackIntoDb($author, $text);
  }
?>
<div class="container form-container">  
    <form role="form" method="POST">
    <div class="form-group">
      <label for="author">Ваше имя: </label>
      <input type="text" class="form-control" name="author" required>
    </div>
    <div class="form-group">
      <label for="text">Текст отзыва:</label>
      <textarea class="form-control" name="text" required></textarea>
    </div>
    <button type="submit" class="btn btn-default">Отправить</button>  
  </form>
</div> 



