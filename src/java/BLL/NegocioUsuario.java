package BLL;

import Conexion.*;
import DTO.*;
import java.util.*;
import javax.swing.JOptionPane;

public class NegocioUsuario {
    
    private Conexion conec1;
    public Conexion getConec1()
    {
        return conec1;
    }
    public void setConec1(Conexion conect1)
    {
        this.conec1 = conect1;
    }
   
    public void configuraConexion() {
        this.setConec1(new Conexion());
        this.getConec1().setNombreBaseDeDatos("jdbc:mysql://localhost:3306/desarrolloweb1");
        this.getConec1().setNombreTabla("usuario");
        this.getConec1().setCadenaConexion("com.mysql.jdbc.Driver");
        this.getConec1().setUsuario("root");
        this.getConec1().setPass("");
    }
    
    public ArrayList getCliente()
    {
        ArrayList auxListaCliente = new ArrayList();
         this.configuraConexion();
        this.getConec1().setCadenaSQL("SELECT * FROM " + this.getConec1().getNombreTabla());
        this.getConec1().setEsSelect(true);
        this.getConec1().conectar();
        
        try
        {
            while(this.getConec1().getDbResultSet().next())
            {
                Usuario auxUsuario = new Usuario();
                auxUsuario.setId(this.getConec1().getDbResultSet().getInt("id_usuario"));
                auxUsuario.setNombre(this.getConec1().getDbResultSet().getString("nombre"));
                auxUsuario.setApellido(this.getConec1().getDbResultSet().getString("apellido"));
                auxUsuario.setTipo(this.getConec1().getDbResultSet().getString("id_tipousuario"));
                auxListaCliente.add(auxUsuario);
            }
        }
        catch( Exception ex)
        {
            JOptionPane.showMessageDialog(null, "error de comando consulta SELECT"+ ex.getMessage());
        }
        return auxListaCliente;
    }
    public void InsertarUsuario(Usuario usuario)
    {
        this.configuraConexion();
        this.getConec1().setCadenaSQL("insert into usuario (nombre,apellido,id_tipousuario) "
                + "values('"+usuario.getNombre()+"','"+usuario.getApellido()+"','"+usuario.getTipo()+"')");
        this.getConec1().setEsSelect(false);
        this.getConec1().conectar();
    }
    public int loginUsuario(Usuario usuario)
    {
        this.configuraConexion();
        this.getConec1().setCadenaSQL("select count");
        this.getConec1().setEsSelect(true);
        this.getConec1().conectar();
      
        return 1;
    }
    
    public ArrayList getTipoCliente()
    {
        ArrayList auxListaCliente = new ArrayList();
         this.configuraConexion();
        this.getConec1().setCadenaSQL("SELECT * FROM TIPOUSUARIO");
        this.getConec1().setEsSelect(true);
        this.getConec1().conectar();
        
        try
        {
            while(this.getConec1().getDbResultSet().next())
            {
                TipoUsuario auxTipoUsuario = new TipoUsuario();
                auxTipoUsuario.setId_tipousuario(this.getConec1().getDbResultSet().getInt("id_tipousuario"));
                auxTipoUsuario.setTipousuario(this.getConec1().getDbResultSet().getString("tipousuario"));
  
                auxListaCliente.add(auxTipoUsuario);
            }
        }
        catch( Exception ex)
        {
            JOptionPane.showMessageDialog(null, "error de comando consulta SELECT"+ ex.getMessage());
        }
        return auxListaCliente;
    }
}
