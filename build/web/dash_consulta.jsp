
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header/header_admin.jsp" %>  
        <div class="container mt-4">
            <div class="card">
                <div class="card-body">
                   <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOMBRES</th>
                                <th>APELLIDOS</th>
                                <th>EMAIL</th>
                                <th>MENSAJE</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="contacto" items="${contactos}">
                            <tr>
                                <td>${contacto.getId()}</td>
                                <td>${contacto.getNombre()}</td>
                                <td>${contacto.getApellido()}</td>
                                <td>${contacto.getEmail()}</td>
                                <td>${contacto.getMensaje()}</td>
                                <td class="d-flex">
                               
                                <a href="./ServletPrincipal?op=eliminarconsulta&id=${contacto.getId()}" class="btn btn-danger" >Eliminar</a>
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
