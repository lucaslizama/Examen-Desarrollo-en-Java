<%-- 
    Document   : registro
    Created on : 29-Nov-2016, 11:06:39
    Author     : lucas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="css/registro.css"/>
    </head>
    <body>
        <h1>"Donde la Abuela" :: Registro</h1>
        <fieldset>
            <legend>Registro</legend>
            <form action="/registro" method="POST">
                <div class="form-field">
                    <label for="rut">Rut</label>
                    <input type="number" min="0" name="rut" required>
                    <span>-</span>
                    <input type="text" id="dv" name="dv" maxlength="1" required> *
                </div>
                <div class="form-field">
                    <label for="clave1">Clave</label>
                    <input type="password" name="clave" required> *
                </div>
                <div class="form-field">
                    <label for="clave2">Confirmar Clave</label>
                    <input type="password" name="clave2" required> *
                </div>
                <div class="form-field">
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" required> *
                </div>
                <div class="form-field">
                    <label for="apellidoPaterno">Apellido Paterno</label>
                    <input type="text" name="apellidoPaterno" required> *
                </div>
                <div class="form-field">
                    <label for="apellidoMaterno">Apellido Materno</label>
                    <input type="text" name="apellidoMaterno" required> *
                </div>
                <div class="form-field">
                    <label for="direccion">Direccion</label>
                    <input type="text" name="direccion" required> *
                </div>
                <div class="form-field">
                    <label for="numeracion">Numeración</label>
                    <input type="number" name="numeracion" required> *
                </div>
                <div class="form-field">
                    <label for="comuna">Comuna</label>
                    <select name="comuna" required>
                        <option value=""></option>
                        <c:forEach var="comuna" items="${comunas}">
                            <option value="${comuna.id}">${comuna.nombreComuna}</option>
                        </c:forEach>
                    </select> *
                </div>
                <div class="form-field">
                    <label for="telefono">Telefono</label>
                    <input type="text" name="telefono" required> *
                </div>
                <div class="form-field">
                    <span><a href="/">Volver</a></span>
                    <button type="submit">Enviar</button>
                </div>
            </form>
        </fieldset>
        <span style="color:${color}">${mensaje}</span>
    </body>
</html>
