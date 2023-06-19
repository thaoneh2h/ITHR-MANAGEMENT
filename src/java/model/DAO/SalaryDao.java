/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.DTO.EmployeeDto;
import model.DTO.SalaryDto;

import utils.DBHelper;

/**
 *
 * @author quanb
 */
public class SalaryDao {

    private List<SalaryDto> salary;

    public List<SalaryDto> SalaryList() {
        return salary;
    }

    public List<SalaryDto> DetailSalary(int application_id) throws SQLException {
        List<SalaryDto> dtoList = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        SalaryDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT employee.employee_name, contract.salaryBase,\n"
                        + "contract.medicalInsurance, contract.accidentalInsurance, contract.SocialAssurance, contract.tax,\n"
                        + "(contract.overtime_day_bonus * Application.overtime_day) AS bonus, (Application.late_day * contract.late_day_penalty) + (Application.absent_day * contract.absent_day_penalty) AS penalty, Application.late_day, salary.application_id, Application.absent_day\n"
                        + "FROM employee \n"
                        + "LEFT JOIN contract ON contract.employee_contractId = employee.employee_contractId  \n"
                        + "LEFT JOIN salary ON employee.employee_id = salary.employee_id \n"
                        + "INNER JOIN Application ON Application.application_id = salary.application_id\n"
                        + "WHERE salary.application_id = ?";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, application_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employee_name = rs.getString("employee_name");

                    int salaryBase = rs.getInt("salaryBase");

                    float medicalInsurance = rs.getFloat("medicalInsurance");
                    float accidentalInsurance = rs.getFloat("accidentalInsurance");
                    float SocialAssurance = rs.getFloat("SocialAssurance");
                    float tax = rs.getFloat("tax");
                    int bonus = rs.getInt("bonus");
                    int penalty = rs.getInt("penalty");
                    int late_day=rs.getInt("late_day");
                     application_id=rs.getInt("application_id");
                     int absent_day=rs.getInt("absent_day");
                    dto = new SalaryDto(employee_name, salaryBase, medicalInsurance, accidentalInsurance, SocialAssurance, tax, bonus, penalty,late_day,application_id,absent_day);
                    if (dtoList == null) {
                        dtoList = new ArrayList<>();
                    }//end account List had NOT existed
                    dtoList.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dtoList;

    }

    public List<SalaryDto> SearchByDate(int month, int year) throws SQLException {
        List<SalaryDto> dtoList = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        SalaryDto dto = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT employee.employee_name, contract.salaryBase, (contract.overtime_day_bonus * Application.overtime_day) AS bonus,\n"
                        + "       (Application.late_day * contract.late_day_penalty) + (Application.absent_day * contract.absent_day_penalty) AS penalty,\n"
                        + "salary.application_id \n"
                        + "FROM employee \n"
                        + "LEFT JOIN contract ON contract.employee_contractId = employee.employee_contractId  \n"
                        + "LEFT JOIN salary ON employee.employee_id = salary.employee_id \n"
                        + "INNER JOIN Application ON Application.application_id = salary.application_id\n"
                        + "WHERE salary.month = ? AND salary.year = ?; ";

                stm = conn.prepareStatement(sql);

                stm.setInt(1, month);
                stm.setInt(2, year);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("employee_name");
                    int salaryBase = rs.getInt("salaryBase");
                    int bonus = rs.getInt("bonus");
                    int penalty = rs.getInt("penalty");
                    int application_id=rs.getInt("application_id");
                    dto = new SalaryDto(name, salaryBase, bonus, penalty,application_id);
                    if (dtoList == null) {
                        dtoList = new ArrayList<>();
                    }//end account List had NOT existed
                    dtoList.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dtoList;
    }

}
