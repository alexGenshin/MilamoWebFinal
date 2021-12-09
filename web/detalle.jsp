<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Detalles</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <link href="css/carrito.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    </head>
                <%  
    if(session.getAttribute("logueo")==null){         
       request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
    }
        %>
    <body>
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
                    <a class="nav-link" href="ServletPrincipal?op=home"> Seguir Comprando </a>
                                                      
                            
                    </li>

                    <li class="nav-item active">
                <a class="nav-link" href="Contacto.jsp"><i class="fas fa-address-book"></i>Contacto</a>
                    </li>
                   <li class="nav-item active">
  <c:if test="${sessionScope.rol.equals('admin')}"> <a class="nav-link" href="ServletPrincipal?op=NuevoProducto"><i class="fas fa-user-lock"></i>DashBoard</a></c:if>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${sessionScope.logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>                        
        <%--<%=usuario%> --%>      <!-- <a class="dropdown-item" href="#">user</a>-->
        <%--<%=correo%>--%> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${sessionScope.correo}</a>
     

                        <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="ServletPrincipal?op=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./ServletPrincipal?op=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>
                <div class="container mt-4">                 
            <div class="card"> 
                <div class="card-header d-flex">
                    <h2>Detalle</h2>
                    <a href="ServletPrincipal?op=MisCompras" class="pt-2 pl-4">Regresar</a>
                </div>   
                <div class="card-body">
                    <table class="table tab-pane">
                        <thead class="thead-dark">
                            <tr class="text-center">
                                <th>CODIGO COMPRA</th>                               
                                <th>Articulo</th>
                                <th>Cantidad</th>
                                <th>Precio Compra</th>                                                   
                                <th></th>                                                   
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="d" items="${DetalleS}">
                                <tr class="text-center">
                                    <td>C00${d.getIdcompra()}</td> 
                                    <td>                                        
                                        <label><i>${d.producto.nombre}</i></label><br>                                      
                                        <img src="${d.producto.imagen}" width="80" height="60">
                                    </td>                                                                
                                    <td>${d.getCantidad()}</td>
                                    <td>${d.getMonto()}</td>                                                                                                      

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
                </div>
                <div class="card-footer d-flex">
                    <label class="col-sm-9 text-right mt-1">Monto Total de la Compra</label>
                    <input type="text" class=" text-center form-control col-sm-3" readonly="" value="$.${montoPagar}0" style="font-size: 20px; font-family: monospace">
                </div>
            </div>          
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
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
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
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controlador">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="number" name="txtdni" class="form-control" placeholder="01245678">
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
                                        <button type="submit" data-toggle="modal" data-target="#myModal" name="accion" value="Registrar" class="btn btn-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
