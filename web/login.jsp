<%-- 
    Document   : login
    Created on : 29-Nov-2016, 15:37:56
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <h1>"Donde la Abuela"</h1>
        <fieldset>
            <legend>Acceso</legend>
            <form action="/login" method="POST">
                <div class="form-field">
                    <label for="rut">Rut</label>
                    <input type="number" name="rut" required>
                    <span>-</span>
                    <input id="dv" type="text" name="dv" maxlength="1" required>
                </div>
                <div class="form-field">
                    <label for="clave">Clave</label>
                    <input type="password" name="clave" required>
                </div>
                <div class="form-field">
                    <button type="submit">Ingresar</button>
                    <span style="color:${color}">${mensaje}</span>
                </div>
                <div class="form-field">
                    <span><a href="/index">Volver</a></span>
                </div>
            </form>
        </fieldset>
    </body>
</html>
