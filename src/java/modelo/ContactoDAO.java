package modelo;
import conexionsql.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ContactoDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public List listar() {
        List<Contacto> lista = new ArrayList();
        String sql = "select * from consulta";
        try {
            ps = cn.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contacto c = new Contacto();
                c.setId(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setApellido(rs.getString(3));
                c.setEmail(rs.getString(4));
                c.setMensaje(rs.getString(5));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar consultas :" + e);
        }
        return lista;
    }
    public int AgregarConsulta(Contacto c){
        String sql="INSERT INTO consulta (nombre, apellido, correo, mensaje)values(?,?,?,?)";
        try {
           con = cn.getConnection();
         ps = con.prepareStatement(sql);
         ps.setString(1, c.getNombre());
         ps.setString(2, c.getApellido());
         ps.setString(3, c.getEmail());
         ps.setString(4, c.getMensaje());
         ps.executeUpdate();
         
        } catch (Exception e) {
        }return 1;
        
    }
    
    public void deleteConsulta(int id) {
        String sql = "delete from consulta where idConsulta=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("el error es " + e);
        }
    }
}
