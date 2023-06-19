/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class GuessDao {
    
    public static boolean insertApplicant(int id, String name, int phone, String email, String gender) throws SQLException{
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "  INSERT INTO Applicant (Applicant_id, name, phoneNumer, email, gender) VALUES (?, ?, ?, ?, ?) ";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, name);
                stm.setInt(3, phone);
                stm.setString(4, email);
                stm.setString(5, gender);
                int effectRow = stm.executeUpdate();

                if (effectRow > 0) {
                    result = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        
        return result;
    }
}
