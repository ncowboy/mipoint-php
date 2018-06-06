<?php 
//@session_start();
if(!isset($_GET[errors])) unset($_SESSION[login_error]);
?>
<main> 
  <div class="container form-container">  
    <h2 class="center-block">Вход на сайт</h2>   
    <form action="/register-form" role="form" method="POST" class="col-md-6">
    <div class="form-group">
      <label for="username">Логин: </label>
      <input type="text" class="form-control" name="username" required>
    </div>
    <div class="form-group">
      <label for="password">Пароль:</label>
      <input type="password" class="form-control" name="password" required>
    </div>
    <div class="checkbox">
    <label>
          <input type="checkbox" name="rememberMe"> Запомнить меня
        </label>
    </div>    
    <button type="submit" name="submit" class="btn btn-default">Войти</button>  
    <p class="help-block"><?= $_SESSION[login_error] ?></p>
  </form>  
</div>   
</main>
