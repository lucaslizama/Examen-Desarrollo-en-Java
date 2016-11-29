<%-- 
    Document   : index
    Created on : 28-Nov-2016, 21:46:02
    Author     : lucas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/index.css"/>
    </head>
    <body>
        <c:if test="${usuario != null}">
            <span id="bienvenida-logout">
                Bienvenido(a) ${usuario.nombreCliente} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}
                <a href="/logout">Cerrar Sesión</a>
            </span>
            <hr>
        </c:if>
        <h1>"Donde la Abuela" :: Menú</h1>
        <ol>
            <c:choose>
                <c:when test="${usuario == null}">
                    <li><a href="/login" >Ingresar</a></li>
                    <li><a href="/registro">Registrarse</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/generarPedido" >Generar un Pedido</a></li>
                    <li><a href="/pedidos">Ver mis pedidos</a></li>
                </c:otherwise>
            </c:choose>            
        </ol>
    </body>
</html>
