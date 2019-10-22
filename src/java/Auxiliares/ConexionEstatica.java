/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Auxiliares;

import Centro.Profesor;
import Centro.Reserva;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.swing.JOptionPane;

/**
 *
 * @author isa
 */
public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.user, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static Profesor existeProfesor(String email) {
        Profesor existe = null;
        try {
            String sentencia = "SELECT * FROM profesores WHERE email = '" + email + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Profesor(Conj_Registros.getInt("codProf"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getString("email"), Conj_Registros.getString("password"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerProfesores() {
        LinkedList usuariosBD = new LinkedList<>();
        Profesor p = null;
        try {
            String sentencia = "SELECT * FROM usuarios";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p = new Profesor(Conj_Registros.getInt("codProf"), Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getString("password"));
                usuariosBD.add(p);
            }
        } catch (SQLException ex) {
        }
        return usuariosBD;
    }

    public static LinkedList obtenerReservas(int codProf) {
        LinkedList reservaBD = new LinkedList<>();
        Reserva r = null;
        try {
            String sentencia = "SELECT * FROM reserva, horario WHERE cod_Prof = '" + codProf + "' AND horario.cod_Hora = reserva.cod_Hora";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new Reserva(Conj_Registros.getInt("cod_Prof"), Conj_Registros.getInt("cod_Aula"), Conj_Registros.getInt("cod_Hora"), Conj_Registros.getString("fecha"), Conj_Registros.getInt("cod_Reserva"), Conj_Registros.getString("hora_Inicio"), Conj_Registros.getString("hora_Finalizar"));
                reservaBD.add(r);
            }
        } catch (SQLException ex) {
        }
        return reservaBD;
    }
    
    /**public static LinkedList obtenerAula(int cod) {
        LinkedList reservaBD = new LinkedList<>();
        Reserva r = null;
        try {
            String sentencia = "SELECT * FROM reserva, horario WHERE cod_Prof = '" + codProf + "' AND horario.cod_Hora = reserva.cod_Hora";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new Reserva(Conj_Registros.getInt("cod_Prof"), Conj_Registros.getInt("cod_Aula"), Conj_Registros.getInt("cod_Hora"), Conj_Registros.getString("fecha"), Conj_Registros.getInt("cod_Reserva"), Conj_Registros.getString("hora_Inicio"), Conj_Registros.getString("hora_Finalizar"));
                reservaBD.add(r);
            }
        } catch (SQLException ex) {
        }
        return reservaBD;
    }**/

    //----------------------------------------------------------
    public static void insertarProfesor(String email, String nombre, String apellido, String password, int cod_Prof) throws SQLException {
        String Sentencia = "INSERT INTO profesores VALUES ('" + nombre + "','" + apellido + "','" + email + "', '" + password + "', " + cod_Prof + ")";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static void borrarProfesor(String email) throws SQLException {
        String Sentencia = "DELETE FROM usuarios WHERE email = '" + email + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static void modificarProfesor(String codProf, String nombre) throws SQLException {
        String Sentencia = "UPDATE usuarios SET nombre = " + nombre + " WHERE codProf = '" + codProf + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static void modificarReserva(int cod, int cod_Hora, int cod_Aula, String fecha) throws SQLException {
        String Sentencia = "UPDATE reserva SET cod_Hora = " + cod_Hora + ", cod_Aula = " + cod_Aula + ", fecha = '" + fecha + "' WHERE cod_Reserva = " + cod;
        Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    //----------------------------------------------------------
    public static void borrarReserva(int cod) throws SQLException {
        String Sentencia = "DELETE FROM reserva WHERE cod_Reserva = " + cod;
        Sentencia_SQL.executeUpdate(Sentencia);
    }
}
