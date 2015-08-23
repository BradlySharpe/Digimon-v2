<?php
  require('Logic.php');
  require('Json.php');

  $json = new Json();
  foreach ($json->getHeaders() as $value) {
    header($value);
  }

  $logic = new Logic($json);
  $logic->loginUser('fake@bradlysharpe.com.au', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8');
  //Continue Game logic - dies if not logged in
  $logic->getState();
