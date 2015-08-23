<?php
  require('DBase.php');
  require('User.php');

  class Logic {
    private $db;
    private $output;
    private $user;

    public function __construct($_output) {
  		$this->output = $_output;
      $this->db = new DBase($this);
      $this->user = new User($this->db);
  	}

    public function loginUser($email, $password) {
      if ($this->user->login($email, $password)) {
        $this->fastForward();
      } else
        $this->output->error("Invalid Credentials");
    }

    /**
     * fastForward Run game logic while player was offline
     */
    private function fastForward() {

    }

    /**
     * getState Get current game state
     */
    public function getState() {
      $this->output->respond(['state' => []]);
    }


  }
