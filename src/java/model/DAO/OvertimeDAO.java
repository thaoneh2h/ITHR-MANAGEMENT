/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import model.DTO.OvertimeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.DTO.EmployeeDto;
import utils.DBHelper;

/**
 *
 * @author 23030
 */
public class OvertimeDAO {

    private List<OvertimeDTO> OvertimeList;

    public List<OvertimeDTO> getOvertimeList() {
        return OvertimeList;
    }

    //Total Employees Have Overtime
    public int getTotalEmployeesWithOvertime() throws SQLException {

//        int totalEmployeesWithOvertime = 0;
//
//        PreparedStatement statement = connection.prepareStatement("SELECT COUNT(*) FROM overtimes");
//        ResultSet resultSet = statement.executeQuery();
//
//        if (resultSet.next()) {
//            totalEmployeesWithOvertime = resultSet.getInt(1);
//        }
//
//        return totalEmployeesWithOvertime;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OvertimeDTO overtimeDTO = null;

        int totalEmployeesWithOvertime = 0;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(*) AS total_employees_with_overtime "
                        + "FROM overtime "
                        + "WHERE has_overtime = 1;";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    totalEmployeesWithOvertime = rs.getInt("total_employees_with_overtime");
                    if (this.OvertimeList == null) {
                        this.OvertimeList = new ArrayList<>();
                    }//
                    this.OvertimeList.add(overtimeDTO);
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

        return totalEmployeesWithOvertime;
    }

    //Total Employees Without Overtime
    public int getTotalEmployeesWithoutOvertime() throws SQLException {
//        int totalEmployeesWithoutOvertime = 0;
//
//        PreparedStatement stm = connection.prepareStatement("SELECT COUNT(*) FROM employees WHERE id NOT IN (SELECT employee_id FROM overtimes)");
//        ResultSet resultSet = stm.executeQuery();
//
//        if (resultSet.next()) {
//            totalEmployeesWithoutOvertime = resultSet.getInt(1);
//        }
//
//        return totalEmployeesWithoutOvertime;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OvertimeDTO overtimeDTO = null;

        int totalEmployeesWithoutOvertime = 0;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(*) AS total_employees_without_overtime "
                        + "FROM overtime "
                        + "WHERE has_overtime = 1;";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    totalEmployeesWithoutOvertime = rs.getInt("total_employees_without_overtime");
                    if (this.OvertimeList == null) {
                        this.OvertimeList = new ArrayList<>();
                    }//
                    this.OvertimeList.add(overtimeDTO);
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

        return totalEmployeesWithoutOvertime;

    }

    // List of Overtime
    public void getOvertimes(OvertimeDTO overtimedto) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], e.[employee_name], "
                        + "e.[department_id], u.roleName, "
                        + "has_overtime, working_status, overtime_start_time "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id "
                        + "JOIN overtime o On o.employee_id  = e.employee_id";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
//                    = rs.getInt(0);
                    String employeeId = rs.getString("employee_id");
                    String employee_name = rs.getString("employee_name");
                    String department_id = rs.getString("department_id");
                    String role = rs.getString("roleName");
                    boolean hasOvertime = rs.getBoolean("has_overtime");
                    String workingStatus = rs.getString("working_status");
                    Date overtimeStartDateTime = rs.getDate("overtime_start_time");
//                   int overtimeDuration = rs.getInt("");

//                    overtimedto = new OvertimeDTO(employeeId, employee_name, department_id, "", role, workingStatus, hasOvertime, overtimeStartDateTime, 0);
                    overtimedto = new OvertimeDTO(null, employeeId, employee_name, department_id, role, workingStatus, hasOvertime, overtimeStartDateTime, null, 0);
                    if (this.OvertimeList == null) {
                        this.OvertimeList = new ArrayList<>();
                    }//
                    this.OvertimeList.add(overtimedto);
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

    }

//Overtime Details
    public List<OvertimeDTO> getOvertimeDetail(String name) throws SQLException {
        List<OvertimeDTO> overtimeDetail = null;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OvertimeDTO overtimeDTO = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], e.[employee_name], "
                        + "e.[department_id], d.[department_name], u.roleName, "
                        + "has_overtime, working_status , overtime_start_time, overtime_duration "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id "
                        + "JOIN overtime o On o.employee_id  = e.employee_id "
                        + "WHERE e.[employee_name] LIKE N'%' + ? + N'%' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                rs = stm.executeQuery();
                while (rs.next()) {
//                    = rs.getInt(0);
                    String employeeId = rs.getString("employee_id");
                    String employee_name = rs.getString("employee_name");
                    String department_id = rs.getString("department_id");
                    String role = rs.getString("roleName");
                    String workingStatus = rs.getString("working_status");
                    boolean hasOvertime = rs.getBoolean("has_overtime");
                    Date overtimeStartDateTime = rs.getDate("overtime_start_time");
                    int overtimeDuration = rs.getInt("overtime_duration");

//                    overtimeDTO = new OvertimeDTO(employeeId, employee_name, department_id, department_name, role, workingStatus, hasOvertime, overtimeStartDateTime, overtimeDuration);
                    overtimeDTO = new OvertimeDTO(null, employeeId, employee_name, department_id, role, workingStatus, hasOvertime, overtimeStartDateTime, null,overtimeDuration);
                    if (overtimeDetail == null) {
                        overtimeDetail = new ArrayList<>();
                    }//
                    overtimeDetail.add(overtimeDTO);

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

        return overtimeDetail;
    }

    public List<OvertimeDTO> searchDate(String month) throws SQLException {
        List<OvertimeDTO> searchDate = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OvertimeDTO overtimeDTO = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT e.[employee_id], e.[employee_name], "
                        + "e.[department_id], u.roleName, "
                        + "has_overtime, working_status, overtime_start_time "
                        + "FROM employee e " 
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id " 
                        + "JOIN overtime o On o.employee_id  = e.employee_id " 
                        + "WHERE MONTH (overtime_start_time) = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeId = rs.getString("employee_id");
                    String employee_name = rs.getString("employee_name");
                    String department_id = rs.getString("department_id");
                    String role = rs.getString("roleName");
                    String workingStatus = rs.getString("working_status");
                    boolean hasOvertime = rs.getBoolean("has_overtime");
                    Date overtimeStartDateTime = rs.getDate("overtime_start_time");
                    overtimeDTO = new OvertimeDTO(null, employeeId, employee_name, department_id, role, workingStatus, hasOvertime, overtimeStartDateTime, null, 0);
                    if (searchDate == null) {
                        searchDate = new ArrayList<>();
                    }
                    searchDate.add(overtimeDTO);
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
            if (con != null) {
                con.close();
            }
        }
        return searchDate;
    }
    
       public List<OvertimeDTO> getOvertimeDetail(String name, String month) throws SQLException {
        List<OvertimeDTO> overtimeDetail = null;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OvertimeDTO overtimeDTO = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], e.[employee_name], "
                        + "e.[department_id], d.[department_name], u.roleName, "
                        + "has_overtime, working_status , overtime_start_time, overtime_duration "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id "
                        + "JOIN overtime o On o.employee_id  = e.employee_id "
                        + "WHERE e.[employee_name] LIKE N'%' + ? + N'%' AND MONTH (overtime_start_time) = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, month);
                rs = stm.executeQuery();
                while (rs.next()) {
//                    = rs.getInt(0);
                    String employeeId = rs.getString("employee_id");
                    String employee_name = rs.getString("employee_name");
                    String department_id = rs.getString("department_id");
                    String role = rs.getString("roleName");
                    String workingStatus = rs.getString("working_status");
                    boolean hasOvertime = rs.getBoolean("has_overtime");
                    Date overtimeStartDateTime = rs.getDate("overtime_start_time");
                    int overtimeDuration = rs.getInt("overtime_duration");

//                    overtimeDTO = new OvertimeDTO(employeeId, employee_name, department_id, department_name, role, workingStatus, hasOvertime, overtimeStartDateTime, overtimeDuration);
                    overtimeDTO = new OvertimeDTO(null, employeeId, employee_name, department_id, role, workingStatus, hasOvertime, overtimeStartDateTime, null,overtimeDuration);
                    if (overtimeDetail == null) {
                        overtimeDetail = new ArrayList<>();
                    }//
                    overtimeDetail.add(overtimeDTO);

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

        return overtimeDetail;
    }
}
