<main>
  <div id="content-wrapper">
    <div id="contact-form">
      <form class="contact-form" action="URL">
        <h2> Напишите нам </h2>
        <p class="form-text">Имя:</p>
        <p><input type="text" class="text_field"></p>
        <p class="form-text">Телефон:</p>
        <p><input type="tel"></p>
        <p class="form-text">E-mail: </p>
        <p><input type="email" id="email"></p>
        <p class="form-text">Выберите предпочтительный способ связи</p>
        <p>
          <select name="callback_method">
            <option selected> </option>
            <option>e-mail</option>
            <option>Телефон</option>
          </select>
        </p>
        <p class="form-text">Тема сообщения </p>
        <p>
          <input list="article">
          <datalist id="article">
            <option value="сотрудничество"></option>
            <option value="претензия"></option>
            <option value="оплата"></option>
            <option value="доставка"></option>
          </datalist>
        </p>
        <p class="form-text">Текст сообщения:</p>
        <p><textarea rows="10" cols="20"></textarea> </p>
        <p><input type="submit" value="Отправить" class="sendbutton"></p>
      </form>
    </div>
    <div id="map">
      <iframe src="https://api-maps.yandex.ru/frame/v1/-/CZDqbXom" style="border: #ff8700 1px solid; width:85%; height:374px; border: 26px solid transparent;
        -webkit-box-shadow: 20px #e7e7e7;
        -moz-box-shadow: 20px #e7e7e7;
        box-shadow: 0 0 20px #e7e7e7;"></iframe>
      <p class="contact-info-text">
        Наш телефон: +74951111111
      </p>
      <p class="contact-info-text">
        Склад и шоу-рум находятся по адресу: г. Москва, Промышленный проезд, 8
      </p>
      <p class="contact-info-text">
        <a href="mailto:contact@mipoint.com">contact@mipoint.com</a>
      </p>
      <p class="contact-info-text">
        Мы открыты по будним дням с 10 до 18 часов
      </p>
    </div>
  </div>
</main>