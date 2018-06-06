<?php
  $id = (int)htmlspecialchars(strip_tags($_GET[item_id]));
  $breadCrumbs = [
    ['name' => 'miPoint.ru', 'href' => '/'],
    ['name' => 'Каталог', 'href' => '/catalog']
  ];
  if(isset($id)){
    $item = getCatalogItemFromDb($id);
    $breadCrumbs[] = [
      'name' => $item[name]
    ];
  }
?>
<main>
  <div id="content-wrapper">
    <div class="container bread-crumbs">
      <ol class="breadcrumb">
        <?php breadCrumbsRender($breadCrumbs);?>
      </ol> 
    </div>
    <?php !isset($_GET[item_id]) ? catalogView() : catalogItemView($id); ?>
  </div>
</main>