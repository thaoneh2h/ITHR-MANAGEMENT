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
import model.DTO.ContractDTO;
import model.DTO.EmployeeDto;
import utils.DBHelper;

/**
 *
 * @author 23030
 */
public class ContractDAO {
    
        private List<ContractDTO> ContractList;

    public List<ContractDTO> getContractList() {
        return ContractList;
    }
    
    public void searchContract() throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ContractDTO contractDTO = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT c.employee_contractId, e.employee_name, signDate, expDate, inspireDate, " +
                             "medicalInsurance, accidentalInsurance, SocialAssurance, tax " +
                             "FROM contract c " +
                             "JOIN employee e On e.employee_contractId = c.employee_contractId";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int employee_contractID = rs.getInt("employee_contractId");
                    String employee_name = rs.getString("employee_name");
                    Date signDate = rs.getDate("signDate");
                    Date expDate = rs.getDate("expDate");
                    Date inspireDate = rs.getDate("inspireDate");
                    
                    contractDTO = new ContractDTO(employee_contractID, employee_name, "", signDate, expDate, inspireDate, 0, 0, 0, 0, 0, 0, 0, null);
                    
                    if (this.ContractList == null) {
                        this.ContractList = new ArrayList<>();
                    }//end account List had NOT existed
                    this.ContractList.add(contractDTO);
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
    
        public List<ContractDTO> getContractDetail(String contractPhoto) throws SQLException {
        List<ContractDTO> ContractList = null;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ContractDTO contractDTO = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT contract_photo "
                            +"FROM [dbo].[contract] "
                            + "WHERE [employee_contractId] LIKE N'%' + ? + N'%' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, contractPhoto);
                rs = stm.executeQuery();
                while (rs.next()) {

                    String photo = rs.getString("contract_photo");

                    contractDTO = new ContractDTO(0, null, sql, null, null, null, 0, 0, 0, 0, 0, 0, 0, photo);
                    
                    if (ContractList == null) {
                        ContractList = new ArrayList<>();
                    }//
                    ContractList.add(contractDTO);

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
        return ContractList;
    }

}
