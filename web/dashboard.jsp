<%-- 
    Document   : dashboard
    Created on : 12 oct. 2021, 19:09:57
    Author     : jeancarlos
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    </head>
    <body>
                    <%  
    if(session.getAttribute("logueo")==null){         
       request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
    }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>ADMINISTRADOR</i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="ServletPrincipal?op=home"><i class="fas fa-house-user"></i> HOME MILAMO</a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-plus-circle"></i> PRODUCTOS</a>
                    </li>  
                </ul>                                           
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="./img/user.png" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./ServletPrincipal?op=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/MilamoWeb_F/ServletPrincipal?op=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                      <!--./ServletPrincipal?op=salir-->
                    </div>
                </ul>     
            </div>
        </nav>
        <!-- Guardar productos  -->
        <div id="guardarproducto"class="container mt-4">            
            <div class="row">
                <div class="col-sm-5">
                    <div class="card">
                        <div class="card-header">
                            <h3>Agregar Producto</h3>
                        </div>                
                        <div class="card-body"> 
                            <form  action="" method="POST" enctype='multipart/form-data'>
                                <div class="form-group">
                                    <label>Nombres:</label>
                                    <input type="text" name="txtNombre" value="${producto.getNombre()}" class="form-control">
                                </div>                     
                                <div class="form-group">
                                    <label>Descripcion</label>
                                    <input type="text"  name="txtDescripcion" value="${producto.getDescripcion()}" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Precio</label>
                                    <input type="text" name="txtPrecio" value="${producto.getPrecio()}" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Stock</label>
                                    <input type="text" name="txtStock" value="${producto.getStock()}" class="form-control">
                                </div>
                                <div class="form-group">                            
                                    <input type="file" name="txtFoto" value="${producto.getImagen()}"  placeholder="sad">
                                </div>
                                <div class="form-group">
                                    <input type="submit"  class="btn btn-danger" name="op" value="GuardarProducto" onclick=this.form.action="ServletPrincipal?op=GuardarProducto">
                                    <input  type="submit"  class="btn btn-success" name="op" value="Editar" onclick=this.form.action="ServletPrincipal?op=actualizar">
                                </div>
                            </form>
                                    
                        </div>               
                    </div>
                </div> 
                <div class="col-sm-7">
                    <table class="table table-responsive">
                        <thead class="">
                            <tr class="text-center">
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>DESCRIPCION</th>                               
                                <th>PRECIO</th>
                                <th>STOCK</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${productos}">
                            <tr class="text-center">
                                <td>${p.getId()}</td>
                                <td>${p.getNombre()}
                                    <img src="${p.getImagen()}" width="30" height="30">
                                </td>
                                <td>${p.getDescripcion()}</td>                                    
                                <td>${p.getPrecio()}</td>
                                <td>${p.getStock()}</td>
                                <td class="d-flex">
                                    <a href="./ServletPrincipal?op=editarproducto&id=${p.getId()}" class="btn btn-warning">Editar</a>
                                    <a href="./ServletPrincipal?op=eliminarproducto&id=${p.getId()}" class="btn btn-danger" >Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>                           
                        </tbody>
                    </table>

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
                            <img src="./img/user.png" width="100" height="100">                         
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
                                    <form action="ServletPrincipal">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="op" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
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





        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/646c794df3.js"></script>
    </body>
</html>
