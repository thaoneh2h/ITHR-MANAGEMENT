/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import model.DTO.EmployeeDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import controlller.StaffListController;
import java.util.Date;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class StaffDao {

    private List<EmployeeDto> staffList;

    public List<EmployeeDto> getStaffList() {
        return staffList;
    }

    public void searchStaff(EmployeeDto employeedto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id, employee_name, gender, employee_phone, "
                        + "department_name, u.roleName, u.status, e.department_id "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeId = rs.getString("employee_id");
                    String employeeName = rs.getString("employee_name");
                    boolean gender = rs.getBoolean("gender");
                    int phoneNumer = rs.getInt("employee_phone");
                    String departmentName = rs.getString("department_name");
                    String role = rs.getString("roleName");
                    String departmetId = rs.getString("department_id");
                    boolean status = rs.getBoolean("status");
                    employeedto = new EmployeeDto(employeeId, departmentName, employeeName, null, phoneNumer, null, employeeName, phoneNumer, gender, departmentName, employeeName, employeeName, employeeName, departmentName, role, role, role, role, status);
                    
                    if (this.staffList == null) {
                        this.staffList = new ArrayList<>();
                    }//end account List had NOT existed
                    this.staffList.add(employeedto);
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

    public List<EmployeeDto> getStaffDetail(String name) throws SQLException {
        List<EmployeeDto> staffDetail = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], [employee_name], e.employee_dob, gender, employee_phone, "
                        + "employee_email, d.department_name, employee_address, u.roleName, u.username, employee_photo "
                        + "FROM employee e "
                        + "Join department d ON e.department_id = d.department_id "
                        + "Join [User] u ON e.employee_id = u.employee_id "
                        + "WHERE [employee_name] LIKE N'%' + ? + N'%' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeId = rs.getString("employee_id");
                    String employeeName = rs.getString("employee_name");
                    Date employeedob = rs.getDate("employee_dob");
                    boolean gender = rs.getBoolean("gender");
                    int phoneNumer = rs.getInt("employee_phone");
                    String employeeEmail = rs.getString("employee_email");
                    String address = rs.getString("employee_address");
                    String departmentName = rs.getString("department_name");
                    String roleName = rs.getString("roleName");
                    String username = rs.getString("username");
                    String photo = rs.getString("employee_photo");
                    employeedto = new EmployeeDto(employeeId, departmentName, employeeName, employeedob, phoneNumer, employeedob, employeeEmail, phoneNumer, gender, username, employeeEmail, address, employeeName, departmentName, roleName, username, photo, photo, gender);

                    if (staffDetail == null) {
                        staffDetail = new ArrayList<>();
                    }
                    staffDetail.add(employeedto);
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
        return staffDetail;
    }

    public boolean UpdateStaffDetail(EmployeeDto dto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
                String sql = "UPDATE employee "
                        + "SET employee_name = ?, employee_phone = ? "
                        + ", employee_email = ? "
                        + ", employee_address = ? "
                        + "WHERE employee_id = ? ";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getEmployee_name());

//                java.sql.Date sqlDate = java.sql.Date.valueOf(dto.getEmployee_dob().toString());
//                stm.setDate(2, sqlDate);
                stm.setInt(2, dto.getEmployee_phone());
                stm.setString(3, dto.getEmployee_email());
                stm.setString(4, dto.getEmployee_address());
                stm.setString(5, dto.getEmployee_id());
                //4.Execute Statement to get result
                int effectRow = stm.executeUpdate();
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }
            }//end connection haas existed
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean DeleteStaffList(boolean status, String id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
//                String sql = "BEGIN TRANSACTION; "
//                        + "\n"
//                        + "DELETE FROM [User] WHERE employee_id IN (SELECT employee_id FROM employee "
//                        + "WHERE employee_id = ?); "
//                        + "DELETE FROM employee WHERE employee_id = ?; "
//                        + "\n"
//                        + "COMMIT;";
                String sql = "UPDATE [User] "
                        + "SET [status] = ? "
                        + "FROM [User] "
                        + "JOIN [employee] e ON e.[employee_id] = [User].employee_id "
                        + "WHERE e.employee_id = ? ";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, id);

                //4.Execute Statement to get result
                int effectRow = stm.executeUpdate();
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }
            }//end connection haas existed
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean insertLeaveReport(int id, String title, String descr, String dateCreate, String username, String type) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO [Application](application_id, application_title, application_description ,[date-created], username, application_type) "
                        + "VALUES (?, ?, ?, ?, ?, ?);";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, title);
                stm.setString(3, descr);
                stm.setString(4, dateCreate);
                stm.setString(5, username);
                stm.setString(6, type);
                int effect = stm.executeUpdate();
                if (effect > 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean insertReport(int id, String title, String descr, String dateCreate,
            String username, String type, String employeeName, int presentDay, int absentDay, int lateDay, int overtimeDay) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO [Application](application_id, application_title, application_description, [date-created], username , application_type ,employee_name, present_day, late_day, absent_day, overtime_day) "
                        + "VALUES (?, ?, ?, ?, ?, ?,?, ?,?,?,?);";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, title);
                stm.setString(3, descr);
                stm.setString(4, dateCreate);
                stm.setString(5, username);
                stm.setString(6, type);
                stm.setString(7, employeeName);
                stm.setInt(8, presentDay);
                stm.setInt(9, lateDay);
                stm.setInt(10, absentDay);
                stm.setInt(11, overtimeDay);
                int effect = stm.executeUpdate();
                if (effect > 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
    
    private List<EmployeeDto> accountList;

    public List<EmployeeDto> getAccountList() {
        return accountList;
    }

    public void getAccList(EmployeeDto employeeDTO) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], employee_name, "
                        + "e.[department_id], e.[employee_email] "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeId = rs.getString("employee_id");
                    String employeeName = rs.getString("employee_name");
                    String department_id = rs.getString("department_id");
                    String employeeEmail = rs.getString("employee_email");
                    employeeDTO = new EmployeeDto(employeeId, department_id, employeeName, null, 0, null, employeeEmail, 0, true, department_id, employeeEmail, employeeName, employeeName, department_id, sql, employeeName, sql, sql, true);

//                    employeeDTO = new EmployeeDto(employeeId, department_id, employeeName, null, 0, null,
//                            null, 0, true, "", employeeEmail, "", null, "", "", "", "");

                    if (this.accountList == null) {
                        this.accountList = new ArrayList<>();
                    }//
                    this.accountList.add(employeeDTO);
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


public List<EmployeeDto> getAccDetail(String name) throws SQLException {
        List<EmployeeDto> AccList = null;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto EmployeeDTO = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], employee_name, e.[department_id], "
                        + "d.[department_name], e.[employee_email], e.[datejoin], u.roleName, u.username, u.[password] "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id "
                        + "WHERE [employee_name] LIKE N'%' + ? + N'%' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                rs = stm.executeQuery();
                while (rs.next()) {

                    String employeeId = rs.getString("employee_id");
                    String employeeName = rs.getString("employee_name");
                    String department_id = rs.getString("department_id");
                    String department_name = rs.getString("department_name");
                    Date datejoin = rs.getDate("datejoin");
                    String employeeEmail = rs.getString("employee_email");
                    String role = rs.getString("roleName");
                    String username = rs.getString("username");
                    String password = rs.getString("password");

                    EmployeeDTO = new EmployeeDto(employeeId, department_id, employeeName, datejoin, 0, datejoin, employeeEmail, 0, true, department_id, employeeEmail, employeeName, employeeName, department_name, role, username, password, role, true);
//                    
//                    EmployeeDTO = new EmployeeDto(employeeId, department_id, employeeName, null, 0, datejoin,
//                            null, 0, true, "", employeeEmail, "", null, department_name, roleName, username, "");
                    
                    System.out.println("depart ID: " + department_id);
                    System.out.println("Depart Name: " + department_name);
                    
                    if (AccList == null) {
                        AccList = new ArrayList<>();
                    }//
                    AccList.add(EmployeeDTO);

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
        return AccList;
    }
    
}
