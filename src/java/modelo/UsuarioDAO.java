package modelo;

import conexionsql.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Usuario Validar(String email, String pass) {
        String sql="select * from usuario where Email=? and Password=?";
        Usuario c=new Usuario();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombres(rs.getString(3));
                c.setDireccion(rs.getString(4));
                c.setEmail(rs.getString(5));
                c.setPass(rs.getString(6));
                c.setRol(rs.getString(7));
            }
        } catch (Exception e) {
        }
        return c;        
    }
    public int AgregarUsuario(Usuario c) {
        String sql="INSERT INTO usuario (Dni, Nombres, Direccion, Email, Password,rol)values(?,?,?,?,?,?)";        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1,c.getDni());
            ps.setString(2, c.getNombres());
            ps.setString(3, c.getDireccion());
            ps.setString(4, c.getEmail());
            ps.setString(5, c.getPass());
            ps.setString(6, c.getRol());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;        
    }
        public List listar() {
        List<Usuario> lista = new ArrayList();
        String sql = "select * from usuario";
        try {
            ps = cn.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt(1));
                u.setDni(rs.getString(2));
                u.setNombres(rs.getString(3));
                u.setDireccion(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPass(rs.getString(6));
                u.setRol(rs.getString(7));
                lista.add(u);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar Productos" + e);
        }
        return lista;
    }
        public Usuario listarId(int id) {
        Usuario u = new Usuario();
        String sql = "select * from usuario where idUsuario=" + id;

        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt(1));
                u.setDni(rs.getString(2));
                u.setNombres(rs.getString(3));
                u.setDireccion(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPass(rs.getString(6));
                u.setRol(rs.getString(7));

            }

        } catch (Exception e) {
            System.out.println("el error es " + e);
        }
        return u;
    }

    public int ActualizarUsuario(Usuario u) {
        String sql = "update usuario set Dni=?, Nombres=?, Direccion=?, Email=?, Password=?,rol=? where idUsuario=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getDni());
            ps.setString(2, u.getNombres());
            ps.setString(3, u.getDireccion());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPass());
            ps.setString(6, u.getRol());
            ps.setInt(7, u.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("el error es " + e);
        }
        return 1;
    }

    public void deleteUsuario(int id) {
        String sql = "delete from usuario where idUsuario=" + id;
        try {
            System.out.println("El id es wtf"+id);
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("el error es " + e);
        }
    }

    public List buscar(String texto) {
        List<Usuario> busquedaUsuario = new ArrayList();
        String sql = "select * from usuario where IdUsuario like '%" + texto + "%' or Nombres like '%" + texto + "%' or rol like '%" + texto + "%' or Direccion like '%" + texto + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt(1));
                u.setDni(rs.getString(2));
                u.setNombres(rs.getString(3));
                u.setDireccion(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPass(rs.getString(6));
                u.setRol(rs.getString(7));
                busquedaUsuario.add(u);
                
                
            }
        } catch (Exception e) {
            System.out.println("el error es :"+e);
        }
        return busquedaUsuario;
    }
}
