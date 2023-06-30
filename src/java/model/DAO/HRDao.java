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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.DTO.ApplicantDto;
import model.DTO.DayLeaveDto;
import model.DTO.EmployeeDto;
import model.DTO.ReportDTO;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class HRDao {

    private List<DayLeaveDto> dayLeaveList;

    public List<DayLeaveDto> getDayLeaveList() {
        return dayLeaveList;
    }

    private List<ReportDTO> reportList;

    public List<ReportDTO> getReportList() {
        return reportList;
    }

    public void getDayLeave(boolean status, String departmentId) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        DayLeaveDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT d.dayleave_id, e.employee_name, d.dayleave_title, d.dayleave_description, [date-created] "
                        + "FROM [DayLeave] d "
                        + "JOIN [User] u ON d.username = u.username "
                        + "JOIN employee e ON e.employee_id = u.employee_id "
                        + "WHERE d.status = ? AND e.department_id = ? "
                        + " ORDER BY MONTH(d.[date-created]) desc ";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, departmentId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("dayleave_id");
                    String name = rs.getString("employee_name");
                    String title = rs.getString("dayleave_title");
                    String description = rs.getString("dayleave_description");
                    Date dateCreate = rs.getDate("date-created");
                    dto = new DayLeaveDto(id, title, description, dateCreate, status, "", "", name);
                    if (this.dayLeaveList == null) {
                        this.dayLeaveList = new ArrayList<>();
                    }
                    this.dayLeaveList.add(dto);
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

    public void getDayLeavePending(DayLeaveDto dto, String departmentId) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT d.dayleave_id, e.employee_name, d.dayleave_title, d.dayleave_description, [date-created] "
                        + "FROM [DayLeave] d "
                        + "JOIN [User] u ON d.username = u.username "
                        + "JOIN employee e ON e.employee_id = u.employee_id "
                        + "WHERE d.status IS NULL AND e.department_id = ? "
                        + "ORDER BY MONTH(d.[date-created]) desc ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, departmentId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("dayleave_id");
                    String name = rs.getString("employee_name");
                    String title = rs.getString("dayleave_title");
                    String description = rs.getString("dayleave_description");
                    Date dateCreate = rs.getDate("date-created");
                    dto = new DayLeaveDto(id, title, description, dateCreate, false, "", "", name);
                    if (this.dayLeaveList == null) {
                        this.dayLeaveList = new ArrayList<>();
                    }
                    this.dayLeaveList.add(dto);
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

    public boolean updateStatus(int id, boolean status) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE DayLeave "
                        + "SET [status] = ? "
                        + "WHERE dayleave_id = ? ";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setInt(2, id);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
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

    public boolean updateDayLeaveIdInTimekeeping(int id, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE timekeeping "
                        + "SET dayleave_id = ?, status = ? "
                        + "FROM DayLeave "
                        + "WHERE DayLeave.dayleave_id = ? AND DayLeave.[employeeID] = timekeeping.employee_id "
                        + "AND DayLeave.[date-created] = timekeeping.[date]";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, status);
                stm.setInt(3, id);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
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

    public boolean updateReportAbsentDayAndExcuseDay(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE Report "
                        + "SET absent_day = absent_day-1 , excused_absent_day = excused_absent_day+1 "
                        + "WHERE report_id = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
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

    public boolean updateExecuseDayLeft(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE [contract] "
                        + "SET [execuseDayOff] = [execuseDayOff] - 1 "
                        + "WHERE  [contract].employee_id = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
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

    public int getReportID(String employeeID, int dayLeaveID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ReportDTO dto = null;
        int id = 0;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT r.report_id "
                        + "FROM Report r "
                        + "JOIN timekeeping t ON r.report_id = t.report_id "
                        + "WHERE t.dayleave_id = ? AND t.employee_id = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, dayLeaveID);
                stm.setString(2, employeeID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    id = rs.getInt("report_id");
                    dto = new ReportDTO(id, "", "", 0, 0, 0, "", 0, 0, "");
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
        return id;
    }

    public void getSentLeaveReport(DayLeaveDto dto, String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "  SELECT e.employee_name, d.dayleave_id, d.dayleave_title, d.dayleave_description, d.[date-created], d.status "
                        + "  FROM DayLeave d "
                        + " JOIN [User] u ON d.username = u.username "
                        + " JOIN [employee] e ON e.employee_id = u.employee_id "
                        + " WHERE d.username = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("dayleave_id");
                    String name = rs.getString("employee_name");
                    String title = rs.getString("dayleave_title");
                    String description = rs.getString("dayleave_description");
                    Date dateCreate = rs.getDate("date-created");
                    boolean status = rs.getBoolean("status");
                    dto = new DayLeaveDto(id, title, description, dateCreate, status, username, "", name);
                    if (this.dayLeaveList == null) {
                        this.dayLeaveList = new ArrayList<>();
                    }
                    this.dayLeaveList.add(dto);
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

    private List<EmployeeDto> employeeList;

    public List<EmployeeDto> getEmployeeList() {
        return employeeList;
    }

    public void searchByName(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id, employee_name, gender, employee_phone, "
                        + "department_name, u.roleName, u.status, u.username "
                        + "FROM employee e "
                        + "JOIN department d On e.department_id = d.department_id "
                        + "JOIN [User] u On u.employee_id = e.employee_id "
                        + "WHERE e.employee_name LIKE ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");;
                rs = stm.executeQuery();
                while (rs.next()) {
                    String employeeId = rs.getString("employee_id");
                    String employeeName = rs.getString("employee_name");
                    boolean gender = rs.getBoolean("gender");
                    int phoneNumer = rs.getInt("employee_phone");
                    String departmentName = rs.getString("department_name");
                    String role = rs.getString("roleName");
                    boolean status = rs.getBoolean("status");
                    employeedto = new EmployeeDto(employeeId, "", employeeName, null, phoneNumer, null,
                            null, 0, gender, "", "", "", null, departmentName, role, "", "", "", status);
                    if (this.employeeList == null) {
                        this.employeeList = new ArrayList<>();
                    }//end account List had NOT existed
                    this.employeeList.add(employeedto);
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

    public EmployeeDto getDepartmentID(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.department_id "
                        + "FROM employee e "
                        + "JOIN [User] u On e.employee_id = u.employee_id "
                        + "WHERE u.username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String departmentID = rs.getString("department_id");

                    employeedto = new EmployeeDto("", departmentID, "", null, 0, null,
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

    public void getEmployeeOfEachDepartment(String departmentID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT employee_name, employee_id "
                        + "FROM employee "
                        + "WHERE department_id = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, departmentID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    employeedto = new EmployeeDto(id, "", name, null, 0, null, "", 0, false, "", "", "", "", "", "", "", "", "", false);
//                    employeedto = new EmployeeDto("", "", name, null, 0, null,
//                            0, 0, false, "", "", "", null, "", "", "", "", false);
                    if (this.employeeList == null) {
                        this.employeeList = new ArrayList<>();
                    }
                    this.employeeList.add(employeedto);
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
    public void getEmployee() throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        EmployeeDto employeedto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT employee_name, employee_id "
                        + "FROM employee ";
                stm = conn.prepareStatement(sql);
               
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    employeedto = new EmployeeDto(id, "", name, null, 0, null, "", 0, false, "", "", "", "", "", "", "", "", "", false);
//                    employeedto = new EmployeeDto("", "", name, null, 0, null,
//                            0, 0, false, "", "", "", null, "", "", "", "", false);
                    if (this.employeeList == null) {
                        this.employeeList = new ArrayList<>();
                    }
                    this.employeeList.add(employeedto);
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

    public void getReport(String departmentID, int month) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ReportDTO reportdto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id, e.employee_name, r.report_title, r.report_id, d.department_name, [month] "
                        + "FROM Report r "
                        + "JOIN employee e ON e.employee_id = r.employee_id "
                        + "JOIN department d ON d.department_id = e.department_id "
                        + "WHERE e.department_id = ? AND [month] = ? AND [status] = 'completed'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, departmentID);
                stm.setInt(2, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("employee_name");
                    String title = rs.getString("report_title");
                    int id = rs.getInt("report_id");
                    String department = rs.getString("department_name");
                    month = rs.getInt("month");
                    String emId = rs.getString("employee_id");

                    reportdto = new ReportDTO(id, title, name, 0, 0, 0, emId, month, 0, department);
                    if (this.reportList == null) {
                        this.reportList = new ArrayList<>();
                    }
                    this.reportList.add(reportdto);
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

    public void getReportDetail(String name, int month) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ReportDTO reportDTO = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT r.report_title ,e.employee_name, r.absent_day, r.overtime_day, r.excused_absent_day, [month], r.late_day "
                        + "FROM Report r "
                        + "JOIN [User] u ON r.employee_id = u.employee_id "
                        + "JOIN employee e ON e.employee_id = u.employee_id "
                        + "WHERE e.employee_name LIKE N'%' + ? + N'%' AND [month] = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                stm.setInt(2, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String title = rs.getString("report_title");
                    name = rs.getString("employee_name");
                    int lateDay = rs.getInt("late_day");
                    int absentDay = rs.getInt("absent_day");
                    int overtimeDay = rs.getInt("overtime_day");
                    int excuseDay = rs.getInt("excused_absent_day");
                    month = rs.getInt("month");

                    reportDTO = new ReportDTO(0, title, name, lateDay, absentDay, overtimeDay, "", month, excuseDay, "");
                    if (this.reportList == null) {
                        this.reportList = new ArrayList<>();
                    }
                    this.reportList.add(reportDTO);
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

    private List<ApplicantDto> listApplicant;

    public List<ApplicantDto> getListApplicant() {
        return listApplicant;
    }

    public void getPendingApplicant(String departmentID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ApplicantDto applicantDto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT a.[name], a.email, a.phoneNumer, d.department_name, a.interviewDate, a.gender "
                        + "FROM Applicant a "
                        + "JOIN JobOffering j ON j.jobOffering_id = a.jobOffering_id "
                        + "JOIN department d ON d.department_id = j.departmentID "
                        + "WHERE d.department_id = ? AND a.[status] IS NULL ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, departmentID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    int phone = rs.getInt("phoneNumer");
                    String departmentName = rs.getString("department_name");
                    Date interviewDate = rs.getDate("interviewDate");
                    boolean gender = rs.getBoolean("gender");
                    applicantDto = new ApplicantDto(0, name, phone, email, "", gender, false, interviewDate, 0, "", departmentName);
                    if (this.listApplicant == null) {
                        this.listApplicant = new ArrayList<>();
                    }
                    this.listApplicant.add(applicantDto);
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

    public void getApplicant(String departmentID, boolean status) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ApplicantDto applicantDto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT a.[name], a.email, a.phoneNumer, d.department_name, a.interviewDate, a.gender "
                        + "FROM Applicant a "
                        + "JOIN JobOffering j ON j.jobOffering_id = a.jobOffering_id "
                        + "JOIN department d ON d.department_id = j.departmentID "
                        + "WHERE d.department_id = ? AND a.[status] = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, departmentID);
                stm.setBoolean(2, status);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    int phone = rs.getInt("phoneNumer");
                    String departmentName = rs.getString("department_name");
                    Date interviewDate = rs.getDate("interviewDate");
                    boolean gender = rs.getBoolean("gender");
                    applicantDto = new ApplicantDto(0, name, phone, email, "", gender, false, interviewDate, 0, "", departmentName);
                    if (this.listApplicant == null) {
                        this.listApplicant = new ArrayList<>();
                    }
                    this.listApplicant.add(applicantDto);
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

    public int getNumberOfDayleave(int id, int month) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int number = 0;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(*) "
                        + "FROM DayLeave "
                        + "WHERE employeeID = ? AND DATEPART(MONTH, [date-created]) = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setInt(2, month);
                rs = stm.executeQuery();
                if (rs.next()) {
                    number = rs.getInt(1);
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
        return number;
    }

    public boolean updateAbsentDay(int month, String employeeID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE Report "
                        + "SET absent_day = absent_day + 1 "
                        + "WHERE month = ? AND employeeID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, month);
                stm.setString(2, employeeID);
                int effectRow = stm.executeUpdate();
                if (effectRow > 0) {
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

    public void getReportByName(String departmentID, int month, String name) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ReportDTO reportdto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id, e.employee_name, r.report_title, r.report_id, d.department_name, [month] "
                        + "FROM Report r "
                        + "JOIN employee e ON e.employee_id = r.employee_id "
                        + "JOIN department d ON d.department_id = e.department_id "
                        + "WHERE e.department_id = ? AND [month] = ? AND e.employee_name = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, departmentID);
                stm.setInt(2, month);
                stm.setString(3, name);
                rs = stm.executeQuery();
                while (rs.next()) {
                    name = rs.getString("employee_name");
                    String title = rs.getString("report_title");
                    int id = rs.getInt("report_id");
                    String department = rs.getString("department_name");
                    month = rs.getInt("month");
                    String emID = rs.getString("employee_id");

                    reportdto = new ReportDTO(id, title, name, 0, 0, 0, emID, month, 0, department);
                    if (this.reportList == null) {
                        this.reportList = new ArrayList<>();
                    }
                    this.reportList.add(reportdto);
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

    public boolean insertReport(int id, String title, String employeeID, int month, int year) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Report(report_id, report_title, employee_id, [month], [year]) "
                        + "VALUES (?, ?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, title);
                stm.setString(3, employeeID);
                stm.setInt(4, month);
                stm.setInt(5, year);

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
}
