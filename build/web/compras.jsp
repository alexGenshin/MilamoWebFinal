<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.CompraDAO"%>
<%@page import="modelo.Compra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras Milamo</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <link href="css/carrito.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style type="text/css">
        
    </style>
    </head>
    <body>
                    <%  
    if(session.getAttribute("logueo")==null){         
       request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
    }
        %>
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
                   <li class="nav-item active">
  <c:if test="${sessionScope.rol.equals('admin')}"> <a class="nav-link" href="ServletPrincipal?op=NuevoProducto"><i class="fas fa-user-lock"></i>DashBoard</a></c:if>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a id="js1" style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i>${sessionScope.logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                     <a  class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>                        
                     <a id="js2" class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${sessionScope.correo}</a>
                        <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="ServletPrincipal?op=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./ServletPrincipal?op=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>  
       <!--Termina NAV-->
       <div class="container mt-4">
            <h2>Mis Compras</h2>
            <div class="row">            
                <table class="table tab-pane">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>CODIGO DE COMPRA</th>                               
                            <th>Fecha de Compra</th>
                            <th>Monto</th>                                                   
                            <th>Codigo de Pago</th>                                                   
                            <th>Estado</th>                                                   
                            <th></th>                                                   
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${sessionScope.MisCompras}">
                            <tr class="text-center">
                                <td>C00${c.getId()}</td>                                  
                                <td>${c.getFecha()}</td>
                                <td>${c.getMonto()}</td>                                                                                                       
                                <td>P00${c.getIdpago()}</td>                                                                                                       
                                <td>${c.getEstado()}</td>                                                                                                       
                                <td>
                                    <a href="ServletPrincipal?op=Detalle&idcompra=${c.getId()}">Ver Detalle</a>
                                </td>                                                                                                       
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>             
            </div>          
        </div>
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
