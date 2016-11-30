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
                <span>${compra.plato.nombrePlato}</span> <span>&#36;${compra.plato.precioPlato}</span>
            </div>
            <div class="form-field">
                <span>${compra.bebida.nombreBebida}</span> <span>&#36;${compra.bebida.precioBebida}</span>
            </div>
            <div class="form-field">
                <span>A domicilio</span>
                <c:choose>
                    <c:when test="${compra.despacho}">
                        <span>Si</span>
                    </c:when>
                    <c:otherwise>
                        <span>No</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-field">
                <span>Total</span>
                <span>${compra.total}</span>
            </div>
            <div class="form-field">
                <span><a href="/generarPedido">Volver</a></span>
                <button type="submit" >Generar Pedido</button>
            </div>
        </fieldset>
        <span><a href="/index">Ir al Menú</a></span>
    </body>
</html>
