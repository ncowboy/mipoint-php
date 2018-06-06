<div class="container bread-crumbs">
  <ol class="breadcrumb">
    <?php 
     $breadCrumbs = [
        ['name' => 'miPoint.ru', 'href' => '/'],
        ['name' => 'Каталог', 'href' => '/catalog']
     ];
      if(isset($_GET[item_id])){
        $item = getCatalogItemFromDb($_GET[item_id]);
        $breadCrumbs[] = [
          'name' => $item[name]
        ];
      }
      breadCrumbsRender($breadCrumbs);
    ?>
  </ol> 
</div>