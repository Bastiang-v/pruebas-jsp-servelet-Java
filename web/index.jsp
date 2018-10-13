<%-- 
    Document   : index
    Created on : 27-ago-2018, 21:14:38
    Author     : Docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desarrollo web</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
            session.setAttribute("logeo", null);
            if(request.getParameter("txtUsuario")==null)
            {
        %>
        <table width="100%" border ="1" class="table">
            <form method='get'>
                <tr>
                    <td width="678">Usuario</td>
                    <td width="685"><label for ="txtUsuario"></label>
                        <input type="text" name="txtUsuario" id="txtUsuario"/>
                    </td>
                </tr>
                <tr>
                    <td width="678">Clave</td>
                    <td width="685"><label for ="txtPass"></label>
                        <input type="text" name="txtPass" id="txtPass"/>
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" name="btnEnviar" value="Enviar"</td>
                </tr>
            </form>
        </table>
        <%
            }
            else
            {
                if(request.getParameter("txtUsuario").equals("123"))
                {
                    session.setAttribute("logeo", "si");
        %>
                   <table width="100%" border ="1">
                         <tr>
                            <td> BIENVENIDO </td>
                        </tr>
                        <tr>
                            <td><a href="consulta.jsp">Consulta cliente</a></td>
                        </tr>
                        <tr>
                            <td><a href="insertar.jsp">Insertar cliente</a> </td>
                            <td></td>
                        </tr>
                     </table>
        <%
                }
            }
        %>
    </body>
</html>
