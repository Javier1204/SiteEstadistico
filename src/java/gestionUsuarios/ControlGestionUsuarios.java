/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DAOs.GeneralModuloDAO;
import gestionUsuarios.DAOs.GeneralPrivilegioDAO;
import gestionUsuarios.DAOs.GeneralRolDAO;
import gestionUsuarios.DAOs.GeneralUsuarioDAO;
import gestionUsuarios.DAOs.GeneralUsuarioRolDAO;
import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RolDTO;
import gestionUsuarios.DTOs.UsuarioDTO;
import java.util.ArrayList;
import java.util.List;
import gestionUsuarios.DAOs.ConexionGUDAOs;
import java.sql.Connection;

/**
 *
 * @author Lenovo
 */
public class ControlGestionUsuarios {

    private ControlGestionUsuarios() {
    }

    protected static ControlGestionUsuarios getInstance() {
        return new ControlGestionUsuarios();
    }

    protected ICuenta loggearUser(String rol, String user, String pass) {
        System.out.println("INICIO de logueo");
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            if (!this.existeUsuario(rol, user, con))return null;
            if (!this.validaPass(user, pass, con)) return null;
            ICuenta cuenta = cargarCuenta(rol, user, pass, con);
            System.out.println("FIN de logueo");
            return cuenta;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }

    }

    private boolean existeUsuario(String rol, String user, Connection con) {
        GeneralUsuarioRolDAO ur = new GeneralUsuarioRolDAO(con);
        return ur.existe(rol, user);
    }

    private boolean validaPass(String user, String pass, Connection con) {
        String ePass = encriptar(pass);
        GeneralUsuarioDAO us = new GeneralUsuarioDAO(con);
        return ePass.equals(us.getPass(user));
    }

    private String encriptar(String dato) {
        return dato;
    }

    private ICuenta cargarCuenta(String rol, String user, String pass, Connection con) {
        Cuenta cuenta = new Cuenta();
        GeneralUsuarioDAO us = new GeneralUsuarioDAO(con);
        UsuarioDTO u = us.getUsuario(user);
        ArrayList<RolDTO> roles = (ArrayList<RolDTO>) new GeneralUsuarioRolDAO(con).obtenerRoles(user);
        GeneralPrivilegioDAO pdao = new GeneralPrivilegioDAO(con);
        PrivilegioDTO priv = pdao.getPrivilegioUsuario(user);
        cuenta.construirCuenta(u, roles, priv);
        return cuenta;
    }

    protected List<ModuloDTO> listarModulos() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            return new GeneralModuloDAO(con).listaModulos();
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected List<RolDTO> listarRoles() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralRolDAO roldao = new GeneralRolDAO(con);
            return roldao.listarRoles();
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }

    }
}
