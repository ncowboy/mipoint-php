<div id="item-short-description-wrapper">
  <div id="item-photo"> 
    <a href="<?=CAT_IMG_DIR . "/" . $catalogItem[full_img]?>" target="_blank">
      <img class="desc_img" src="<?=CAT_IMG_DIR . "/" . $catalogItem[small_img]?>" alt="<?=$catalogItem[alias]?>"></a>
  </div>
  <div id="item-short-description">
    <p class="image-preview-header"><?=$catalogItem[alias]?></p>
    <div id="review-block">
      <div class="review"><a href="#">3 отзыва</a></div>
      <div class="review"><a href="#">Добавить отзыв</a></div>
    </div>
    <?=$catalogItem[short_desc]?>
  </div>
  <div id="price-tocart">
    <div id="price"><span>&#x584;&nbsp;<?=$catalogItem[price]?> </span></div>
    <div id="tocart"><a href="/add-to-cart?item_id=<?=$catalogItem[id];?>"></a><img src="img/add-to-cart.png" alt="Добавить в корзину">В корзину</div>
    <hr class="short-description-line">
  </div>
  <div id="compare-wishlist-email">
    <div class="compare-wishlist-email-blocks">
      <p id="wishlist"><a href="#"></a></p>
      В вишлист
    </div>
    <div class="compare-wishlist-email-blocks">
      <p id="compare"><a href="#"></a></p>
      К сравнению
    </div>
    <div class="compare-wishlist-email-blocks">
      <p id="sendfriend"><a href="#"></a></p>
      Отправить другу
    </div>
  </div>
</div>
<hr class="short-description-line">
<div id="item-description">
  <?=$catalogItem[full_desc]?>
</div>