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
    private String dayleave_id;
    private String dayleave_title;
    private String dayleave_description;
    private Date dateCreate;
    private boolean status;
    private String username;

    public DayLeaveDto() {
    }

    public DayLeaveDto(String dayleave_id, String dayleave_title, String dayleave_description, Date dateCreate, boolean status, String username) {
        this.dayleave_id = dayleave_id;
        this.dayleave_title = dayleave_title;
        this.dayleave_description = dayleave_description;
        this.dateCreate = dateCreate;
        this.status = status;
        this.username = username;
    }

    public String getDayleave_id() {
        return dayleave_id;
    }

    public void setDayleave_id(String dayleave_id) {
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

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
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
    
    
    
}
