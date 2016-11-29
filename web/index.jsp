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
    </head>
    <body>
        <c:if test="${usuario != null}">
            <!--TODO mensaje bienvenida y link de logout-->
        </c:if>
        <h1>"Donde la Abuela" :: Menú</h1>
        <ol>
            <c:choose>
                <c:when test="${usuario == null}">
                    <li><a href="/login" >Ingresar</a></li>
                    <li><a href="/registro">Registrarse</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/login" >Generar un Pedido</a></li>
                    <li><a href="/registro">Ver mis pedidos</a></li>
                </c:otherwise>
            </c:choose>            
        </ol>
    </body>
</html>
