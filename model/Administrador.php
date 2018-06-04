<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Administrador
 *
 * @author Jordy
 */
class Administrador {
    private $idAdministrador, $correo, $password;
    
    function __construct($idAdministrador, $correo, $password) {
        $this->idAdministrador = $idAdministrador;
        $this->correo = $correo;
        $this->password = $password;
    }
    function getIdAdministrador() {
        return $this->idAdministrador;
    }

    function getCorreo() {
        return $this->correo;
    }

    function getPassword() {
        return $this->password;
    }


}
