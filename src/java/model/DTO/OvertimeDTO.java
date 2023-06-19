/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;


import java.sql.Timestamp;
import java.util.Date;


/**
 *
 * @author 23030
 */
public class OvertimeDTO {
    private String overtime_Id;
    private String employeeId;
    private String employee_name;
    private String department_id;
    private String role;
    
    private String workingStatus;
    private boolean hasOvertime;
    
    private Date overtimeStartDateTime;
    private String month;
    private int overtimeDuration;

    public OvertimeDTO() {
    }

    public OvertimeDTO(String overtime_Id, String employeeId, String employee_name, String department_id, String role, String workingStatus, boolean hasOvertime, Date overtimeStartDateTime, String month, int overtimeDuration) {
        this.overtime_Id = overtime_Id;
        this.employeeId = employeeId;
        this.employee_name = employee_name;
        this.department_id = department_id;
        this.role = role;
        this.workingStatus = workingStatus;
        this.hasOvertime = hasOvertime;
        this.overtimeStartDateTime = overtimeStartDateTime;
        this.month = month;
        this.overtimeDuration = overtimeDuration;
    }

    public String getOvertime_Id() {
        return overtime_Id;
    }

    public void setOvertime_Id(String overtime_Id) {
        this.overtime_Id = overtime_Id;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getWorkingStatus() {
        return workingStatus;
    }

    public void setWorkingStatus(String workingStatus) {
        this.workingStatus = workingStatus;
    }

    public boolean isHasOvertime() {
        return hasOvertime;
    }

    public void setHasOvertime(boolean hasOvertime) {
        this.hasOvertime = hasOvertime;
    }

    public Date getOvertimeStartDateTime() {
        return overtimeStartDateTime;
    }

    public void setOvertimeStartDateTime(Date overtimeStartDateTime) {
        this.overtimeStartDateTime = overtimeStartDateTime;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getOvertimeDuration() {
        return overtimeDuration;
    }

    public void setOvertimeDuration(int overtimeDuration) {
        this.overtimeDuration = overtimeDuration;
    }

    
    
}
