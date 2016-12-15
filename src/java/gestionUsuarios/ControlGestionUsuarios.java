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
            if (!this.existeUsuario(user, con)) {
                return null;
            }
            if (!this.validaPass(user, pass, con)) {
                return null;
            }
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
        us.cargarNombre(u);
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
            List<ModuloDTO> mods=new GeneralModuloDAO(con).listaModulos();
            GeneralRequerimientoFDAO rfDAO=new GeneralRequerimientoFDAO(con);
            for (ModuloDTO mod : mods) {
                mod.setRequerimientos((ArrayList<RequerimientosFDTO>) rfDAO.getRFs(mod.getNombre()));
            }
            return mods;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected List<ModuloDTO> listarModulosConRFs() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            ArrayList<ModuloDTO> lista = (ArrayList<ModuloDTO>) new GeneralModuloDAO(con).listaModulos();
            for (ModuloDTO mod : lista) {
                GeneralRequerimientoFDAO rfDAO = new GeneralRequerimientoFDAO(con);

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

    protected List<String> asignarRoles(String usuario, List<String> roles) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        ArrayList<String> noAgregados = new ArrayList<String>();
        try {
            GeneralUsuarioRolDAO urDAO = new GeneralUsuarioRolDAO(con);
            for (String role : roles) {
                if (!urDAO.insertar(usuario, role)) {
                    noAgregados.add(role);
                }
            }
            return noAgregados;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean registrarUsuario(String usuario, String pass) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioDAO uDAO = new GeneralUsuarioDAO(con);
            return uDAO.insertar(usuario, pass);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected List<UsuarioDTO> filtrarUsuario(String clave){
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioRolDAO uDAO = new GeneralUsuarioRolDAO(con);
            return uDAO.filtrarUsuarios(clave);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected boolean registrarModulo(String nombreModulo, String descripcion, String url) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralModuloDAO mDAO = new GeneralModuloDAO(con);
            ModuloDTO mod = new ModuloDTO();
            mod.setNombre(nombreModulo);
            mod.setDescripcion(descripcion);
            mod.setUrl(url);
            return mDAO.insertar(mod);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean registrarRol(String rol, String descripicion) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            RolDTO rolDTO = new RolDTO();
            rolDTO.setRol(rol);
            rolDTO.setDescripcion(descripicion);
            GeneralRolDAO rolDAO = new GeneralRolDAO(con);
            return rolDAO.insertarRol(rolDTO);

        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean registrarRF(String nombreModulo, String RF, String nombreRF, String url) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            RequerimientosFDTO rfDTO = new RequerimientosFDTO();
            rfDTO.setId(RF);
            rfDTO.setNombre(nombreRF);
            rfDTO.setUrl(url);
            GeneralRequerimientoFDAO rfDAO = new GeneralRequerimientoFDAO(con);
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
                    GeneralPrivilegioDAO pDAO = new GeneralPrivilegioDAO(con);
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
            return this.listarRF(modulo, con);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    private List<RequerimientosFDTO> listarRF(String modulo, Connection con) {
        GeneralRequerimientoFDAO rfDAO = new GeneralRequerimientoFDAO(con);
        return rfDAO.getRFs(modulo);
    }

    protected List<UsuarioDTO> listarUsuarios() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioDAO usuDAO = new GeneralUsuarioDAO(con);
            return usuDAO.listarUsuarios();

        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean eliminarModulo(String modulo) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            
            ArrayList<RequerimientosFDTO> listaRFs = (ArrayList<RequerimientosFDTO>) this.listarRF(modulo, con);

            for (RequerimientosFDTO listaRF : listaRFs) {
                this.eliminarRF(listaRF.getId(), modulo, con);
            }
            GeneralModuloDAO moduloDAO = new GeneralModuloDAO(con);
            return moduloDAO.elminarModulo(modulo);

        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected void eliminarRF(String modulo, String rf) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            this.eliminarRF(rf, modulo, con);
            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    private boolean eliminarRF(String rf, String modulo, Connection con) {
        GeneralPrivilegioDAO privilegioDAO = new GeneralPrivilegioDAO(con);
        GeneralRequerimientoFDAO rfDAO=new GeneralRequerimientoFDAO(con);
        privilegioDAO.eliminarRF(modulo, rf);
        return rfDAO.eliminarRF(rf, modulo);
    }

    protected boolean modificarModulo(String modulo, String nuevaDescripcion, String url) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralModuloDAO moduloDAO = new GeneralModuloDAO(con);
            return moduloDAO.modificarModulo(modulo, nuevaDescripcion, url);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean modificarRF(String modulo, String rf, String nuevoNombre, String nuevaURL) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralRequerimientoFDAO rfDAO = new GeneralRequerimientoFDAO(con);
            return rfDAO.modificarRF(modulo, rf, nuevoNombre, nuevaURL);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected void quitarPrivilegios(String rol, PrivilegioDTO privilegios) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralPrivilegioDAO privilegioDAO = new GeneralPrivilegioDAO(con);
            for (ModuloDTO mod : privilegios.getModulos()) {
                for (RequerimientosFDTO rf : mod.getRequerimientos()) {
                    if (!privilegioDAO.eliminarPrivilegio(rol, mod.getNombre(), rf.getId())) {
                        System.out.println("rol: " + rol + " modulo: " + mod.getNombre() + " requerimiento: " + rf.getId());
                    }
                }
            }
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean eliminarRol(String rol) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioRolDAO urDAO = new GeneralUsuarioRolDAO(con);
            urDAO.eliminarPorRol(rol);
            GeneralPrivilegioDAO privilegioDAO = new GeneralPrivilegioDAO(con);
            privilegioDAO.eliminarPorRol(rol);
            GeneralRolDAO rolDAO = new GeneralRolDAO(con);
            return rolDAO.eliminarRol(rol);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected void quitarRoles(String usuario, List<String> roles) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioRolDAO urDAO = new GeneralUsuarioRolDAO(con);
            for (String rol: roles) {
                urDAO.eliminar(usuario, rol);
            }            
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean modificarRol(String rol, String nuevaDescripcion) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralRolDAO rolDAO = new GeneralRolDAO(con);
            return rolDAO.modificar(rol, nuevaDescripcion);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean eliminarUsuario(String usuario) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioRolDAO urDAO = new GeneralUsuarioRolDAO(con);
            urDAO.eliminarPorUsuario(usuario);
            GeneralUsuarioDAO usuDAO = new GeneralUsuarioDAO(con);
            return usuDAO.eliminar(usuario);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }

    protected boolean cambiarContrasena(String usuario, String nuevaContra) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioDAO usuDAO = new GeneralUsuarioDAO(con);
            return usuDAO.modificar(usuario, nuevaContra);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected List<RolDTO> cargarRolesUsuario(String usuario) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioRolDAO urDAO=new GeneralUsuarioRolDAO(con);
            return urDAO.obtenerRoles(usuario);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected PrivilegioDTO cargarPrivilegio(String rol) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralPrivilegioDAO privilegioDAO=new GeneralPrivilegioDAO(con);
            return privilegioDAO.getPrivilegioUsuarioPorRol(rol);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    public boolean actualizarRoles(String usuario, List<String> roles) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralUsuarioRolDAO urDAO=new GeneralUsuarioRolDAO(con);
            urDAO.eliminarPorUsuario(usuario);
            for (String role : roles) {
                urDAO.insertar(usuario, role);
            }
            return true;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected boolean actualizarPrivilegios(String rol, PrivilegioDTO privilegio) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralPrivilegioDAO privilegioDAO=new GeneralPrivilegioDAO(con);
            privilegioDAO.eliminarPorRol(rol);
            for ( ModuloDTO mod : privilegio.getModulos()) {
                for (RequerimientosFDTO rfDTO : mod.getRequerimientos()) {
                    privilegioDAO.insertarPrivilegio(rol, rfDTO.getId(), mod.getNombre());
                }
            }
            return true;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected List<RolDTO> listarRolesPrivilegios() {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralRolDAO roldao = new GeneralRolDAO(con);
            GeneralPrivilegioDAO privilrgioDAO= new GeneralPrivilegioDAO(con);
            List<RolDTO> roles= roldao.listarRoles();
            for (RolDTO rol : roles) {
                rol.setPrivilegio(privilrgioDAO.getPrivilegioUsuarioPorRol(rol.getRol()));
            }
            return roles;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected ModuloDTO cargarNotRFModulo(String modulo, String rol) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            GeneralPrivilegioDAO privilegioDAO=new GeneralPrivilegioDAO(con);
            return privilegioDAO.cargarNoRFModulo(modulo, rol);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected List<ModuloDTO> cargarNoModuloRol(String rol) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            return new GeneralModuloDAO(con).listarModulosNoRol(rol);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected List<RolDTO> cargarNotRolUsuario(String usuario) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            return new GeneralRolDAO(con).cargarNotRolUsuario(usuario);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected UsuarioDTO obtenerUsuario(String usuario) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            UsuarioDTO userDTO= new GeneralUsuarioDAO(con).getUsuario(usuario);
            new GeneralUsuarioDAO(con).cargarNombre(userDTO);
            return userDTO;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected List<String> elimnarRFs(String modulo, List<String> rfs) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            ArrayList<String> noEliminados=new ArrayList<>();
            for (String rf : rfs) {
                if(!this.eliminarRF(rf, modulo, con)){
                    noEliminados.add(rf);
                }                
            }
            return noEliminados;
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    protected RequerimientosFDTO obtenerRF(String modulo, String rf) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            return new GeneralRequerimientoFDAO(con).getRF(modulo, rf);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
    
    protected ModuloDTO obtenerModulo(String modulo) {
        Connection con = ConexionGUDAOs.obtenerConexion();
        try {
            return new GeneralModuloDAO(con).getModulo(modulo);
        } finally {
            ConexionGUDAOs.cerrarConexion(con);
        }
    }
}
