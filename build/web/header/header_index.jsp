<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                            <a class="dropdown-item" href="">Mis Compras</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="./ServletPrincipal?op=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                        </div>
                    </ul>     
                </div>
            </nav> 
   
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