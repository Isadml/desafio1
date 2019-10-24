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
public class Horario {
    
//********************************ATRIBUTOS*************************************
    
    private int cod_Hora;
    private String hora_Inicio;
    private String hora_Finalizar;
    
//********************************CONSTRUCTORES*********************************

    public Horario(int cod_Hora, String hora_Inicio, String hora_Finalizar) {
        this.cod_Hora = cod_Hora;
        this.hora_Inicio = hora_Inicio;
        this.hora_Finalizar = hora_Finalizar;
    }
    
//********************************GETTER Y SETTER*******************************

    public int getCod_Hora() {
        return cod_Hora;
    }

    public void setCod_Hora(int cod_Hora) {
        this.cod_Hora = cod_Hora;
    }

    public String getHora_Inicio() {
        return hora_Inicio;
    }

    public void setHora_Inicio(String hora_Inicio) {
        this.hora_Inicio = hora_Inicio;
    }

    public String getHora_Finalizar() {
        return hora_Finalizar;
    }

    public void setHora_Finalizar(String hora_Finalizar) {
        this.hora_Finalizar = hora_Finalizar;
    }
    
//********************************MÉTODOS***************************************
}
