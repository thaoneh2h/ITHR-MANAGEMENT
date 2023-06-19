/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author PREDATOR
 */
public class TimekeepingDTO {
    private String employee_id;
    private String employee_name;
    private Date date;
    private Time timekiN;
    private Time timeOut;
    private String status;

    public TimekeepingDTO() {
    }

    public TimekeepingDTO(String employee_id, String employee_name, Date date, Time timekiN, Time timeOut, String status) {
        this.employee_id = employee_id;
        this.employee_name = employee_name;
        this.date = date;
        this.timekiN = timekiN;
        this.timeOut = timeOut;
        this.status = status;
    }

    /**
     * @return the employee_id
     */
    public String getEmployee_id() {
        return employee_id;
    }

    /**
     * @param employee_id the employee_id to set
     */
    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    /**
     * @return the employee_name
     */
    public String getEmployee_name() {
        return employee_name;
    }

    /**
     * @param employee_name the employee_name to set
     */
    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the timekiN
     */
    public Time getTimekiN() {
        return timekiN;
    }

    /**
     * @param timekiN the timekiN to set
     */
    public void setTimekiN(Time timekiN) {
        this.timekiN = timekiN;
    }

    /**
     * @return the timeOut
     */
    public Time getTimeOut() {
        return timeOut;
    }

    /**
     * @param timeOut the timeOut to set
     */
    public void setTimeOut(Time timeOut) {
        this.timeOut = timeOut;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
}
