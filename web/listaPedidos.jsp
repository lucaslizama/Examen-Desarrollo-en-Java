<%-- 
    Document   : listaPedidos
    Created on : Nov 29, 2016, 9:48:15 PM
    Author     : Pancho
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/lista.css"/>
        <title>Pedidos</title>
    </head>
    <body>
        <c:if test="${usuario != null}">
            <span id="bienvenida-logout">
                Bienvenido(a) ${usuario.nombreCliente} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}
                <a href="/logout">Cerrar Sesión</a>
            </span>            
        </c:if>
        <h1>"Donde la Abuela" :: Mis Pedidos </h1>
        <table>
            <thead> 
                <th> Código </th>
                <th> Plato </th>
                <th> Bebida </th>
                <th> Entrega </th>
                <th> Teléfono </th>
                <th> Comuna </th>
                <th> Ingreso </th>
                <th> Total </th>
            </thead>
            <tbody>
                <c:if test="${listaPedido != null}">
                    <c:forEach var="pedido" items="${listaPedido}">
                        <tr>
                            <td>${pedido.id}</td>
                            <td>${pedido.plato.nombrePlato}</td>
                            <td>${pedido.bebida.nombreBebida}</td>
                            <td>${pedido.cliente.direccionCliente}</td>
                            <td>${pedido.cliente.telefono}</td>
                            <td>${pedido.cliente.comuna.nombreComuna}</td>
                            <td><fmt:formatDate pattern="dd/MM/yyyy/hh/mm" value="${pedido.fechaHora}"/></td>
                            <td>&#36;${pedido.total}</td>            
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
        <span style="display: block; margin-left: 10px; margin-top: 10px; font-size: 14pt"><a href="/index">Volver</a></span>
    </body>
</html>