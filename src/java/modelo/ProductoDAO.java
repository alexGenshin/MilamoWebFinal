package modelo;

import conexionsql.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class ProductoDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    Producto p= new Producto();
    public List listar() {
        List<Producto> productos = new ArrayList();
        String sql = "select * from producto";
        try {
            ps = cn.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                productos.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar Productos"+e);
        }
        return productos;
    }
    
    public Producto listarId(int id){
        String sql="select * from producto where idProducto="+id;
        Producto p=new Producto();
        
        try {
            
         con = cn.getConnection();
         ps = con.prepareStatement(sql);
         rs = ps.executeQuery();
          while(rs.next()){
              
               p.setId(rs.getInt(1));
               p.setNombre(rs.getString(2));
               p.setImagen(rs.getString(3));
               p.setDescripcion(rs.getString(4));
               p.setPrecio(rs.getDouble(5));
               p.setStock(rs.getInt(6));
          }
                 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
  public int AgregarNuevoProducto(Producto p){
        String sql="insert into producto(Nombre,Imagen,Descripcion,Precio,Stock)values(?,?,?,?,?)";
        try {
            ps=cn.getConnection().prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getImagen());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getStock());
            ps.executeUpdate();
            System.out.println(r+"WTRDF---");
        } catch (Exception e) {
            System.out.println("el error es : "+e);
        }
        return r;
    }
  
  public int actualizar(Producto p){
      String sql="update producto set Nombre=?,Imagen=?,Descripcion=?,Precio=?,Stock=? where idProducto=?";
        try {
            ps=cn.getConnection().prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getImagen());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getStock());
            ps.setInt(6,p.getId());
           ps.executeUpdate();
            System.out.println("---EDIT-------"+r);
        } catch (Exception e) {
            e.printStackTrace();
        }
          return r;
  }
  
  public void delete(int id){
        String sql="delete from  producto where IdProducto="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
}
  public List buscarprod(String texto) {
      List<Producto> busquedaproducto = new ArrayList();
        String sql = "select * from producto where IdProducto like '%" + texto + "%' or Nombre like '%" + texto + "%'";
        try {
            ps = cn.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                busquedaproducto.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar Productos"+e);
        }
        return busquedaproducto;
  }
}
