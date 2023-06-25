/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.util.Date;

/**
 *
 * @author 23030
 */
public class ContractDTO {
    private int employee_contractID;
    private String employeeID;
    private String employee_name;
    private String salaryID;
    private Date signDate;
    private Date expDate;
    private Date inspireDate;
    private int welfareID;
    private float bonus;
    private int medInsurance;
    private int accInsurance;
    private int socInsurance;
    private int tax;
    private int penlty; 
    private String photo;

    public ContractDTO() {
    }

    public ContractDTO(int employee_contractID, String employeeID, String employee_name, String salaryID, Date signDate, Date expDate, Date inspireDate, int welfareID, float bonus, int medInsurance, int accInsurance, int socInsurance, int tax, int penlty, String photo) {
        this.employee_contractID = employee_contractID;
        this.employeeID = employeeID;
        this.employee_name = employee_name;
        this.salaryID = salaryID;
        this.signDate = signDate;
        this.expDate = expDate;
        this.inspireDate = inspireDate;
        this.welfareID = welfareID;
        this.bonus = bonus;
        this.medInsurance = medInsurance;
        this.accInsurance = accInsurance;
        this.socInsurance = socInsurance;
        this.tax = tax;
        this.penlty = penlty;
        this.photo = photo;
    }

    public int getEmployee_contractID() {
        return employee_contractID;
    }

    public void setEmployee_contractID(int employee_contractID) {
        this.employee_contractID = employee_contractID;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getSalaryID() {
        return salaryID;
    }

    public void setSalaryID(String salaryID) {
        this.salaryID = salaryID;
    }

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public Date getInspireDate() {
        return inspireDate;
    }

    public void setInspireDate(Date inspireDate) {
        this.inspireDate = inspireDate;
    }

    public int getWelfareID() {
        return welfareID;
    }

    public void setWelfareID(int welfareID) {
        this.welfareID = welfareID;
    }

    public float getBonus() {
        return bonus;
    }

    public void setBonus(float bonus) {
        this.bonus = bonus;
    }

    public int getMedInsurance() {
        return medInsurance;
    }

    public void setMedInsurance(int medInsurance) {
        this.medInsurance = medInsurance;
    }

    public int getAccInsurance() {
        return accInsurance;
    }

    public void setAccInsurance(int accInsurance) {
        this.accInsurance = accInsurance;
    }

    public int getSocInsurance() {
        return socInsurance;
    }

    public void setSocInsurance(int socInsurance) {
        this.socInsurance = socInsurance;
    }

    public int getTax() {
        return tax;
    }

    public void setTax(int tax) {
        this.tax = tax;
    }

    public int getPenlty() {
        return penlty;
    }

    public void setPenlty(int penlty) {
        this.penlty = penlty;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    
    
}