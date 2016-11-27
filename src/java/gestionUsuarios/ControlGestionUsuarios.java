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
import gestionUsuarios.DAOs.GeneralRequerimientoFDAO;
import gestionUsuarios.DTOs.RequerimientosFDTO;
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

    protected ICuenta loggearUser(String user, String pass) {
        System.out.println("INICIO de logueo");
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            if (!this.existeUsuario(user, con))return null;
            if (!this.validaPass(user, pass, con)) return null;
            ICuenta cuenta = cargarCuenta(user, pass, con);
            System.out.println("FIN de logueo");
            return cuenta;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }

    }

    private boolean existeUsuario(String user, Connection con) {
        GeneralUsuarioDAO ur = new GeneralUsuarioDAO(con);
        return ur.existeUser(user);
    }

    private boolean validaPass(String user, String pass, Connection con) {
        String ePass = encriptar(pass);
        GeneralUsuarioDAO us = new GeneralUsuarioDAO(con);
        return ePass.equals(us.getPass(user));
    }

    private String encriptar(String dato) {
        return dato;
    }

    private ICuenta cargarCuenta(String user, String pass, Connection con) {
        Cuenta cuenta = new Cuenta();
        GeneralUsuarioDAO us = new GeneralUsuarioDAO(con);
        UsuarioDTO u = us.getUsuario(user);
        ArrayList<RolDTO> roles = (ArrayList<RolDTO>) new GeneralUsuarioRolDAO(con).obtenerRoles(user);
        for (RolDTO role : roles) {
            GeneralPrivilegioDAO pdao = new GeneralPrivilegioDAO(con);
            PrivilegioDTO priv = pdao.getPrivilegioUsuarioPorRol(role.getRol());
            role.setPrivilegio(priv);
        }        
        cuenta.construirCuenta(u, roles);
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
    
    protected List<ModuloDTO> listarModulosConRFs() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            ArrayList<ModuloDTO> lista= (ArrayList<ModuloDTO>) new GeneralModuloDAO(con).listaModulos();
            for (ModuloDTO mod : lista) {
                GeneralRequerimientoFDAO rfDAO=new GeneralRequerimientoFDAO(con);
                
                mod.setRequerimientos((ArrayList<RequerimientosFDTO>) rfDAO.getRFs(mod.getNombre()));
            }
            return lista;
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
    
    protected List<String> asignarRoles(ICuenta usuario, List<String> roles) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        ArrayList<String> noAgregados=new ArrayList<String>();
        try {
            GeneralUsuarioRolDAO urDAO=new GeneralUsuarioRolDAO(con);
            for (String role : roles) {
                if(!urDAO.insertar(usuario.getUser(), role))noAgregados.add(role);
            }
            return noAgregados;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected boolean registrarUsuario(String usuario, String pass) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioDAO uDAO=new GeneralUsuarioDAO(con);
            return uDAO.insertar(usuario, pass);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected boolean registrarModulo(String nombreModulo, String descripcion, String url) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralModuloDAO mDAO=new GeneralModuloDAO(con);
            ModuloDTO mod=new ModuloDTO();
            mod.setNombre(nombreModulo);
            mod.setDescripcion(descripcion);
            mod.setUrl(url);
            return mDAO.insertar(mod);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected boolean registrarRol(String rol, String descripicion){
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            RolDTO rolDTO=new RolDTO();
            rolDTO.setRol(rol);
            rolDTO.setDescripcion(descripicion);
            GeneralRolDAO rolDAO=new GeneralRolDAO(con);
            return rolDAO.insertarRol(rolDTO);
            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected boolean registrarRF(String nombreModulo, String RF, String nombreRF, String url){
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            RequerimientosFDTO rfDTO=new RequerimientosFDTO();
            rfDTO.setId(RF);
            rfDTO.setNombre(nombreRF);
            rfDTO.setUrl(url);
            GeneralRequerimientoFDAO rfDAO=new GeneralRequerimientoFDAO(con);
            return rfDAO.insertarRF(rfDTO, nombreModulo);
            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected void asignarPrivilegios(String rol, PrivilegioDTO privilegios) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            for (ModuloDTO mod : privilegios.getModulos()) {
                for (RequerimientosFDTO rfs : mod.getRequerimientos()) {
                    GeneralPrivilegioDAO pDAO=new GeneralPrivilegioDAO(con);
                    pDAO.insertarPrivilegio(rol, rfs.getId(), mod.getNombre());
                }
            }
            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected List<RequerimientosFDTO> listarRF(String modulo) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralRequerimientoFDAO rfDAO=new GeneralRequerimientoFDAO(con);
            return rfDAO.getRFs(modulo);
            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected List<UsuarioDTO> listarUsuarios() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioDAO usuDAO=new GeneralUsuarioDAO(con);
            return usuDAO.listarUsuarios();
            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
}
