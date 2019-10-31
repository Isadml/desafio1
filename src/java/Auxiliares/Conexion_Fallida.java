
/**package Auxiliares;

import Centro.Aula;
import Centro.Horario;
import Centro.Profesor;
import Centro.Reserva;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.swing.JOptionPane;

/**
 *
 * @author isa
 */
/**public class Conexion_Fallida {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    /**
     * Inicia una nueva conexión con la base de datos
     */
    /**public static void nueva() {
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
    /**public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
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
    /**public static void modificarPerfil(String email, String nombre, String apellido, String password, int cod_Prof, Blob foto) throws SQLException {
        String Sentencia = "UPDATE profesores SET nombre = ?, apellido = ?, email = ?, password = ?, foto = ? WHERE codProf = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setString(1, nombre);
            sentenciaPreparada.setString(2, apellido);
            sentenciaPreparada.setString(3, email);
            sentenciaPreparada.setString(4, password);
            sentenciaPreparada.setBlob(5, foto);
            sentenciaPreparada.setInt(7, cod_Prof);
            sentenciaPreparada.executeQuery();
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
    /**public static void insertarReserva(int cod_Hora, int cod_Aula, String fecha, int cod_Prof, int num) throws SQLException {
        String Sentencia = "INSERT INTO reserva VALUES ( ?, ?, ?, ?, ?)";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, cod_Prof);
            sentenciaPreparada.setInt(2, cod_Aula);
            sentenciaPreparada.setInt(3, cod_Hora);
            sentenciaPreparada.setString(4, fecha);
            sentenciaPreparada.setInt(3, num);
            sentenciaPreparada.executeQuery();
    }

    //----------------------------------------------------------
    /**
     * Delete para borrar una reserva
     *
     * @param cod
     * @throws SQLException
     */
    /**public static void borrarReserva(int cod) throws SQLException {
        String Sentencia = "DELETE FROM reserva WHERE cod_Reserva = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, cod);
            sentenciaPreparada.executeQuery();
    }

    //----------------------------------------------------------
    /**
     * Update para modificar permisos
     *
     * @param cod_Prof
     * @param privi
     * @throws SQLException
     */
    /**public static void modificarPermisos(int cod_Prof, int privi) throws SQLException {
        String Sentencia = "UPDATE permisos_Profesores SET cod_privilegio = ? WHERE cod_Prof = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, privi);
            sentenciaPreparada.setInt(2, cod_Prof);
            sentenciaPreparada.executeQuery();
    }

    //----------------------------------------------------------
    /**
     * Insert para añadir permisos
     *
     * @param cod_Prof
     * @param privi
     * @throws SQLException
     */
    /**public static void darPermisos(int cod_Prof, int privi) throws SQLException {
        String Sentencia = "INSERT INTO  permisos_Profesores VALUES( ?, ?)";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, privi);
            sentenciaPreparada.setInt(2, cod_Prof);
            sentenciaPreparada.executeQuery();
    }

    //----------------------------------------------------------
    /**
     * Delete para borrar permisos si se elimina a un profesor
     *
     * @param codigo
     * @throws SQLException
     */
    /**public static void borrarPrivilegios(int codigo) throws SQLException {
        String Sentencia = "DELETE FROM permisos_Profesores WHERE cod_Prof = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, codigo);
            sentenciaPreparada.executeQuery();
    }

//----------------------------------------------------------
    /**
     * Update para modificar aulas
     *
     * @param cod
     * @param descripcion
     * @throws SQLException
     */
    /**public static void modificarAula(int cod, String descripcion) throws SQLException {
        String Sentencia = "UPDATE aulas SET descripcion = ? WHERE cod_Aula = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setString(1, descripcion);
            sentenciaPreparada.setInt(2, cod);
            sentenciaPreparada.executeQuery();
    }

    //----------------------------------------------------------
    /**
     * Delete para borrar aulas de la BBDD
     *
     * @param codigo
     * @throws SQLException
     */
    /**public static void borrarAulas(int codigo) throws SQLException {
        String Sentencia = "DELETE FROM aulas WHERE cod_Aula= ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, codigo);
            sentenciaPreparada.executeQuery();
    }
    
    //----------------------------------------------------------
    /**
     * Insert para añadir aulas a la BBDD
     * @param cod_Prof
     * @param privi
     * @throws SQLException 
     */
    /**public static void insertarAula(int cod, String desc) throws SQLException {
        String Sentencia = "INSERT INTO  aulas VALUES( ?, ?)";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, cod);
            sentenciaPreparada.setString(2, desc);
            sentenciaPreparada.executeQuery();
    }
    
    //----------------------------------------------------------
    /**
     * Update para modificar las horas almacenadas en la BBDD
     * @param cod
     * @param descripcion
     * @throws SQLException 
     */
    /**public static void modificarHorario(int cod, String hora_i, String hora_f) throws SQLException {
        String Sentencia = "UPDATE horario SET hora_Inicio = ? , hora_Finalizar = ? WHERE cod_Hora = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setString(1, hora_i);
            sentenciaPreparada.setString(2, hora_f);
            sentenciaPreparada.setInt(3, cod);
            sentenciaPreparada.executeQuery();
    }

    //----------------------------------------------------------
    /**
     * Delete para borrar franjas horarias de la BBDD
     * @param codigo
     * @throws SQLException 
     */
    /**public static void borrarHorario(int codigo) throws SQLException {
        String Sentencia = "DELETE FROM horario WHERE cod_Hora = ?";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, codigo);
            sentenciaPreparada.executeQuery();
    }
    
    //----------------------------------------------------------
    /**
     * Insert para añadir franjas horarias a la BBDD
     * @param cod
     * @param desc
     * @throws SQLException 
     */
    /**public static void insertarHora(int cod, String hora_i, String hora_f) throws SQLException {
        String Sentencia = "INSERT INTO  horario VALUES( ?, ?, ?)";
        PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(Sentencia);
            sentenciaPreparada.setInt(1, cod);
            sentenciaPreparada.setString(2, hora_i);
            sentenciaPreparada.setString(3, hora_f);
            sentenciaPreparada.executeQuery();
    }
}
**/
