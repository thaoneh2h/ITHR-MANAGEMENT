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
import model.DTO.DayLeaveDto;
import model.DTO.ReportDTO;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class HRMDao {

    private List<DayLeaveDto> dayLeaveList;

    public List<DayLeaveDto> getDayLeaveList() {
        return dayLeaveList;
    }

    private List<ReportDTO> reportList;

    public List<ReportDTO> getReportList() {
        return reportList;
    }

    public void getDayLeavePending(DayLeaveDto dto) throws SQLException {
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
                        + "WHERE d.status IS NULL "
                        + "ORDER BY MONTH(d.[date-created]) desc ";
                stm = conn.prepareStatement(sql);
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

    public void getReport(int month) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ReportDTO reportdto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id, e.employee_name, r.report_title, r.report_id, d.department_name, [month], j.JobTitle\n"
                        + "FROM Report r \n"
                        + "JOIN employee e ON e.employee_id = r.employee_id\n"
                        + "JOIN Job j ON j.JobID = e.JobID\n"
                        + "JOIN department d ON d.department_id = j.department_id \n"
                        + "WHERE [month] = ? AND [status] = 'completed'";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("employee_name");
                    String title = rs.getString("report_title");
                    int id = rs.getInt("report_id");
                    String department = rs.getString("department_name");
                    month = rs.getInt("month");
                    String emID = rs.getString("employee_id");
                    String jobTitle = rs.getString("JobTitle");

                    reportdto = new ReportDTO(id, title, name, 0, 0, 0, emID, month, 0, department, jobTitle);
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

    public void getReportByName(int month, String name) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ReportDTO reportdto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT e.employee_id ,e.employee_name, r.report_title, r.report_id, d.department_name, [month] "
                        + "FROM Report r "
                        + "JOIN employee e ON e.employee_id = r.employee_id "
                        + "JOIN Job j ON j.JobID = e.JobID "
                        + "JOIN department d ON d.department_id = j.department_id "
                        + "WHERE [month] = ? AND e.employee_name LIKE N'%'+ ? + '%'";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, month);
                stm.setString(2, name);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String emId = rs.getString("employee_id");
                    name = rs.getString("employee_name");
                    String title = rs.getString("report_title");
                    int id = rs.getInt("report_id");
                    String department = rs.getString("department_name");
                    month = rs.getInt("month");

                    reportdto = new ReportDTO(id, title, name, 0, 0, 0, emId, month, 0, department, "");
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

    public void getDayLeave(boolean status) throws SQLException {
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
                        + "WHERE d.status = ? "
                        + " ORDER BY MONTH(d.[date-created]) desc ";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, status);
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
}
