<?php
  $order = findBasketItems(findBasketId());
  $total = basketTotal(findBasketId());
  ?>
<main>
  <div id="content-wrapper">
    <div class="container">
      <p>
      <h2>Корзина</h2>
      </p>
      <?php if (isset($order)) : ?>       
      <table class="table table-hover table-striped table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Фото</th>
            <th>Название</th>
            <th>Цена</th>
            <th style="width:10%">Количество</th>
            <th></th>
            <th>Сумма</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($order as $key => $item) : ?>
          <tr>
            <th><?=$key + 1 ?></th>
            <th><img width="40" src="/img/catalog/<?=$item[img_cat]?>"></th>
            <th><?=$item[alias]?></th>
            <th><?=$item[price]?></th>
            <th>
              <form role="form" method="POST">
                <input type="hidden" name="id_item" value="<?=$item[id_item]?>">
                <input type="hidden" name="id_basket" value="<?=$item[id_basket]?>"> 
                <input style="width: 50%" type="number" min="0" name="qty_update" value="<?=$item[quantity]?>">
                <button class="btn btn-primary btn-sm" type="submit" name="qty_submit">
                <i class="glyphicon glyphicon-refresh"></i>
                </button>
              </form>
            </th>
            <th>
              <form method="POST">
                <input type="hidden" name="id_item" value="<?=$item[id_item]?>">
                <input type="hidden" name="id_basket" value="<?=$item[id_basket]?>"> 
                <button class="btn btn-danger btn-sm" type="submit" name="item_delete">
                <i class="glyphicon glyphicon-trash"></i>
                </button>
              </form>
            </th>
            <th><?=$item[quantity] * $item[price]?></th>
          </tr>
          <?php endforeach;?>       
        </tbody>
      </table>
      <p>Итого наименований: <?= $total[total_count]?> на сумму: <?=$total[total_sum]?></p>
      <div class="pull-right">
        <form method="POST">
          <input type="hidden" name="id_basket" value="<?= findBasketId()?>"> 
          <button class="btn btn-danger" type="submit" name="basket_delete">
          <i class="glyphicon glyphicon-trash"></i> Очистить корзину
          </button>
        </form>
      </div>
      <div class="pull-left"><a class="btn btn-success" href="#"><i class="glyphicon glyphicon-shopping-cart"></i> Оформить заказ</a>
      </div>
      <?php else :?>
      <p>Корзина пуста</p>
      <?php endif;?>
    </div>
  </div>
</main>