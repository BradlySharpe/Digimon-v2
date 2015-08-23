<?php

  class Json {
    function error($message) {
      echo json_encode(
        array(
          'error' => true,
          'message' => $message
        )
      );
      die();
    }

    function respond($data) {
      echo json_encode(
        array(
          'error' => false,
          'data' => $data
        )
      );
    }
  }
