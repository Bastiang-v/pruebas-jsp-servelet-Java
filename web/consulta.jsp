<%-- 
    Document   : consulta
    Created on : 06-sep-2016, 19:01:28
    Author     : educacion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
        <h1 class="blockquote text-center">Hello World!</h1>
        <%
        if( session.getAttribute("logeo")=="si"){    
        BLL.NegocioUsuario auxNego = new BLL.NegocioUsuario();
        out.println("<div class=\"blockquote text-center\">");
        out.println("<table class=\"table\" border=\"1\"><tr><td>Código</td><td>Nombre</td><td>Apellido</td><td>Tipo</td>");
        
        java.util.Iterator iter = auxNego.getCliente().iterator();
        
        while(iter.hasNext())
        {
            DTO.Usuario auxUsuarios = new DTO.Usuario();
            auxUsuarios = (DTO.Usuario) iter.next();
            
            out.println("<tr>");
            out.println("<td>" + auxUsuarios.getId()+ "</td>");
            out.println("<td>" + auxUsuarios.getNombre() + "</td>");
            out.println("<td>" + auxUsuarios.getApellido() + "</td>");
            if((auxUsuarios.getTipo()).equals("1"))
            {
                out.println("<td>Docente</td>");
            } 
            else
            {
                out.println("<td>Estudiante</td>");
            }  
            out.println("</tr>");
            out.println("</div>");
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
