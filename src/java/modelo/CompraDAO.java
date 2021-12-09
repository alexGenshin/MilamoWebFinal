
package modelo;

import conexionsql.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class CompraDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    public int GenerarCompra(Compra compra){
        int idCompras;
        String sql="insert into compras(idUsuario,FechaCompras,Monto,Estado,idPago)values(?,?,?,?,?)";
        try {
            con=cn.getConnection();
            System.out.println("IDPAGO-SQL= "+compra.getIdpago());
            ps=con.prepareStatement(sql);
            ps.setInt(1, compra.getUsuario().getId());
            ps.setString(2, compra.getFecha());
            ps.setDouble(3, compra.getMonto());
            ps.setString(4,compra.getEstado());
            ps.setInt(5, compra.getIdpago());
            r=ps.executeUpdate();
            sql="Select @@IDENTITY as idCompras";
            rs=ps.executeQuery(sql);
            rs.next();
            idCompras=rs.getInt("idCompras");
            rs.close();
             for(CarroCompras detalle:compra.getDetalleCompra() ){
                 sql="insert into detalle_compras(idProducto,idCompras,Cantidad,PrecioCompra)values(?,?,?,?)";
                 ps=con.prepareStatement(sql);
                 ps.setInt(1,detalle.getIdProducto());
                 ps.setInt(2, idCompras);
                 ps.setInt(3, detalle.getCantidad());
                 ps.setDouble(4, detalle.getPreciocompra());
                 r=ps.executeUpdate();
             }
        } catch (Exception e) {
            System.out.println("Error Generar Compra SQL: "+e);
        }
        System.out.println("Si todo OK r=1 sino r=0");
        return r;
    }
    //update producto set precio=precio + 1 where idProducto=5
    
    
   public List Detalle(int idCompra){
       List listaDetalle=new ArrayList<>();
        String sql = "select DC.idDetalle, P.Imagen, P.Nombre, DC.idCompras, DC.Cantidad, DC.PrecioCompra "
                + "FROM detalle_compras DC inner join producto P on P.idProducto = DC.idProducto where idCompras=" + idCompra;
                try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra com = new Compra();

                com.setIdDetalle(rs.getInt(1));
                com.setProducto(new Producto());
                com.getProducto().setImagen(rs.getString(2));
                com.getProducto().setNombre(rs.getString(3));
                com.setIdcompra(rs.getInt(4));
                com.setCantidad(rs.getInt(5));
                com.setMonto(rs.getDouble(6));
                listaDetalle.add(com);
            }
        } catch (Exception e) {
                    System.out.println("Error Detalle"+e);
        }
       return listaDetalle;
   } 
        public int Pagar(double monto) {
        String sql = "insert into pago(Monto)values(?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, monto);
            ps.executeUpdate();
        } catch (Exception e) {
             System.out.println("Error Pagar Compra SQL: "+e);
        }
        return 1;
    }
        public int getIdPago(){
            int idPago = 0;
            try {
            ps=cn.getConnection().prepareStatement("select max(idPago) from pago");    
            rs=ps.executeQuery();
            while (rs.next()) {
                System.out.println("getIDPAGO_SQL= "+rs.getInt(1));
            idPago = rs.getInt(1);
                System.out.println("idPago--"+idPago);
            }
            } catch (Exception e) {
                 System.out.println("Error getIdPago()  SQL: "+e);
            }
            
            return idPago;
        }
       
        
        public List<Compra> misCompras(int id) {
        List<Compra> lista = new ArrayList();
        String sql = "select idCompras,idPago,FechaCompras,Monto,Estado from compras where idUsuario=" + id;
        try {
            ps = cn.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra com = new Compra();
                com.setId(rs.getInt(1));
                com.setIdpago(rs.getInt(2));
                com.setFecha(rs.getString(3));
                com.setMonto(rs.getDouble(4));
                com.setEstado(rs.getString(5));
                lista.add(com);
            }
        } catch (Exception e) {
             System.out.println("Error List<Compra> SQL: "+e);
        }
        return lista;
    }
}
