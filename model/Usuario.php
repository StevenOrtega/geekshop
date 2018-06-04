<?php

/**
 * Description of Usuario
 *
 * @author Jordy
 */
class Usuario {
    private $correo, $password;
    function __construct($correo, $password) {
        $this->correo = $correo;
        $this->password = $password;
    }

    function getCorreo() {
        return $this->correo;
    }

    function getPassword() {
        return $this->password;
    }


}
