/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

/**
 *
 * @author ADMIN
 */
public class ReportDTO {
    private int id;
    private String title;
    private String employeeName;
    private int late_day;
    private int absent_day;
    private int overtime_day;
    private String employeeID;
    private int month;
    private int excused_absent_day;
    private String department;

    public ReportDTO() {
    }

    public ReportDTO(int id, String title, String employeeName, int late_day, int absent_day, int overtime_day, String employeeID, int month, int excused_absent_day, String department) {
        this.id = id;
        this.title = title;
        this.employeeName = employeeName;
        this.late_day = late_day;
        this.absent_day = absent_day;
        this.overtime_day = overtime_day;
        this.employeeID = employeeID;
        this.month = month;
        this.excused_absent_day = excused_absent_day;
        this.department = department;
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

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public int getLate_day() {
        return late_day;
    }

    public void setLate_day(int late_day) {
        this.late_day = late_day;
    }

    public int getAbsent_day() {
        return absent_day;
    }

    public void setAbsent_day(int absent_day) {
        this.absent_day = absent_day;
    }

    public int getOvertime_day() {
        return overtime_day;
    }

    public void setOvertime_day(int overtime_day) {
        this.overtime_day = overtime_day;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getExcused_absent_day() {
        return excused_absent_day;
    }

    public void setExcused_absent_day(int excused_absent_day) {
        this.excused_absent_day = excused_absent_day;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    
    
    
}
