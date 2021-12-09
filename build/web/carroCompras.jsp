    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Carrito de Compras</title>
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
    *{
    text-decoration:none;
    font-family: 'Josefin Sans', sans-serif;
}
.l_all{
    font-size: large;

}
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
                    <a class="nav-link" href="ServletPrincipal?op=home"
                                                      > Seguir Comprando </a>
                            
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
        
        <div class="container  mt-4">
            <h2 style=" font-family: 'Josefin Sans', sans-serif; font-weight: bold;" >CARRITO DE COMPRAS MILAMO</h2>
            <div class="row">
            <div class="col-sm-8">    
            <table class="table">
                <thead class="thead-dark">
                  <tr>
                    <th></th>
                    <th>NOMBRES</th>
                    <th>DESCRIPCION</th>
                    <th>PRECIO</th>
                    <th>CANTIDAD</th>
                    <th>SUBTOTAL</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${sessionScope.carrito}">
                    <tr class="table-secondary">
                        <td>${car.getItem()}</td>
                        <td>${car.getNombres()}</td>
                        <td>${car.getDescripcion()}</td>
                        <td>${car.getPreciocompra()}</td>
                   
                        <td>
                           
                            <input type="hidden" id="idprodC" value="${car.getIdProducto()}" >
                            <input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1"></td>
                        <td>${car.getSubTotal()}</td>
                        <td>
                            
                            <a href="ServletPrincipal?op=DeleteCar&idc=${car.getIdProducto()}" id="btnDelete">Eliminar</a>
                          
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
            <div class="col-sm-4">
                <div class="card">
                   <div class="card-header">
                    <h3> Compra</h3>
                   </div>
                   <div class="card-body l_all">
                    <label  id="l1" style="font-family: 'Josefin Sans', sans-serif;">SubTotal</label>
                    <input value="$. ${sessionScope.totalPago}" type="text" readonly class="form-control">
                    <label for="" id="l2" style="font-family: 'Josefin Sans', sans-serif;">Descuento</label>
                    <input type="text" readonly class="form-control">
                    <label  for="" id="l3" style="font-family: 'Josefin Sans', sans-serif; ">Pago Final</label>
                    <input value="$. ${sessionScope.totalPago}" type="text" readonly class="form-control">
                   </div>
                   <div class="card-footer">                       
                        <a href="#" data-toggle="modal" data-target="#myModalPago" class="btn btn-dark">Realizar Pago</a>
                        <a href="ServletPrincipal?op=GenerarCompra" class="btn btn-primary">Generar Compra</a> 
                    </div>
                </div>
            </div>
            </div>    
        </div>
         <!--Modal Tarjeta-->          
        <div class="modal fade" id="myModalPago" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">         
                <div class="modal-content">                   
                    <div class="modal-header text-center"> 
                        <label><i class="fa-dollar-sign"></i>Realizar Pago</label>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>  
                    </div>
                    <div class="modal-body"> 
                        <div class="tab-content" id="pills-tabContent">
                            <!-- Metodo Pago -->
                            <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                <form action="ServletPrincipal">
                                    <div class="form-group">
                                        <label>Nombre del Titular</label>
                                        <input type="text" class="form-control" placeholder="Anonimo">
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre de la tarjeta</label>
                                        <input type="text" class="form-control" placeholder="MasterCard">
                                    </div>
                                    <div class="form-group">
                                        <label>Card address</label>
                                        <input type="text" class="form-control" placeholder="9999-9999-9999-9999">
                                    </div>
                                    <div class="form-group">
                                        <label>Codigo Seguridad</label>
                                        <input type="text" class="form-control" placeholder="xxxx">
                                    </div>
                                    <div class="form-group">
                                        <label>Monto</label>
                                        <input type="text" name="txtmonto" readonly value="$.${sessionScope.totalPago}0" class="form-control h1">
                                    </div>                                   
                                    <button type="submit" name="op" value="RealizarPago" class="btn btn-info btn-block">Pagar</button>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>        
        
        
          <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
    
    <script
	src="https://code.jquery.com/jquery-3.6.0.js"
			  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      
        <script>
            $(document).ready(function(){
                $("tr #Cantidad").click(function(){
                var idp=$(this).parent().find("#idprodC").val();
                var cantidad=$(this).parent().find("#Cantidad").val();
                var url= "ServletPrincipal?op=ActualizarCant"; 
                $.ajax({
                    
                   type: 'POST',
                   url: url,
                   data: "_idprodC="+idp+"&_Cantidad=" + cantidad,
                   success: function (data, textStatus, jqXHR) {
                     location.href="ServletPrincipal?op=Carrito";
                    }
                });
                });
                
            });
        </script>   
    </body>
</html>
