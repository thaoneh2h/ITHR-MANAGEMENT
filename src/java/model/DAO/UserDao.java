/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import model.DTO.UserDto;
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
 * @author ADMIN
 */
public class UserDao {

    public UserDto getPassword(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT [username], [password]"
                        + " FROM [User]"
                        + " WHERE [username] = ? AND [password] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    dto = new UserDto("", username, password, "", "");
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
        return dto;
    }

    public boolean resetPassword(String password, String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
                String sql = "UPDATE [User] "
                        + "SET [password] = ? "
                        + "WHERE [email] = ?";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, email);
                //4.Execute Statement to get result
                int effectRow = stm.executeUpdate();
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }
            }//end connection haas existed
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return result;
        }

    }

    public boolean updatePassword(String password, String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
                String sql = "UPDATE [User] "
                        + "SET [password] = ? "
                        + "WHERE [username] = ?";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, username);
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
            return result;
        }

    }

    public UserDto login(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT *"
                        + " FROM [User]"
                        + " WHERE [username] = ? and [password]= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                 if (rs.next()) {
                    String roleName = rs.getString("roleName");

                    String employeeID = rs.getString("employee_id");
                    dto = new UserDto(employeeID, username, password, roleName, "");
                    String id = rs.getString("employee_id");
                    dto = new UserDto(id, username, password, roleName, "");

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
        return dto;
    }

    public UserDto getUsernamePasword(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT [username] [password]"
                        + " FROM [User]"
                        + " WHERE [email] = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();
                if (rs.next()) {
                    dto = new UserDto("", "", "", "", email);
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
        return dto;
    }

    private List<EmployeeDto> userInfoList;

    public List<EmployeeDto> getUserInfoList() {
        return userInfoList;
    }

    public void getUserInfo(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.[employee_id], d.[department_id] ,[employee_name], "
                        + "[employee_dob], [employee_phone] , d.department_name, [datejoin], [age], [gender], "
                        + "[employee_email], [employee_address], u.roleName , u.username, e.employee_photo "
                        + "FROM [employee] e inner JOIN [User] u ON e.employee_id = u.employee_id "
                        + "inner JOIN [department] d ON d.department_id = e.department_id "
                        + "WHERE u.username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String employeeId = rs.getString("employee_id");
                    String employeeName = rs.getString("employee_name");
                    boolean gender = rs.getBoolean("gender");
                    Date dateJoin = rs.getDate("datejoin");
                    String phoneNumer = rs.getString("employee_phone");
                    String departmentName = rs.getString("department_name");
                    String address = rs.getString("employee_address");
                    String role = rs.getString("roleName");
                    Date birthday = rs.getDate("employee_dob");
                    String email = rs.getString("employee_email");
                    username = rs.getString("username");

                    String photo = rs.getString("employee_photo");
                    dto = new EmployeeDto(employeeId, "", employeeName, birthday, phoneNumer, dateJoin, "",
                            0, gender, "", email, address, null, departmentName, role, username, "",
                            photo, false);
                    if (this.userInfoList == null) {
                        this.userInfoList = new ArrayList<>();
                    }//end account List had NOT existed
                    this.userInfoList.add(dto);
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

    public boolean UpdateUserInfo(int phone, String email, String address, String id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
                String sql = "UPDATE employee "
                        + "SET employee_phone = ? "
                        + ", employee_email = ? "
                        + ", employee_address = ? "
                        + "WHERE employee_id = ? ";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setInt(1, phone);
                stm.setString(2, email);
                stm.setString(3, address);
                stm.setString(4, id);
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

    public String getUserID(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto dto = null;
        String employeeId = "";
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT u.employee_id "
                        + "FROM [User] u "
                        + "WHERE username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    employeeId = rs.getString("employee_id");
                    username = rs.getString("username");
                    dto = new EmployeeDto(employeeId, "", "", null, "", null, "",
                            0, false, "", "", "", null, "", "", username, "",
                            "", false);
                    if (this.userInfoList == null) {
                        this.userInfoList = new ArrayList<>();
                    }//end account List had NOT existed
                    this.userInfoList.add(dto);
                }
            }
        }catch (Exception e) {
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
        return employeeId;
    }

    public EmployeeDto getEmployeeID(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id "
                        + "FROM employee e "
                        + "JOIN [User] u On e.employee_id = u.employee_id "
                        + "WHERE u.username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeID = rs.getString("employee_id");

                    employeedto = new EmployeeDto(employeeID, "", "", null, "", null,
                            null, 0, false, "", "", "", null, "", "", "", "", "", false);

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
        return employeedto;
    }

    public EmployeeDto getEmployeeIDFromDayleave(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT employeeID "
                        + "FROM DayLeave "
                        + "WHERE dayleave_id = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeID = rs.getString("employeeID");

                    employeedto = new EmployeeDto(employeeID, "", "", null, "", null,
                            null, 0, false, "", "", "", null, "", "", "", "", "", false);
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
        return employeedto;
    }

}
