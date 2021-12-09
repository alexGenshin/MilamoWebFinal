<%-- 
    Document   : dash_usuario
    Created on : 2 dic. 2021, 11:31:32
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

        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-header">
                    <h3>Agregar Usuario</h3>
                </div>
                <div class="card-body">
                    <form action="./ServletPrincipal" method="POST">
                        <div class="form-group">
                            <label>DNI</label>
                            <input type="text" name="txtDNI" value="${usuario.getDni()}"class="form-control">
                        </div>
                        <div class="form-group">
                            <label>NOMBRES</label>
                            <input type="text" name="txtNOM" value="${usuario.getNombres()}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>DIRECCION</label>
                            <input type="text" name="txtDIRE" value="${usuario.getDireccion()}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>CORREO</label>
                            <input type="text" name="txtEMAIL" value="${usuario.getEmail()}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>PASSWORD</label>
                            <input type="text" name="txtPASS" value="${usuario.getPass()}"class="form-control">
                        </div>
                        <div class="form-group">
                            <label>ROL</label>
                            <input type="text" name="txtROL" value="${usuario.getRol()}"class="form-control">
                        </div>
                        <input type="submit" name="op"value="Agregar"class="btn btn-info" onclick=this.form.action="ServletPrincipal?op=AgregarUsuario">
                        <input type="submit" name="op"value="Actualizar"class="btn btn-info"onclick=this.form.action="ServletPrincipal?op=ActualizarUsuario">
                    </form>
                </div>
            </div>
        
        <div class="col-sm-8">
            <div>
                <form action="./ServletPrincipal" class="form-inline">
                    <input type="search" name="txtBuscar" class="form-control">
                    <input type="submit" name="op" value="buscarUsuario"class="btn btn-outline-success">
                </form>
            </div>
            <table class="table table-responsive">
                <thead class="">
                    <tr class="text-center">
                        <th>ID</th>
                        <th>DNI</th>
                        <th>NOMBRES</th>
                        <th>DIRECCION</th>
                        <th>EMAIL</th>
                        <th>PASSWORD</th>
                        <th>ROL</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${usuarios}">
                        <tr class="text-center">
                            <td>${u.getId()}</td>
                            <td>${u.getDni()}</td>
                            <td>${u.getNombres()}</td>
                            <td>${u.getDireccion()}</td>
                            <td>${u.getEmail()}</td>
                            <td>${u.getPass()}</td>
                            <td>${u.getRol()}</td>
                            <td class="d-flex">
                                <a href="./ServletPrincipal?op=EditarUsuario&id=${u.getId()}" class="btn btn-warning">Editar</a>
                                <a href="./ServletPrincipal?op=EliminarUsuario&id=${u.getId()}" class="btn btn-danger" >Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/646c794df3.js"></script>
</body>
</html>
