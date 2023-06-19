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
public class ApplicationDTO {
    private int id;
    private String title;
    private String description;
    private Date dateCreate;
    private boolean status;
    private String username;
    private String type;
    private String employeeName;
    private int presentDay;
    private int lateDay;
    private int absentDay;
    private int overtimeDay;

    public ApplicationDTO() {
    }

    public ApplicationDTO(int id, String title, String description, Date dateCreate, boolean status, String username, String type, String employeeName, int presentDay, int lateDay, int absentDay, int overtimeDay) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.dateCreate = dateCreate;
        this.status = status;
        this.username = username;
        this.type = type;
        this.employeeName = employeeName;
        this.presentDay = presentDay;
        this.lateDay = lateDay;
        this.absentDay = absentDay;
        this.overtimeDay = overtimeDay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public int getPresentDay() {
        return presentDay;
    }

    public void setPresentDay(int presentDay) {
        this.presentDay = presentDay;
    }

    public int getLateDay() {
        return lateDay;
    }

    public void setLateDay(int lateDay) {
        this.lateDay = lateDay;
    }

    public int getAbsentDay() {
        return absentDay;
    }

    public void setAbsentDay(int absentDay) {
        this.absentDay = absentDay;
    }

    public int getOvertimeDay() {
        return overtimeDay;
    }

    public void setOvertimeDay(int overtimeDay) {
        this.overtimeDay = overtimeDay;
    }
    
    
    
}
