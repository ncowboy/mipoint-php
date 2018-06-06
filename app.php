<?php
require_once 'engine/autoload.php';
strripos(uriController(), '/admin') === 0 ? 
    require_once 'admin/templates/layout.tpl' : 
    require_once 'templates/layout.tpl' ;

