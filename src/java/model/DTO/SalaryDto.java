/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;
import model.DAO.*;

/**
 *
 * @author quanb
 */
public class SalaryDto {

    private String employee_name;
    private int month;
    private int year;
    private int salaryBase;
    private float medicalInsurance;
    private float accidentalInsurance;
    private float socialAssurance;
    private float tax;
    private int bonus;
    private int penalty;
    private int lastReceiver;
    private int application_id;
    private int lateForWorktimes;
    private int absentForWork;

    public SalaryDto(String employee_name, int salaryBase, int bonus, int penalty, int application_id) {
        this.employee_name = employee_name;
        this.salaryBase = salaryBase;
        this.bonus = bonus;
        this.penalty = penalty;
        this.application_id = application_id;
    }

    public SalaryDto(String employee_name, int salaryBase, float medicalInsurance, float accidentalInsurance, float socialAssurance, float tax, int bonus, int penalty,int lateforWorkTime,int ap,int ab) {
        this.employee_name = employee_name;
        this.salaryBase = salaryBase;
        this.medicalInsurance = medicalInsurance;
        this.accidentalInsurance = accidentalInsurance;
        this.socialAssurance = socialAssurance;
        this.tax = tax;
        this.bonus = bonus;
        this.penalty = penalty;
        this.lateForWorktimes=lateforWorkTime;
        this.application_id=ap;
        this.absentForWork=ab;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public int getApplication_id() {
        return application_id;
    }

    public void setApplication_id(int application_id) {
        this.application_id = application_id;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

//    public int getSalaryBase() {
//        return salaryBase;
//    }
    public void setSalaryBase(int salaryBase) {
        this.salaryBase = salaryBase;
    }

//    public int getMedicalInsurance() {
//       return (int) (this.salaryBase * this.medicalInsurance);
//    }
    public void setMedicalInsurance(float medicalInsurance) {
        this.medicalInsurance = medicalInsurance;
    }

//    public int getAccidentalInsurance() {
//        return (int) (this.salaryBase * this.accidentalInsurance);
//    }
    public void setAccidentalInsurance(float accidentalInsurance) {
        this.accidentalInsurance = accidentalInsurance;
    }

//    public int getSocialAssurance() {
//        return (int) (this.salaryBase * this.socialAssurance);
//    }
    public void setSocialAssurance(float socialAssurance) {
        this.socialAssurance = socialAssurance;
    }
    
    public String getAbsentForWork() {
        return absentForWork + " Times";
    }

//    public int getTax() {
//
//        return (int) (this.salaryBase * tax);
//
//    }
    public void setAbsentForWork(int absentForWork) {    
        this.absentForWork = absentForWork;
    }

    public void setTax(float tax) {
        this.tax = tax;
    }

//    public int getBonus() {
//        return bonus;
//    }
    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

//    public int getPenalty() {
//        return penalty;
//    }
    public void setPenalty(int penalty) {
        this.penalty = penalty;
    }

//    public int getLastReceiver() {
//        return lastReceiver=(int) (this.salaryBase+this.bonus-this.penalty-this.accidentalInsurance-this.medicalInsurance-this.socialAssurance-this.tax);
//    }
    public void setLastReceiver(int lastReceiver) {
        this.lastReceiver = lastReceiver;
    }

    public String getPenalty() {
        return formatCurrency(penalty);
    }

    public int parseCurrencyValue(String value) {
        String numericValue = value.replaceAll("[^\\d]", ""); // Remove non-numeric characters
        return Integer.parseInt(numericValue);
    }

    public String formatCurrency(int amount) {
        NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.getDefault());
        return currencyFormat.format(amount) + "VNĐ";
    }

    public String getLateForWorktimes() {
       return lateForWorktimes + " Times";
    }

    public void setLateForWorktimes(int lateForWorktimes) {
        this.lateForWorktimes = lateForWorktimes;
    }

    public String getLastReceiver() {
        int accidentalInsuranceValue = parseCurrencyValue(this.getAccidentalInsurance());
        int medicalInsuranceValue = parseCurrencyValue(this.getMedicalInsurance());
        int socialAssuranceValue = parseCurrencyValue(this.getSocialAssurance());
        int taxValue = parseCurrencyValue(this.getTax());
        int totalDeductions = this.penalty + accidentalInsuranceValue + medicalInsuranceValue + socialAssuranceValue + taxValue - this.bonus;
        int lastReceiverValue = this.salaryBase - totalDeductions;
        this.setLastReceiver(lastReceiverValue);
        return formatCurrency(lastReceiverValue);
    }

    public String getBonus() {
        return formatCurrency(bonus);
    }

    public String getTax() {
        if(this.salaryBase>=11000000){
        return formatCurrency((int) (salaryBase * tax));
        }
        else{
              return formatCurrency((int) (salaryBase * 0));
        }
    }

    public String getSocialAssurance() {
        return formatCurrency((int) (salaryBase * socialAssurance));
    }

    public String getAccidentalInsurance() {
        return formatCurrency((int) (salaryBase * accidentalInsurance));
    }

 public String getSalaryBase() {
    return formatCurrency(salaryBase);
}

    public String getMedicalInsurance() {
        return formatCurrency((int) (salaryBase * medicalInsurance));
    }

    public SalaryDto() {
    }

}
