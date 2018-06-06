<main>
  <div id="content-wrapper">
    <div class="container">
      <div class="container bread-crumbs">
        <ol class="breadcrumb">
          <?php breadCrumbsRender([
        ['name' => 'Админ', 'href' => '/admin'],
        ['name' => 'Каталог', 'href' => '/admin/catalog'],
        ['name' => 'Добавление']
      ]);?>
        </ol> 
      </div>   
      <div class="col-md-6 col-md-offset-2">  
        <h2>Добавление товара</h2>    
       <?php require_once '_form.tpl';?>
      </div>  
    </div>    
  </div>
</main>    