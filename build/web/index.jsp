 
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="javax.enterprise.context.SessionScoped"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Milamo</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <%  
    String usuario="";
    String correo="";
    int asdw=0;
    
    try {
  asdw=Integer.parseInt(request.getAttribute("error_") + ""); 
        } catch (NumberFormatException e) {
      System.out.println("Error asdw");
        }
    if(session.getAttribute("logueo")!=null){
     //  request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
       usuario=session.getAttribute("logueo").toString();
       correo=session.getAttribute("correo").toString();
    }else if(asdw==1){
        
        usuario="Iniciar Sesion";
        correo="Iniciar Sesion";
     %> 
         <script>
       mostrar();
       function mostrar(){swal('Incorrecta Validacion','Usuario y/o contraseñas incorrectas','error');  }
         </script>             
    <%
    }else{
        usuario="Iniciar Sesion";
        correo="Iniciar Sesion";
    }
        %>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#"><i class="fab fa-shopify"></i>Milamo</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="./ServletPrincipal?op=home"><i class="fas fa-home"></i> Home <span
                                class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="./ServletPrincipal?op=Carrito"><i class="fas fa-cart-arrow-down" style="height: 30px;">(<label
                                    style="color:red;">${sessionScope.cont}</label>)</i>Carrito </a>
                    </li>

                    <li class="nav-item active">
                <a class="nav-link" href="Contacto.jsp"><i class="fas fa-address-book"></i>Contacto</a>
                    </li>
                            <li class="nav-item dropdown">
                              <c:if test="${sessionScope.rol.equals('admin')}">   <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user-lock"></i>   Mantenimiento
                                </a></c:if>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="ServletPrincipal?op=NuevoProducto">Productos</a></li>
                                    <li><c:if test="${sessionScope.rol.equals('admin')}"><a class="dropdown-item" href="ServletPrincipal?op=NuevoUsuario">Usuarios</a></c:if></li>
                                    <li><c:if test="${sessionScope.rol.equals('admin')}"><a class="dropdown-item" href="ServletPrincipal?op=nuevaconsulta">Consultas</a></c:if></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a id="js1" style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> <%=usuario%></a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a  class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>                        
        <%--<%=usuario%> --%>      <!-- <a class="dropdown-item" href="#">user</a>-->
        <%--<%=correo%>--%> <a id="js2" class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal"><%=correo%></a>
     

                        <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="ServletPrincipal?op=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./ServletPrincipal?op=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav> 

        <div class="cover d-flex justify-content-center align-items-center flex-column">
            <h1 class="port text-center">Milamo</h1>
            <p class="port text-center"> Tienda de Reposterias y Snacks </p>
            <button class="btn btn-dark port" type="button">Conoce Mas</button>
        </div>
    </header>
    <section id="sectionP">

        
         
        <h1 class="titleP">BIENVENIDOS A LA EMPRESA MILAMO</h1>
        <div class="container mt-5 container_Card">
            <%-- ArrayList<Producto> lista=(ArrayList<Producto>)request.getAttribute("Listaproductos");
                    for (int i = 0; i < lista.size(); i++) { Producto em=lista.get(i); --%>
                   <c:forEach var="p" items="${productos}">     
                            <div class="card cardp">

                                <img src="${p.getImagen()}" width="200" height="180">
                                <h4>${p.getNombre()}</h4>


                                <p>${p.getDescripcion()} </p>
                                <i>
                                    <%="$"%>${p.getPrecio()}
                                </i>
                                <div class="cont_button">
                                    <a href="ServletPrincipal?op=AgregarCarrito&id=${p.getId()}" id="btnAddCar">Agregar al
                                        Carrito</a>
                                    <!--<a href="ServletPrincipal?op=Comprar&id=${p.getId()}" id="btnGoCar">Ir Carro</a>-->
                                </div>
                            </div>

                        </c:forEach>
                        <% /* }*/ %>
        </div>
         <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a  class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="ServletPrincipal" method="POST">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>

                                        <button type="submit" name="op" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                                           <%--name="op" value="Validar" --%> 
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="ServletPrincipal">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="01245678">
                                         </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Chiclayo - La Victoria">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <button type="submit" name="op" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <script>

</script>
    </section>
    
    <!--GOOGLE MAPS-->
    <section id="googleMap">
        <div class="container_map mt-5 mb-1" style="text-align: center;;">
            <h4 >Aqui nos vemos</h4>
            <p> Cuenca, Ecuador </p>
            <div class="responsive-iframe">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.7284775562625!2d-79.03514568524328!3d-2.894405897891794!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91cd22a5a70aa7f9%3A0xd356fd895b59f092!2sAv.%20Gral.%20Escand%C3%B3n%2C%20Cuenca%2C%20Ecuador!5e0!3m2!1ses-419!2spe!4v1631191059964!5m2!1ses-419!2spe"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" frameborder="0"></iframe>
            </div>
        </div>
    </section>
    <!-- FOOTER -->
    <footer>
        <div class="container-footer-all">

            <div class="container-body">

                <div class="colum1">
                    <h1>Mas informacion de la compañia</h1>

                    <p style="text-align: justify;">Esta compañia se dedica a la venta de postres y Snacks
                        que podras disfrutarlos para eventos como cumpleaños ,
                        una boda, un bautismo.En fin son alimentos muy ricos
                    </p>

                </div>

                <div class="colum2">

                    <h1>Redes Sociales</h1>

                    <div class="row_">
                        <img src="img/facebook.png">
                        <label>Siguenos en Facebook</label>
                    </div>
                    <div class="row_">
                        <img src="img/twitter.png">
                        <label>Siguenos en Twitter</label>
                    </div>
                    <div class="row_">
                        <img src="img/instagram.png">
                        <label>Siguenos en Instagram</label>
                    </div>
                    <div class="row_">
                        <img src="img/google-plus.png">
                        <label>Siguenos en Google Plus</label>
                    </div>
                </div>

                <div class="colum3">
                    <h1>Informacion Contactos</h1>
                    <div class="row_2">
                        <img src="img/house.png">
                        <label>Av Escandon , Cuenca, Ecuador,
                            Ecuador
                        </label>
                    </div>
                    <div class="row_2">
                        <img src="img/smartphone.png">
                        <label>+1-829-395-2064</label>
                    </div>
                    <div class="row_2">
                        <img src="img/contact.png">
                        <label>
                            milamofood@gmail.com</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-footer">
            <div class="footer">
                <div class="copyright">
                    Â© 2017 Todos los Derechos Reservados | <a href="">Milamo</a>
                </div>
                <div class="information">
                    <a href="">Informacion Compañia</a> | <a href="">Privacion y Politica</a> | <a href="">Terminos y
                        Condiciones</a>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>