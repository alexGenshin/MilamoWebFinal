package controlador;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import conexionsql.Conexion;
import conexionsql.Fecha;

public class ServletPrincipal extends HttpServlet {
    Conexion cn=new Conexion();
    Usuario us = new Usuario();
    UsuarioDAO usdao = new UsuarioDAO();
    ProductoDAO prsql = new ProductoDAO();
    ContactoDAO contactodao= new ContactoDAO();
    Producto p = new Producto();
     Contacto contacto= new Contacto();
    List<Producto> productosL = new ArrayList<>();
    List<CarroCompras> listcar = new ArrayList<>();
    List<Usuario> usuariosL = new ArrayList<>();
    List<Contacto> contactoL= new ArrayList<>();
    CompraDAO codao=new CompraDAO();
    String logueo = "";
    String correo = "";
    String rol="";
    int x;
    double monto_pago=0;
    int cont;
    double totalPago = 0.0;
    int cant = 1;
    int idpro=0,idUsu=0, idcontacto=0;;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        System.out.println("???Nombre"+us.getNombres());
        int idProd=0 ;
        CarroCompras car = new CarroCompras();
        String op = request.getParameter("op");
        productosL = prsql.listar();
        usuariosL=usdao.listar();
        contactoL= contactodao.listar();
        switch (op) {
            case "Validar":    
                String email = request.getParameter("txtemail");
                String pass = request.getParameter("txtpass");
                
                us = usdao.Validar(email, pass);
                if (us.getId() != 0 && session.getAttribute("logueo")==null) {
                    logueo = us.getNombres();
                    correo = us.getEmail();
                    rol=us.getRol();
                    session.setAttribute("logueo", logueo);
                    session.setAttribute("correo", correo);
                    session.setAttribute("rol", rol);
                    System.out.println("El usuario es:"+us.getNombres()+"---"+us.getId());
                    response.sendRedirect("ServletPrincipal?op=home");      
                }else {
                    
                    int errorV=1;
                    request.setAttribute("error_", errorV);
                   request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                 
                }
                break;
            case "SobreLogin":
                request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                break;
            case "Registrar":
                String nom = request.getParameter("txtnom");
                String dni = request.getParameter("txtdni");
                String em = request.getParameter("txtemail");
                String pas = request.getParameter("txtpass");
                String dir = request.getParameter("txtdire");
                us.setNombres(nom);
                us.setDni(dni);
                us.setEmail(em);
                us.setPass(pas);
                us.setDireccion(dir);
                us.setRol("cliente");
                usdao.AgregarUsuario(us);
                System.out.println("El usuario es:"+us.getNombres()+"---"+us.getId());
                request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                break;
            case "Salir":
                session.invalidate();
                us=new Usuario();
                listcar=new ArrayList<>();
                rol="cliente";
                request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                break;
            case "AgregarCarrito":
                if(us.getNombres()==null){
                    request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                }
                 System.out.println("El usuario es:"+us.getNombres()+"---"+us.getId());
                int pos=0;
                cant=1;        
                idProd = Integer.parseInt(request.getParameter("id"));
                p = prsql.listarId(idProd);
                if(listcar.size()>0){
                    for (int i = 0; i < listcar.size(); i++) {
                        if(idProd==listcar.get(i).getIdProducto()){
                            pos=i;
                        }     
                    }
                    if(idProd==listcar.get(pos).getIdProducto()){
                      cant=listcar.get(pos).getCantidad()+cant;
                      double subtotal=listcar.get(pos).getPreciocompra()*cant;
                      listcar.get(pos).setCantidad(cant);
                      listcar.get(pos).setSubTotal(subtotal);
                    }else{
                cont = cont + 1;
                car.setItem(cont);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());
                car.setDescripcion(p.getDescripcion());
                car.setPreciocompra(p.getPrecio());
                car.setCantidad(cant);
                car.setSubTotal(cant * p.getPrecio());
                listcar.add(car);
                    }
                }else{
                cont = cont + 1;
                car.setItem(cont);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());
                car.setDescripcion(p.getDescripcion());
                car.setPreciocompra(p.getPrecio());
                car.setCantidad(cant);
                car.setSubTotal(cant * p.getPrecio());
                listcar.add(car);
                }
                session.setAttribute("cont", listcar.size());
                request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                break;
            case "Carrito":
                totalPago = 0.0;
                session.setAttribute("carrito", listcar);
                for (int i = 0; i < listcar.size(); i++) {
                    totalPago = totalPago + listcar.get(i).getSubTotal();
                }
                session.setAttribute("totalPago", totalPago);
                request.getRequestDispatcher("carroCompras.jsp").forward(request, response);
                break;
            case "DeleteCar":
               int idcd=Integer.parseInt(request.getParameter("idc"));
                for (int i = 0; i < listcar.size(); i++) {
                   if(listcar.get(i).getIdProducto()==idcd){ 
                       listcar.remove(i);
                      break;
                   }
                }
               response.sendRedirect("ServletPrincipal?op=Carrito");
               break;
            case "ActualizarCant":
                int id_pro=Integer.parseInt(request.getParameter("_idprodC"));
                int cant_=Integer.parseInt(request.getParameter("_Cantidad"));
                for (int i = 0; i < listcar.size(); i++) {
                   if(listcar.get(i).getIdProducto()==id_pro){
                       listcar.get(i).setCantidad(cant_);
                       double st=listcar.get(i).getPreciocompra()*cant_;
                       listcar.get(i).setSubTotal(st);
                   }
                }
                break;
                case "GuardarProducto":
                ArrayList<String> pro = new ArrayList<>();
                try {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(factory);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File file = new File("D:\\wamp64\\www\\carrito1" + fileItem.getName());
                            fileItem.write(file);
                            p.setImagen("http://localhost/carrito1/" + fileItem.getName());
                        } else {
                            pro.add(fileItem.getString());
                        }
                    }
                    p.setNombre(pro.get(0));
                    p.setDescripcion(pro.get(1));
                    p.setPrecio(Double.parseDouble(pro.get(2)));
                    p.setStock(Integer.parseInt(pro.get(3)));
                    prsql.AgregarNuevoProducto(p);

                } catch (Exception e) {
                    System.err.println("" + e);
                }
                request.getRequestDispatcher("ServletPrincipal?op=NuevoProducto").forward(request, response);
                break;
            case "editarproducto":
                idpro = Integer.parseInt(request.getParameter("id"));
                p=prsql.listarId(idpro);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("ServletPrincipal?op=NuevoProducto").forward(request, response);
                 break;
            case "actualizarproducto":
                 ArrayList<String> pro1 = new ArrayList<>();
                try {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(factory);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File file = new File("D:\\wamp64\\www\\carrito1" + fileItem.getName());
                            fileItem.write(file);
                            p.setImagen("http://localhost/carrito1/" + fileItem.getName());
                        } else {
                            pro1.add(fileItem.getString());
                        }
                    }
                    p.setNombre(pro1.get(0));
                    p.setDescripcion(pro1.get(1));
                    p.setPrecio(Double.parseDouble(pro1.get(2)));
                    p.setStock(Integer.parseInt(pro1.get(3)));
                    p.setId(idpro);
                    prsql.actualizar(p);

                } catch (Exception e) {
                    System.err.println("" + e);
                }
                request.getRequestDispatcher("ServletPrincipal?op=NuevoProducto").forward(request, response);
                break;
            case "eliminarproducto":
                idpro = Integer.parseInt(request.getParameter("id"));
                prsql.delete(idpro);
                request.getRequestDispatcher("ServletPrincipal?op=NuevoProducto").forward(request, response);
                break;
            case "buscarProducto":
                System.out.println("entre al metodo buscar");
                String datoprod= request.getParameter("txtBuscar");
                List<Producto> busquedap= prsql.buscarprod(datoprod);
                session.setAttribute("productos", busquedap);
                request.getRequestDispatcher("./dash_productos.jsp").forward(request, response);
                break;
            
            case "NuevoProducto":
                session.setAttribute("productos", productosL);
                request.getRequestDispatcher("./dash_productos.jsp").forward(request, response);
                break;   
                      /*<--------MANTENIMIENTO USUARIO------------->*/   
              case "AgregarUsuario":
                String dni1 = request.getParameter("txtDNI");
                String nom1= request.getParameter("txtNOM");
                String dir1 = request.getParameter("txtDIRE");
                String email1 = request.getParameter("txtEMAIL");
                String pas1 = request.getParameter("txtPASS");
                String rol1 = request.getParameter("txtROL");
                us.setDni(dni1);
                us.setNombres(nom1);
                us.setDireccion(dir1);
                us.setEmail(email1);
                us.setPass(pas1);
                us.setRol(rol1);
                usdao.AgregarUsuario(us);
                request.getRequestDispatcher("ServletPrincipal?op=NuevoUsuario").forward(request, response);
                break;
            case "EditarUsuario":
                idUsu = Integer.parseInt(request.getParameter("id"));
                us= usdao.listarId(idUsu);
                request.setAttribute("usuario", us);
                request.getRequestDispatcher("ServletPrincipal?op=NuevoUsuario").forward(request, response);
                break;

            case "ActualizarUsuario":
                String nom2 = request.getParameter("txtNOM");
                String dni2 = request.getParameter("txtDNI");
                String email2 = request.getParameter("txtEMAIL");
                String pas2 = request.getParameter("txtPASS");
                String dir2 = request.getParameter("txtDIRE");
                String rol2 = request.getParameter("txtROL");
                us.setNombres(nom2);
                us.setDni(dni2);
                us.setEmail(email2);
                us.setPass(pas2);
                us.setDireccion(dir2);
                us.setRol(rol2);
                us.setId(idUsu);
                usdao.ActualizarUsuario(us);
                request.getRequestDispatcher("ServletPrincipal?op=NuevoUsuario").forward(request, response);
                break;
            case "EliminarUsuario":
                idUsu = Integer.parseInt(request.getParameter("id"));
                usdao.deleteUsuario(idUsu);
                request.getRequestDispatcher("ServletPrincipal?op=NuevoUsuario").forward(request, response);
                break;
            case "buscarUsuario":
                System.out.println("entre al metodo buscar");
                String datoUsu= request.getParameter("txtBuscar");
                List<Usuario> busqueda= usdao.buscar(datoUsu);
                session.setAttribute("usuarios", busqueda);
                request.getRequestDispatcher("./dash_usuario.jsp").forward(request, response);
                break;
            case "NuevoUsuario":
                session.setAttribute("usuarios", usuariosL);
                request.getRequestDispatcher("./dash_usuario.jsp").forward(request, response);
                break;
             /*<------------ MANTENIMIENTO TABLA CONTACTO------------------->*/
            case "enviarconsulta":
                String nombre = request.getParameter("txtnombre");
                String apellido = request.getParameter("txtapellido");
                String correo = request.getParameter("txtemail");
                String mensaje = request.getParameter("txtmensaje");
                contacto.setNombre(nombre);
                contacto.setApellido(apellido);
                contacto.setEmail(correo);
                contacto.setMensaje(mensaje);
                contactodao.AgregarConsulta(contacto);
                request.getRequestDispatcher("Contacto.jsp").forward(request, response);
                break;
            case "eliminarconsulta":
                idcontacto= Integer.parseInt(request.getParameter("id"));
                contactodao.deleteConsulta(idcontacto);
                request.getRequestDispatcher("ServletPrincipal?op=nuevaconsulta").forward(request, response);
                break;
            case "nuevaconsulta":
                session.setAttribute("contactos", contactoL);
                request.getRequestDispatcher("./dash_consulta.jsp").forward(request, response);
                break;   
                
            case "RealizarPago":
               monto_pago=totalPago;
               if(monto_pago>0 || us.getId()!=0){
                   
                   x=codao.Pagar(monto_pago);
                request.getRequestDispatcher("ServletPrincipal?op=Carrito").forward(request, response);
               }else{
                   monto_pago = 0;               
                   request.getRequestDispatcher("ServletPrincipal?op=Carrito").forward(request, response);
               }
                break;
                 
            case "GenerarCompra":
                int idPago=codao.getIdPago();
                if(x!=1){
                    request.getRequestDispatcher("ServletPrincipal?op=Carrito").forward(request, response);
                }else{
                Compra compra=new Compra(us,idPago,Fecha.FechaBD(),totalPago,"cancelado",listcar);
                int res=codao.GenerarCompra(compra);
                if(res!=0&&totalPago>0){
                  System.out.println("Generar Compra-------SI?");
                    listcar = new ArrayList<>();
                        List<Compra> Lcompra = codao.misCompras(us.getId());
                        session.setAttribute("MisCompras",Lcompra);
                    request.getRequestDispatcher("compras.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                }
                break;
               case "Detalle":
                    totalPago = 0.0;
                int idcompras = Integer.parseInt(request.getParameter("idcompra"));
                List<Compra> detalle = codao.Detalle(idcompras);
                request.setAttribute("DetalleS", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalPago = totalPago + (detalle.get(i).getMonto()* detalle.get(i).getCantidad());
                }
                request.setAttribute("montoPagar", totalPago);
                request.getRequestDispatcher("detalle.jsp").forward(request, response);
                break;
                case "MisCompras":
                    System.out.println("-us-"+us.getId());
                   if(us.getId()!=0){
                        List<Compra> Lcompra = codao.misCompras(us.getId());
                        session.setAttribute("MisCompras",Lcompra);
                       request.getRequestDispatcher("compras.jsp").forward(request, response);
                   }else if(listcar.size()>0){
                       request.getRequestDispatcher("ServletPrincipal?op=Carrito").forward(request, response);
                   }else{
                       request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                   } 
                    break;
            case "home":
                request.setAttribute("productos", productosL);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            default:
                 request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

//        String op=request.getParameter("op");
//        switch (op) {
//                case "actualizar":
//                 ArrayList<String> pro1 = new ArrayList<>();
//                try {
//                    FileItemFactory factory = new DiskFileItemFactory();
//                    ServletFileUpload fileUpload = new ServletFileUpload(factory);
//                    List items = fileUpload.parseRequest(request);
//                    for (int i = 0; i < items.size(); i++) {
//                        FileItem fileItem = (FileItem) items.get(i);
//                        if (!fileItem.isFormField()) {
//                            File file = new File("C:\\wamp64\\www\\carrito1" + fileItem.getName());
//                            fileItem.write(file);
//                            p.setImagen("http://localhost/carrito1/" + fileItem.getName());
//                        } else {
//                            pro1.add(fileItem.getString());
//                        }
//                    }
//                    p.setNombre(pro1.get(0));
//                    p.setDescripcion(pro1.get(1));
//                    p.setPrecio(Double.parseDouble(pro1.get(2)));
//                    p.setStock(Integer.parseInt(pro1.get(3)));
//                    p.setId(idpro);
//                    prsql.actualizar(p);
//
//                } catch (Exception e) {
//                    System.err.println("" + e);
//                }
//                request.getRequestDispatcher("ServletPrincipal?op=NuevoProducto").forward(request, response);
//                break;
//                default:
//                throw new AssertionError();
//        }



        
/*        try {
String email = request.getParameter("txtemail");
String pass = request.getParameter("txtpass");
          Conexion cn = new Conexion();               
     PreparedStatement pst = cn.getConnection().prepareStatement("select * from cliente where Email=? and Password=?");
        pst.setString(1, email);
        pst.setString(2, pass);
        ResultSet rs=pst.executeQuery();
        if(rs.next()){
            HttpSession sesionOk=request.getSession();
            sesionOk.setAttribute("nombre", rs.getString(3));
            sesionOk.setAttribute("correo", rs.getString(5));
            sesionOk.setAttribute("rol", rs.getString(7));
            cn.getConnection().close();
            request.getRequestDispatcher("index.jsp").forward(request, response);
            

        }else{
            String msg="USUARIO O PASSWORD INCORRECTOS";
             cn.getConnection().close();
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("Vistas/Login.jsp").forward(request, response);
        
        }         
        } catch (Exception e) {
            System.out.println("Error de Login" + e);
        }*/
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
