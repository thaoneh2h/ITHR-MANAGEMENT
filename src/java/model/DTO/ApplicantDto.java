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
public class ApplicantDto {
    private int applicantID;
    private String name;
    private String phoneNumber;
    private String email;
    private String CV;
    private boolean gender;
    private boolean status;
    private Date interviewDate;
    private int jobOfferingID;
    private String employeeID;
    private String departmentName;

    public ApplicantDto() {
    }

    public ApplicantDto(int applicantID, String name, String phoneNumber, String email, String CV, boolean gender, boolean status, Date interviewDate, int jobOfferingID, String employeeID, String departmentName) {
        this.applicantID = applicantID;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.CV = CV;
        this.gender = gender;
        this.status = status;
        this.interviewDate = interviewDate;
        this.jobOfferingID = jobOfferingID;
        this.employeeID = employeeID;
        this.departmentName = departmentName;
    }

    public int getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(int applicantID) {
        this.applicantID = applicantID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCV() {
        return CV;
    }

    public void setCV(String CV) {
        this.CV = CV;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }   

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(Date interviewDate) {
        this.interviewDate = interviewDate;
    }

    public int getJobOfferingID() {
        return jobOfferingID;
    }

    public void setJobOfferingID(int jobOfferingID) {
        this.jobOfferingID = jobOfferingID;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    
    
    
    
}
