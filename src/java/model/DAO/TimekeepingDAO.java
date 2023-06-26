/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import model.DTO.TimekeepingDTO;
import utils.DBHelper;

/**
 *
 * @author PREDATOR
 */
public class TimekeepingDAO {
    private List<TimekeepingDTO> timekeepingList;

    public List<TimekeepingDTO> getTimekeeping() {
        return timekeepingList;
    }
    
    public void showTimekeeping(TimekeepingDTO timekeepingDTO) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect DB
            con = DBHelper.makeConnection();
            //2.SQL command
            if (con != null) {
                String sql = "select employee_id, employee_name "
                        + "from employee";
                //3. create statement
                stm = con.prepareStatement(sql);
                //4. execute statement
                rs = stm.executeQuery();
                //5. process result
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    timekeepingDTO = new TimekeepingDTO(id, name, null, null, null, "");

                    if (this.timekeepingList == null) {
                        this.timekeepingList = new ArrayList<>();
                    } // end list not existed
                    this.timekeepingList.add(timekeepingDTO);
                }
            } // end existing connection
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
    }
    
     public List<TimekeepingDTO> searchDate(String month) throws SQLException {
        List<TimekeepingDTO> searchDate = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimekeepingDTO timekeepingDTO = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select e.employee_id, e.employee_name "
                        + "from employee e "
                        + "Join timekeeping t on t.employee_id = e.employee_id "
                        + "Where MONTH(t.[date]) = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    timekeepingDTO = new TimekeepingDTO(id, name, null, null, null, "");
                   if(searchDate == null){
                       searchDate = new ArrayList<>();
                   }
                    searchDate.add(timekeepingDTO);
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
     
      public List<TimekeepingDTO> showTimekeepingDetail(String emp_Name, String month) throws SQLException {
        List<TimekeepingDTO> searchDate = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimekeepingDTO timekeepingDTO = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select e.employee_id, e.employee_name, t.[date], t.time_in, t.[time_out], t.[status] "
                        + "from employee e "
                        + "Join timekeeping t on t.employee_id = e.employee_id "
                        + "Where e.employee_name LIKE N'%' + ? + N'%' AND MONTH(t.[date]) = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, emp_Name);
                stm.setString(2, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    Date date = rs.getDate("date");
                    Time timeIn = rs.getTime("time_in");
                    Time timeOut = rs.getTime("time_out");
                    String status = rs.getString("status");
                    timekeepingDTO = new TimekeepingDTO(id, name, date, timeIn, timeOut, status);
                   if(searchDate == null){
                       searchDate = new ArrayList<>();
                   }
                    searchDate.add(timekeepingDTO);
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
      
      public List<TimekeepingDTO> showTimekeepingDetail(String emp_Name) throws SQLException {
        List<TimekeepingDTO> searchDate = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimekeepingDTO timekeepingDTO = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select e.employee_id, e.employee_name, t.[date], t.time_in, t.[time_out], t.[status] "
                        + "from employee e "
                        + "Join timekeeping t on t.employee_id = e.employee_id "
                        + "Where e.employee_name LIKE N'%' + ? + N'%' ";
                stm = con.prepareStatement(sql);
                stm.setString(1, emp_Name);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    Date date = rs.getDate("date");
                    Time timeIn = rs.getTime("time_in");
                    Time timeOut = rs.getTime("time_out");
                    String status = rs.getString("status");
                    timekeepingDTO = new TimekeepingDTO(id, name, date, timeIn, timeOut, status);
                   if(searchDate == null){
                       searchDate = new ArrayList<>();
                   }
                    searchDate.add(timekeepingDTO);
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
      public List<TimekeepingDTO> userTimekeepingDetail(String emp_ID) throws SQLException {
        List<TimekeepingDTO> searchDate = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimekeepingDTO timekeepingDTO = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select e.employee_id, e.employee_name, t.[date], t.time_in, t.[time_out], t.[status] "
                        + "from employee e "
                        + "Join timekeeping t on t.employee_id = e.employee_id "
                        + "Where e.employee_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, emp_ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    Date date = rs.getDate("date");
                    Time timeIn = rs.getTime("time_in");
                    Time timeOut = rs.getTime("time_out");
                    String status = rs.getString("status");
                    timekeepingDTO = new TimekeepingDTO(id, name, date, timeIn, timeOut, status);
                   if(searchDate == null){
                       searchDate = new ArrayList<>();
                   }
                    searchDate.add(timekeepingDTO);
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
      
      public List<TimekeepingDTO> userTimekeepingDetail(String emp_ID, String month) throws SQLException {
        List<TimekeepingDTO> searchDate = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimekeepingDTO timekeepingDTO = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select e.employee_id, e.employee_name, t.[date], t.time_in, t.[time_out], t.[status] "
                        + "from employee e "
                        + "Join timekeeping t on t.employee_id = e.employee_id "
                        + "Where e.employee_id = ? AND MONTH(t.[date]) = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, emp_ID);
                stm.setString(2, month);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("employee_id");
                    String name = rs.getString("employee_name");
                    Date date = rs.getDate("date");
                    Time timeIn = rs.getTime("time_in");
                    Time timeOut = rs.getTime("time_out");
                    String status = rs.getString("status");
                    timekeepingDTO = new TimekeepingDTO(id, name, date, timeIn, timeOut, status);
                   if(searchDate == null){
                       searchDate = new ArrayList<>();
                   }
                    searchDate.add(timekeepingDTO);
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
}
