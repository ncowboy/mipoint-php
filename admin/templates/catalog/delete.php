<?php

$get_id = $_GET[id] ?? '';
$id = (int) htmlspecialchars(strip_tags($get_id));

actionItemDelete($id);
