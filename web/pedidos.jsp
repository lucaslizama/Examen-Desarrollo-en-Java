<%-- 
    Document   : confirmarCompra
    Created on : Nov 29, 2016, 9:00:01 PM
    Author     : Pancho
--%>

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
    <h1>"Donde la Abuela" :: Agregar Pedido :: Paso 2</h1>
    <fieldset>
        <legend>Confirmar Pedido</legend>
        <table>
            <thead> 
            <th>  </th>
            <th>  </th>                
            </thead>
            <tbody>
            <c:if test="${listaPedido != null}">
                <c:forEach var="pedido" items="${listaPedido}">
                    <tr>
                        <td>${pedido.idPlato.nombrePlato}</td>
                        <td>${pedido.idPlato.precioPlato}</td>                            
                    </tr>
                    <tr>
                        <td>${pedido.idBebida.nombreBebida}</td>
                        <td>${pedido.idBebida.precioBebida}</td>
                    </tr>
                    <tr>
                        <td>A Domicilio</td>
                        <td>${pedido.despacho}</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td>${pedido.total}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <span style="display: block; margin-left: 10px; margin-top: 10px; font-size: 14pt"><a href="/generarPedido">Volver</a></span>
    </fieldset>
    <span style="display: block; margin-left: 10px; margin-top: 10px; font-size: 14pt"><a href="/index">Ir al Menú</a></span>

</body>
</html>
