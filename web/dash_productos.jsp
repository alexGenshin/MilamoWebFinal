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
        <%@ include file="header/header_admin.jsp" %>               
        <!-- Guardar productos  -->
        <div class="d-flex">            
            <div class="card col-sm-4">
                <div class="card-header">
                    <h3>Agregar Producto</h3>
                </div>                
                <div class="card-body">
                    <form action="./ServletPrincipal" method="POST" enctype='multipart/form-data'>
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
                            <input type="submit"  class="btn btn-danger" name="op" value="Agregar" onclick=this.form.action="ServletPrincipal?op=GuardarProducto">
                            <input type="submit"   class="btn btn-success" name="op" value="Actualizar" onclick=this.form.action="ServletPrincipal?op=actualizarproducto">
                        </div>
                    </form>
                </div>               
            </div>
  
        <div class="col-sm-8">
            <div>
                <form action="./ServletPrincipal" class="form-inline">
                    <input type="search" name="txtBuscar" class="form-control">
                    <input type="submit" name="op" value="buscarProducto"class="btn btn-outline-success">
                </form>
            </div>
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






<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/646c794df3.js"></script>
</body>
</html>
