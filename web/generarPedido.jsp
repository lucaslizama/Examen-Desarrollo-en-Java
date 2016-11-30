<%-- 
    Document   : generarPedido
    Created on : 29-Nov-2016, 20:37:55
    Author     : lucas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/generarPedido.css"/>
    </head>
    <body>
        <c:if test="${usuario != null}">
            <span id="bienvenida-logout">
                Bienvenido(a) ${usuario.nombreCliente} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}
                | <a href="/logout">Cerrar Sesión</a>
            </span>
            <hr>
        </c:if>
        <h1>"Donde la Abuela :: Agregar Pedido :: Paso 1"</h1>
        <fieldset>
            <legend>Agregar Pedido</legend>
            <form action="/generarPedido" method="POST">
                <div class="form-field">
                    <label for="plato">Plato</label>
                    <select name="plato" required="">
                        <option value=""></option>
                        <c:forEach var="plato" items="${platos}">
                            <option value="${plato.id}">${plato.nombrePlato} - ${plato.precioPlato}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-field">
                    <label for="bebida">Bebida</label>
                    <c:forEach var="bebida" items="${bebidas}">
                        <input type="radio" name="bebida" value="${bebida.id}">
                        ${bebida.nombreBebida} ${bebida.precioBebida}
                    </c:forEach>
                </div>
                <div class="form-field">
                    <label for="domicilio">A domicilio</label>
                    <input type="checkbox" name="domicilio">
                </div>
                <div class="form-field">
                    <span><a href="/index">Volver</a></span>
                    <button type="submit">Paso 2</button>
                </div>
            </form>
        </fieldset>
        <span style="color:${color}">${mensaje}</span>
    </body>
</html>

            