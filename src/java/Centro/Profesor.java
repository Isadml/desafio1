/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Centro;

/**
 *
 * @author isa
 */
public class Profesor {
    
//********************************ATRIBUTOS*************************************
    
    private int cod_Prof;
    private String nombre;
    private String apellidos;
    private String email;
    private String passw;
    
//********************************CONSTRUCTORES*********************************

    public Profesor(int cod_Prof, String nombre, String apellidos, String email, String passw) {
        this.cod_Prof = cod_Prof;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.passw = passw;
    }
    
//********************************GETTER Y SETTER*******************************
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassw() {
        return passw;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }
    
    public int getCod_Prof() {
        return cod_Prof;
    }

    public void setCod_Prof(int cod_Prof) {
        this.cod_Prof = cod_Prof;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
//********************************MÉTODOS***************************************


    
}
