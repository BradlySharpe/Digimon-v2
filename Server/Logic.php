<?php
  require('DBase.php');

  class Logic {
    private $db;
    private $output;

    public function __construct($_output) {
  		$this->output = $_output;
      $this->db = new DBase($this);
  	}

    public function loginUser($username, $password) {
      $this->output(array(
        'loggedIn' => false
      ));
    }
  }
