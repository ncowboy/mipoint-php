<!DOCTYPE html>
<?php 
$basket_id = $_SESSION[basket_id];
if(isset($basket_id)){
$basket_count = basketTotal($_SESSION[basket_id])[total_count];
}
?>
<html>
  <head>
    <title>miPoint - интернет-магазин фирменной продукции Xiaomi</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.min.css">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
  </head>
  <body>
    <div class="wrapper">
      <header>
        <div id="header-top">
          <div id="header-top-content">
            <div id="logo">
              <a href="/"><img src="img/logo.png" alt="logo"></a>
            </div>
            <nav>
              <div id="top-menu">
                <ul>
                  <li></li>
                  <li> </li>
                </ul>
              </div>
              <hr>
              <div id="bottom-menu">
                <ul>
                  <li><a href="/">Домой</a> </li>
                  <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">Каталог<span class="caret"></span> </a>
                    <ul class="dropdown-menu">
                      <li class="sub-menu-item all-items "><a href="/catalog">Все товары</a></li>
                      <li class="sub-menu-item divider"></li>
                      <?php menuCatalogView(); ?>
                    </ul>
                  </li>
                  <li><a href="/delivery">Доставка</a> </li>
                  <li><a href="/feedback">Отзывы</a> </li>
                  <li><a href="/contacts">КОНТАКТЫ</a> </li>
                </ul>
              </div>
              <div class="counter">
                  <?=isset($basket_count) ? '(' : ''?>
                  <?=$basket_count ?? ''?>
                  <?=isset($basket_count) ? ')' : ''?>
              </div>
              <div class="search-cart" id="cart"> <a href="<?=isset($basket_id) ? '/basket?id=' . $basket_id : '#'?>"></a> </div>
              <div class="search-cart" id="search"> <a href="#"></a> </div>
            </nav>
          </div>
        </div>
        <div id="gradient-line"> </div>
        <?php if (uriController()== '/') include_once 'slider.tpl'; ?>
        <?php if (uriController()== '/feedback') include_once 'feedback_form.tpl'; ?>
      </header>
      <?php
        switch(uriController()){
          case '/': include_once WEB_ROOT . 'index.php';
            break;
          case '/catalog': include_once 'catalog.tpl';
            break;
          case '/delivery': include_once 'delivery.tpl';
            break;
          case '/feedback': include_once 'feedback.tpl';
            break;
          case '/contacts': include_once 'contacts.tpl';
            break;
          case '/login': include_once 'loginForm.tpl';
            break;
          case '/register-form': include_once LIB_DIR . '/form_register.php';
            break;
          case '/add-to cart': include_once LIB_DIR . '/basket_lib.php';
            break;
          case '/basket_update.php': include_once LIB_DIR . '/basket_update_lib.php';
            break;
          case '/basket': include_once 'basket.tpl';
            break;
          default : include_once '404.tpl';
        }
        ?>
    </div>
    <footer>
      <div id="footer-content">
        <div id="copyright">
          <strong>&copy; MiPoint.ru</strong>. Разработка сайта <a href="#">Игорь Борисов</a>. Все права защищены
        </div>
        <div id="social-icons-block">
          <a href="#"></a>
          <a href="#"></a>
          <a href="#"></a>
          <a href="#"></a>
          <a href="#"></a>
        </div>
      </div>
    </footer>
  </body>
</html>