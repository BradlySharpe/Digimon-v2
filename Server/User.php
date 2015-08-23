<?php

  class User {
    private $db;
    private $id;

    public function __construct($_db) {
  		$this->db = $_db;
  	}

    public function getId() {
      return $this->id;
    }

    public function exists($email) {
      if (!empty($email)) {
        $sql = "SELECT `email` FROM User WHERE `email` = '" . $this->db->escape($email) . "'";
        $users = $this->db->fetchAll($sql);
        return (1 == count($users) && $email == $users[0]['email']);
      }
      return false;
    }

    public function login($email, $password) {
      if ($this->exists($email) && !empty($password)) {
        $sql = "SELECT `id` FROM User WHERE `active` = 1 AND `email` = '" . $this->db->escape($email) . "' AND `password` = '" . $this->db->escape($password) . "'";
        $user = $this->db->fetchOne($sql);
        $this->id = $user['id'];
        return true;
      }
      return false;
    }
  }
