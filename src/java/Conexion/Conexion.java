/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

//import com.mysql.jdbc.Connection;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author educacion
 */
public class Conexion {

    private String nombreBaseDeDatos;
    private String nombreTabla;
    private String cadenaConexion;
    private String cadenaSQL;
    private boolean esSelect;
    private Connection dbConnection;
    private ResultSet dbResultSet;
    private String usuario;
    private String pass;

    /**
     * @return the nombreBaseDeDatos
     */
    public String getNombreBaseDeDatos() {
        return nombreBaseDeDatos;
    }

    /**
     * @param nombreBaseDeDatos the nombreBaseDeDatos to set
     */
    public void setNombreBaseDeDatos(String nombreBaseDeDatos) {
        this.nombreBaseDeDatos = nombreBaseDeDatos;
    }

    /**
     * @return the nombreTabla
     */
    public String getNombreTabla() {
        return nombreTabla;
    }

    /**
     * @param nombreTabla the nombreTabla to set
     */
    public void setNombreTabla(String nombreTabla) {
        this.nombreTabla = nombreTabla;
    }

    /**
     * @return the cadenaConexion
     */
    public String getCadenaConexion() {
        return cadenaConexion;
    }

    /**
     * @param cadenaConexion the cadenaConexion to set
     */
    public void setCadenaConexion(String cadenaConexion) {
        this.cadenaConexion = cadenaConexion;
    }

    /**
     * @return the cadenaSQL
     */
    public String getCadenaSQL() {
        return cadenaSQL;
    }

    /**
     * @param cadenaSQL the cadenaSQL to set
     */
    public void setCadenaSQL(String cadenaSQL) {
        this.cadenaSQL = cadenaSQL;
    }

    /**
     * @return the esSelect
     */
    public boolean isEsSelect() {
        return esSelect;
    }

    /**
     * @param esSelect the esSelect to set
     */
    public void setEsSelect(boolean esSelect) {
        this.esSelect = esSelect;
    }

    /**
     * @return the dbConnection
     */
    public Connection getDbConnection() {
        return dbConnection;
    }

    /**
     * @param dbConnection the dbConnection to set
     */
    public void setDbConnection(Connection dbConnection) {
        this.dbConnection = dbConnection;
    }

    /**
     * @return the dbResultSet
     */
    public ResultSet getDbResultSet() {
        return dbResultSet;
    }

    /**
     * @param dbResultSet the dbResultSet to set
     */
    public void setDbResultSet(ResultSet dbResultSet) {
        this.dbResultSet = dbResultSet;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }
    public void cerrar(){
        try
        {
            this.getDbConnection().close();
        }
        catch (Exception ex)
        {
            JOptionPane.showMessageDialog(null, "Error al cerrar la conexion" + ex.getMessage());
        }
    }
    public void conectar(){
            
        if (this.getNombreBaseDeDatos().length() == 0){
            JOptionPane.showMessageDialog(null, "Falta el nombre de la base de datos");    
        }
        if (this.getNombreTabla().length() == 0){
            JOptionPane.showMessageDialog(null, "Falta el nombre de la tabla");    
        }
        if (this.getCadenaConexion().length() == 0){
            JOptionPane.showMessageDialog(null, "Falta la conexión a la base de datos");    
        }
        if (this.getCadenaSQL().length() == 0){
            JOptionPane.showMessageDialog(null, "Falta la cadena de conexión");    
        }
        if (this.getUsuario().length() == 0){
            JOptionPane.showMessageDialog(null, "Falta el nombre del usuario");    
        }
        /* si el pass de la base de datos es obligatoria, activaremos la validación del pass
        *
        if (this.getPass().length() == 0){
            JOptionPane.showMessageDialog(null, "Falta el el pass del usuario");    
        }*/
        
        Statement st = null;
        try
        {
            Class.forName(this.getCadenaConexion());
            this.setDbConnection(DriverManager.getConnection
                                (this.getNombreBaseDeDatos(),
                                 this.getUsuario(),
                                 this.getPass()));
            st = this.getDbConnection().createStatement();
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null, "Error de conexión " + ex.getMessage() );        
        }
        
     if (this.isEsSelect()){
       try
       {
           this.setDbResultSet(st.executeQuery(this.getCadenaSQL()));
       }
       catch (Exception ex)
       {
            JOptionPane.showMessageDialog(null, "Error al cargar el resultset " + ex.getMessage() );        
       
       }
     }else{
         try
         {
             int insertarFila = st.executeUpdate(this.getCadenaSQL());
         }
         catch (Exception ex)
         {
            JOptionPane.showMessageDialog(null, "Error de comando SQL " + ex.getMessage() );        
         
         }
     }
    }
}