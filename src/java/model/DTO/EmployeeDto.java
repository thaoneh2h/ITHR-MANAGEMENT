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
public class EmployeeDto {
    private String employee_id;
    private String department_id;
    private String employee_name;
    private Date employee_dob;
    private String employee_phone;
    private Date datejoin;
    private String employee_contractId;
    private int age;
    private boolean gender;
    private String supervision_id;
    private String employee_email;
    private String employee_address;
    private String employee_leaveDay;
    private String departmentName;
    private String role;
    private String username;
    private String password;
    private String photo;
    private boolean status;
    private String jobTitle;

    public EmployeeDto() {
    }

    
    
    public EmployeeDto(String employee_id, String department_id, String employee_name, Date employee_dob, String employee_phone, Date datejoin, String employee_contractId, int age, boolean gender, String supervision_id, 
            String employee_email, String employee_address, String employee_leaveDay, String departmentName, String role, String username, String password, String photo, boolean status, String jobTitle) {
        this.employee_id = employee_id;
        this.department_id = department_id;
        this.employee_name = employee_name;
        this.employee_dob = employee_dob;
        this.employee_phone = employee_phone;
        this.datejoin = datejoin;
        this.employee_contractId = employee_contractId;
        this.age = age;
        this.gender = gender;
        this.supervision_id = supervision_id;
        this.employee_email = employee_email;
        this.employee_address = employee_address;
        this.employee_leaveDay = employee_leaveDay;
        this.departmentName = departmentName;
        this.role = role;
        this.username = username;
        this.password = password;
        this.photo = photo;
        this.status = status;
        this.jobTitle = jobTitle;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public Date getEmployee_dob() {
        return employee_dob;
    }

    public void setEmployee_dob(Date employee_dob) {
        this.employee_dob = employee_dob;
    }

    public String getEmployee_phone() {
        return employee_phone;
    }

    public void setEmployee_phone(String employee_phone) {
        this.employee_phone = employee_phone;
    }

    public Date getDatejoin() {
        return datejoin;
    }

    public void setDatejoin(Date datejoin) {
        this.datejoin = datejoin;
    }

    public String getEmployee_contractId() {
        return employee_contractId;
    }

    public void setEmployee_contractId(String employee_contractId) {
        this.employee_contractId = employee_contractId;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getSupervision_id() {
        return supervision_id;
    }

    public void setSupervision_id(String supervision_id) {
        this.supervision_id = supervision_id;
    }

    public String getEmployee_email() {
        return employee_email;
    }

    public void setEmployee_email(String employee_email) {
        this.employee_email = employee_email;
    }

    public String getEmployee_address() {
        return employee_address;
    }

    public void setEmployee_address(String employee_address) {
        this.employee_address = employee_address;
    }

    public String getEmployee_leaveDay() {
        return employee_leaveDay;
    }

    public void setEmployee_leaveDay(String employee_leaveDay) {
        this.employee_leaveDay = employee_leaveDay;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    
    
}
