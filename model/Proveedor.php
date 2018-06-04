<?php

class Proveedor {
    private  $idProveedor,$nombre,$telefono,$correo;
    
    function __construct($idProveedor, $nombre, $telefono, $correo) {
        $this->idProveedor = $idProveedor;
        $this->nombre = $nombre;
        $this->telefono = $telefono;
        $this->correo = $correo;
    }
    function getIdProveedor() {
        return $this->idProveedor;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getTelefono() {
        return $this->telefono;
    }

    function getCorreo() {
        return $this->correo;
    }


    
}
