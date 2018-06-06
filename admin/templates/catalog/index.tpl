<?php $items = getCatalogItemsFromDb();?>
<main>
  <div id="content-wrapper">
    <div class="container">
        <p></p>    
      <p>
        <a class="btn btn-primary" href="catalog/create"><span class="glyphicon glyphicon-plus"></span> Добавить</a>    
      </p>  
      <table class="table table-hover table-striped table-bordered">
        <thead>
          <tr>
            <th>id</th>
            <th>Фото</th>
            <th>Название</th>
            <th>Цена</th>
            <th>Действия</th>
          </tr>
        </thead>
      <tbody>  
<?php foreach ($items as $item) : ?>
          <tr>
            <th><?=$item[id]?></th>
            <th><img src="/img/catalog/<?=$item[img_cat]?>"></th>
            <th><?=$item[alias]?></th>
            <th><?=$item[price]?></th>
            <th>
              <a class="btn btn-xs btn-default" href="/catalog?item_id=<?=$item[id]?>"><span class="glyphicon glyphicon-eye-open"></span> Просмотр</a>  
              <a class="btn btn-xs btn-info" href="catalog/update?id=<?=$item[id]?>"><span class="glyphicon glyphicon-pencil"></span> Редактировать</a>
              <a class="btn btn-xs btn-danger" href="catalog/delete?id=<?=$item[id]?>"><span class="glyphicon glyphicon-trash"></span> Удалить</a>
            </th>
          </tr>  
<?php endforeach;?>  
      </tbody>    
    </table>    
    </div>
  </div>    
</main>