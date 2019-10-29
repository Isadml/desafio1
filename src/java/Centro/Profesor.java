/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Centro;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

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
    private int rol;
    private byte[] foto; 
    private Blob fotoBlob;
    
//********************************CONSTRUCTORES*********************************

    public Profesor(String nombre, String apellidos, String email, String passw, int cod_Prof, int rol) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.passw = passw;
        this.cod_Prof = cod_Prof;
        this.rol = rol;
    }
    
    public Profesor(String nombre, String apellidos, String email, String passw, int cod_Prof) {
        this.cod_Prof = cod_Prof;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.passw = passw;
    }

    public Profesor(int cod_Prof, String nombre, String apellidos, String email, String passw, int rol, byte[] foto, Blob fotoBlob) {
        this.cod_Prof = cod_Prof;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.passw = passw;
        this.rol = rol;
        this.foto = foto;
        this.fotoBlob = fotoBlob;
    }

    public Profesor(int cod_Prof, String apellidos, String email, String passw, int rol, Blob fotoBlob) {
        this.cod_Prof = cod_Prof;
        this.apellidos = apellidos;
        this.email = email;
        this.passw = passw;
        this.rol = rol;
        this.fotoBlob = fotoBlob;
    }
    
    

    public Profesor(String string, String string0, String string1, String string2, int aInt, int aInt0, Blob blob) {
        
    }

    public Profesor() {
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
    
     public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
    
    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public Blob getFotoBlob() {
        return fotoBlob;
    }

    public void setFotoBlob(Blob fotoBlob) {
        this.fotoBlob = fotoBlob;
    }
    
      public String getFotoimgString() {
        String image =null;
        try {
            byte[] imageBytes = this.fotoBlob.getBytes(1, (int) this.fotoBlob.length());
            String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
            image = "data:image/jpg;base64," + encodedImage;
             
        } catch (SQLException ex) {
        }
        return image;
    }
    
//********************************MÉTODOS***************************************

    


}
