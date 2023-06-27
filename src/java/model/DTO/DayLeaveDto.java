/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class DayLeaveDto {
    private int dayleave_id;
    private String dayleave_title;
    private String dayleave_description;
    private Date date_created;
    private boolean status;
    private String username;
    private String employeeID;
    private String employeeName;

    public DayLeaveDto() {
    }

    public DayLeaveDto(int dayleave_id, String dayleave_title, String dayleave_description, Date date_created, boolean status, String username, String employeeID, String employeeName) {
        this.dayleave_id = dayleave_id;
        this.dayleave_title = dayleave_title;
        this.dayleave_description = dayleave_description;
        this.date_created = date_created;
        this.status = status;
        this.username = username;
        this.employeeID = employeeID;
        this.employeeName = employeeName;
    }

    public int getDayleave_id() {
        return dayleave_id;
    }

    public void setDayleave_id(int dayleave_id) {
        this.dayleave_id = dayleave_id;
    }

    public String getDayleave_title() {
        return dayleave_title;
    }

    public void setDayleave_title(String dayleave_title) {
        this.dayleave_title = dayleave_title;
    }

    public String getDayleave_description() {
        return dayleave_description;
    }

    public void setDayleave_description(String dayleave_description) {
        this.dayleave_description = dayleave_description;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
    
    
   
}
