<%-- 
    Document   : insertar
    Created on : 03-sep-2018, 20:12:24
    Author     : Docente
--%>

<%@page import="BLL.NegocioUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        if( session.getAttribute("logeo")=="si")
        {
            if(request.getParameter("txtNombre")==null &&
                    request.getParameter("txtApellido")==null)
            {
        %>
        <table width="518" border="1">
            <form method="post" action="">
                <tr>
                    <td>Nombre:</td> 
                    <td>    
                        <input type="text" name="txtNombre" id="txtNombre">
                    </td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td>    
                       <input type="text" name="txtApellido" id="txtApellido">
                    </td>
                </tr>
                <tr>
                    <td>Tipo Usuario:</td>
                    <td>  
                        <%
        BLL.NegocioUsuario auxNego = new BLL.NegocioUsuario();
                
        java.util.Iterator iter = auxNego.getTipoCliente().iterator();    
        out.println("<select name=\"id_tipousuario\"> class=\"form-control\"");
        while(iter.hasNext())
        {
            DTO.TipoUsuario auxUsuarios = new DTO.TipoUsuario();
            auxUsuarios = (DTO.TipoUsuario) iter.next();
            
            out.println("<option value="+auxUsuarios.getId_tipousuario() +">" + auxUsuarios.getTipousuario()+ "</option>");
        }
        out.println("</select>");
                        %>
                    </td>
                </tr>
               
                <tr>
                    <td>Enviar</td>
                    <td>    
                        <input class="btn btn-lg btn-success" type="submit" name="btnEnviar" id="btnEnviar" value="Enviar" >
                    </td>
                </tr>
            </form> 
        </table>
        <%
            }
            else
            {
                BLL.NegocioUsuario auxNego = new BLL.NegocioUsuario();
                DTO.Usuario auxUsuario = new DTO.Usuario();
                auxUsuario.setNombre(request.getParameter("txtNombre"));
                auxUsuario.setApellido(request.getParameter("txtApellido"));
                auxUsuario.setTipo(request.getParameter("id_tipousuario"));
                auxNego.InsertarUsuario(auxUsuario);
            }
        }
        else
        {
        %>
        <h1>NO HAY SESION ENCONTRADA</h1>
        <%
        }
        %>
    </body>
</html>
