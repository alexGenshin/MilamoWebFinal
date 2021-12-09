
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
        <title>Contacto</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href="css/Style.css" rel="stylesheet" type="text/css"/>
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
            String usuario = "";
            String correo = "";
            int asdw = 0;

            try {
                asdw = Integer.parseInt(request.getAttribute("error_") + "");
            } catch (NumberFormatException e) {
                System.out.println("Error");
            }
            if (session.getAttribute("logueo") != null) {
                //  request.getRequestDispatcher("ServletPrincipal?op=home").forward(request, response);
                usuario = session.getAttribute("logueo").toString();
                correo = session.getAttribute("correo").toString();
            } else if (asdw == 1) {

                usuario = "Iniciar Sesion";
                correo = "Iniciar Sesion";
        %> 
        <script>
            mostrar();
            function mostrar() {
                swal('Incorrecta Validacion', 'Usuario y/o contraseñas incorrectas', 'error');
            }
        </script>             
        <%
            } else {
                usuario = "Iniciar Sesion";
                correo = "Iniciar Sesion";
            }
        %>

        <header>
            <%@ include file="header/header_index.jsp" %> 
            <div class="cover d-flex justify-content-center align-items-center flex-column">
                <h1 class="port text-center">Milamo</h1>
                <p class="port text-center"> Tienda de Reposterias y Snacks </p>
                <button class="btn btn-dark port" type="button">Conoce Mas</button>
            </div>
        </header><br>

        <section>
            <div class="row no-gutters">
                <div class="col-xl-5 col-lg-12"> 
                    <img src="img/casi.jpg"
                         alt="Una persona en una computadora" width="962" height="700"/>
                </div>
                <div class="col-xl-7 col-lg-12">                    
                    <section class="form-contact">
                        <form action="ServletPrincipal" "name="frmcont"  method="post">
                            <h3 class="mb-3" align="center">Formulario de Contacto</h3>
                            <input class="controls" type="text" name="txtnombre" id="nombres" placeholder="Ingrese su Nombre">
                            <input class="controls" type="text" name="txtapellido" id="apelidos" placeholder="Ingrese su Apellido">
                            <input class="controls" type="email" name="txtemail"id="correo" placeholder="Ingrese su Correo">
                            <h6>Mensaje:</h6>
                            <textarea class="form-control" name="txtmensaje" id="message"></textarea><br>
                            <div class="clear">
                                <div class="form-group mb-2">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox">
                                        <label class="form-check-label">Estoy de acuerdo con los términos y condiciones</label>
                                    </div>
                                </div>
                                <input class="botons" name="op" type="submit" value="enviarconsulta">
                            </div>
                        </form>
                    </section>                   
                </div>
            </div>       
        </section><br>

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
    </body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</html>
