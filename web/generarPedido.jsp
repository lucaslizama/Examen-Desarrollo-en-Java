<%-- 
    Document   : compra
    Created on : Nov 29, 2016, 8:59:43 PM
    Author     : Pancho
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${usuario != null}">
            <span id="bienvenida-logout">
                Bienvenido(a) ${usuario.nombreCliente} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}
                <a href="/logout">Cerrar Sesión</a>
            </span>
            <hr>
        </c:if>
        <h1>"Donde la Abuela" :: Agregar Pedido :: Paso 1</h1>
        <fieldset>
            <legend>Agregar Pedido</legend>
            <div class="form-field">
                <label for="Plato">Plato </label>
                <select name="plato" required>
                    <option value=""></option>
                    <c:forEach var="plato" items="${platos}">
                        <option value="${plato.id}">${plato.nombrePlato}-${plato.precioPlato}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-field">
                <label name="bebida" >Bebida</label>
                <c:forEach var="bebida" items="${bebidas}">
                    <input type="radio" name="bebida" value="${bebida.id}"> ${bebida.nombreBebida}:${bebida.precioBebida}
                </c:forEach>
            </div>
            <div class="form-field">
                <label name="domicilio">A Domicilio</label>
                <input type="checkbox" name="domicilio" value="si" checked> Si
                <input type="checkbox" name="domicilio" value="no"> No
            </div>
            <div class="form-field">
                <button class="submit-button" type="submit">Paso 2</button>
                <span style="color:${color}">${mensaje}</span>
                <span style="display: block; margin-left: 10px; margin-top: 10px; font-size: 14pt"><a href="/index">Volver</a></span>
            </div>
        </fieldset>
    </body>
</html>
