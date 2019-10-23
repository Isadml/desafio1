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

    /**
     * Inicia una nueva conexión con la base de datos
     */
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

    /**
     * Cerrar la base de datos
     */
    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    /**
     * Select para saber si el profesor existe en la BBDD
     *
     * @param email
     * @return
     */
    public static Profesor existeProfesor(String email) {
        Profesor existe = null;
        try {
            String sentencia = "SELECT * FROM profesores WHERE email = '" + email + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Profesor(Conj_Registros.getInt("codProf"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getString("email"), Conj_Registros.getString("password"));
                int cod = existe.getCod_Prof();
                String sentencia2 = "SELECT cod_privilegio FROM permisos_Profesores WHERE cod_Prof = " + cod;
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
                if (ConexionEstatica.Conj_Registros.next()) {
                    existe.setRol(Conj_Registros.getInt("cod_privilegio"));
                }
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
            String sentencia = "SELECT * FROM profesores";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p = new Profesor(Conj_Registros.getInt("codProf"), Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getString("password"));
                int cod = p.getCod_Prof();
                String sentencia2 = "SELECT cod_privilegio FROM permisos_Profesores WHERE cod_Prof = " + cod;
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia2);
                while (Conj_Registros.next()) {
                    p.setRol(Conj_Registros.getInt("cod_privilegio"));
                }
                usuariosBD.add(p);
            }
        } catch (SQLException ex) {
        }
        return usuariosBD;
    }

    /**
     * Select para obtener las reservas que ha realizado cada profesor
     *
     * @param codProf
     * @return
     */
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

    //----------------------------------------------------------
    /**
     * Insert para añadir profesores en la BBDD
     *
     * @param email
     * @param nombre
     * @param apellido
     * @param password
     * @param cod_Prof
     * @throws SQLException
     */
    public static void insertarProfesor(String email, String nombre, String apellido, String password, int cod_Prof) throws SQLException {
        String Sentencia = "INSERT INTO profesores VALUES ('" + nombre + "','" + apellido + "','" + email + "', '" + password + "', " + cod_Prof + ")";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Delete para borrar a un profesor de la BBDD
     *
     * @param codigo
     * @throws SQLException
     */
    public static void borrarProfesor(int codigo) throws SQLException {
        String Sentencia = "DELETE FROM profesores WHERE codProf = " + codigo;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Update para que un profesor pueda modificar su perfil
     *
     * @param email
     * @param nombre
     * @param apellido
     * @param password
     * @param cod_Prof
     * @throws SQLException
     */
    public static void modificarPerfil(String email, String nombre, String apellido, String password, int cod_Prof) throws SQLException {
        String Sentencia = "UPDATE profesores SET nombre = '" + nombre + "', apellido = '" + apellido + "', email = '" + email + "', password = '" + password + "' WHERE codProf = " + cod_Prof;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Update para que el administrador general pueda modificar los perfiles de los
     * profesores
     *
     * @param email
     * @param nombre
     * @param apellido
     * @param cod_Prof
     * @throws SQLException
     */
    public static void gestionarProfesor(String email, String nombre, String apellido, int cod_Prof) throws SQLException {
        String Sentencia = "UPDATE profesores SET nombre = '" + nombre + "', apellido = '" + apellido + "', email = '" + email + "' WHERE codProf = " + cod_Prof;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Update para modificar las reservas
     *
     * @param cod
     * @param cod_Hora
     * @param cod_Aula
     * @param fecha
     * @throws SQLException
     */
    public static void modificarReserva(int cod, int cod_Hora, int cod_Aula, String fecha) throws SQLException {
        String Sentencia = "UPDATE reserva SET cod_Hora = " + cod_Hora + ", cod_Aula = " + cod_Aula + ", fecha = '" + fecha + "' WHERE cod_Reserva = " + cod;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     *Delete para borrar una reserva
     * @param cod
     * @throws SQLException
     */
    public static void borrarReserva(int cod) throws SQLException {
        String Sentencia = "DELETE FROM reserva WHERE cod_Reserva = " + cod;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Update para modificar permisos
     * @param cod_Prof
     * @param privi
     * @throws SQLException 
     */
    public static void modificarPermisos(int cod_Prof, int privi) throws SQLException {
        String Sentencia = "UPDATE permisos_Profesores SET cod_privilegio = " + privi + " WHERE codProf = " + cod_Prof;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Insert para añadir permisos
     * @param cod_Prof
     * @param privi
     * @throws SQLException 
     */
    public static void añadirPermisos(int cod_Prof, int privi) throws SQLException {
        String Sentencia = "UPDATE permisos_Profesores SET cod_privilegio = " + privi + ", codProf = " + cod_Prof;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    /**
     * Delete para borrar permisos si se elimina a un profesor
     * @param codigo
     * @throws SQLException 
     */
    public static void borrarPrivilegios(int codigo) throws SQLException {
        String Sentencia = "DELETE FROM permisos_Profesores WHERE codProf = " + codigo;
        Sentencia_SQL.executeUpdate(Sentencia);
    }

}
