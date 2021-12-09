
package modelo;
import java.util.List;

public class Compra {

    private int id;
    private Usuario usuario;
    private int idpago;
    private String fecha;
    private double monto;
    private String estado;
    private List<CarroCompras>detalleCompra;
    
    private Producto producto;
    private int idcompra;
    private int idDetalle;
    private int cantidad;
    public Compra(Usuario usuario, int idpago, String fecha, double monto, String estado, List<CarroCompras> detalleCompra) {
        this.usuario = usuario;
        this.idpago = idpago;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
        this.detalleCompra = detalleCompra;
    }
    // idCompras,idPago,FechaCompras,Monto,Estado
    public Compra(){
        
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<CarroCompras> getDetalleCompra() {
        return detalleCompra;
    }

    public void setDetalleCompra(List<CarroCompras> detalleCompra) {
        this.detalleCompra = detalleCompra;
    }
    
}
