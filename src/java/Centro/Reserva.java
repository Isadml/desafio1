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
public class Reserva {
    
//********************************ATRIBUTOS*************************************
    private int cod_Prof;
    private int cod_Aula;
    private int cod_Hora;
    private String fecha;
    private int cod_Reserva;
    private String hora_Inicio;
    private String hora_Finalizar;
    
    
//********************************CONSTRUCTORES*********************************

    public Reserva(int cod_Prof, int cod_Aula, int cod_Hora, String fecha, int cod_Reserva, String hora_Inicio, String hora_Finalizar) {
        this.cod_Prof = cod_Prof;
        this.cod_Aula = cod_Aula;
        this.cod_Hora = cod_Hora;
        this.fecha = fecha;
        this.cod_Reserva = cod_Reserva;
        this.hora_Inicio = hora_Inicio;
        this.hora_Finalizar = hora_Finalizar;
    }
    
    
//********************************GETTER Y SETTER*******************************

    public int getCod_Prof() {
        return cod_Prof;
    }

    public void setCod_Prof(int cod_Prof) {
        this.cod_Prof = cod_Prof;
    }

    public int getCod_Aula() {
        return cod_Aula;
    }

    public void setCod_Aula(int cod_Aula) {
        this.cod_Aula = cod_Aula;
    }

    public int getCod_Hora() {
        return cod_Hora;
    }

    public void setCod_Hora(int cod_Hora) {
        this.cod_Hora = cod_Hora;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getCod_Reserva() {
        return cod_Reserva;
    }

    public void setCod_Reserva(int cod_Reserva) {
        this.cod_Reserva = cod_Reserva;
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
