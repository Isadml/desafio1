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
public class Aula {
   
//********************************ATRIBUTOS*************************************
    private int codAula;
    private String descripcion;
    
    
//********************************CONSTRUCTORES*********************************
   
    public Aula(int codAula, String descripcion) {
        this.codAula = codAula;
        this.descripcion = descripcion;
    }
    
//********************************GETTER Y SETTER*******************************
    
    public int getCodAula() {
        return codAula;
    }

    public void setCodAula(int codAula) {
        this.codAula = codAula;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

//********************************MÉTODOS***************************************

    

    
    
}
