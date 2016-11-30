<%-- 
    Document   : confirmarPedido
    Created on : 29-Nov-2016, 22:31:24
    Author     : lucas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/confirmarPedido.css"/>
    </head>
    <body>
        <c:if test="${usuario != null}">
            <span id="bienvenida-logout">
                Bienvenido(a) ${usuario.nombreCliente} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}
                | <a href="/logout">Cerrar Sesión</a>
            </span>
            <hr>
        </c:if>
        <h1>"Donde la Abuela :: Agregar Pedido :: Paso 2"</h1>
        <fieldset>
            <legend>Confirmar Pedido</legend>
            <div class="form-field">
                <span class="c1">${compra.plato.nombrePlato}</span> <span class="c2">&#36;${compra.plato.precioPlato}</span>
            </div>
            <div class="form-field">
                <span class="c1">${compra.bebida.nombreBebida}</span> <span class="c2">&#36;${compra.bebida.precioBebida}</span>
            </div>
            <div class="form-field">
                <span class="c1">A domicilio</span>
                <c:choose>
                    <c:when test="${compra.despacho}">
                        <span class="c2">Si</span>
                    </c:when>
                    <c:otherwise>
                        <span class="c2">No</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-field">
                <span class="c1">Total</span>
                <span class="c2">&#36;${compra.total}</span>
            </div>
            <div class="form-field">
                <span class="c1"><a href="/generarPedido">Volver</a></span>
                <form class="c2" action="/comprar" method="POST">
                    <button type="submit">Generar Pedido</button>
                </form>
            </div>
        </fieldset>
        <span><a href="/index">Ir al Menú</a></span>
    </body>
</html>
