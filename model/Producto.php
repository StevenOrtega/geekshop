<?php

/**
 * Description of Producto
 *
 * @author Jordy
 */
class Producto {
    private $codProducto, $stock, $descripcion, $precioUnit, $idProveedor, $tipoProducto;
    function __construct($codProducto, $stock, $descripcion, $precioUnit, $idProveedor, $tipoProducto) {
        $this->codProducto = $codProducto;
        $this->stock = $stock;
        $this->descripcion = $descripcion;
        $this->precioUnit = $precioUnit;
        $this->idProveedor = $idProveedor;
        $this->tipoProducto = $tipoProducto;
    }

        

    function getTipoProducto() {
        return $this->tipoProducto;
    }

    function getCodProducto() {
        return $this->codProducto;
    }

    function getStock() {
        return $this->stock;
    }

    function getDescripcion() {
        return $this->descripcion;
    }

    function getPrecioUnit() {
        return $this->precioUnit;
    }

    function getIdProveedor() {
        return $this->idProveedor;
    }


}
