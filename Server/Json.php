<?php

  class Json {
    function getHeaders() {
      return [
        'Content-Type: application/json'
      ];
    }

    function error($message) {
      echo json_encode(
        [
          'error' => true,
          'message' => $message
        ]
      );
      die();
    }

    function respond($data) {
      echo json_encode(
        [
          'error' => false,
          'data' => $data
        ]
      );
    }
  }
