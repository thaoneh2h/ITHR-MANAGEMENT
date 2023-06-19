/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import utils.DBHelper;

/**
 *
 * @author quanb
 */
@WebServlet(name = "RetrieveLateTimeServlet", urlPatterns = {"/RetrieveLateTimeServlet"})
public class RetrieveLateTimeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        try {
            // Retrieve the application_id parameter from the request
            int application_id = Integer.parseInt(request.getParameter("application_id"));

            // Retrieve the late time details from the database
            int lateDay = 0;
            int lateDayPenalty = 0;
            float totalPenalty = 0;

            Connection conn = null;
            PreparedStatement stm = null;
            ResultSet rs = null;

            try {
                conn = DBHelper.makeConnection();
                if (conn != null) {
                    String sql = "SELECT Application.late_day, contract.late_day_penalty, (Application.late_day * contract.late_day_penalty) AS total_penalty "
                            + "FROM employee \n"
                            + "LEFT JOIN contract ON contract.employee_contractId = employee.employee_contractId  \n"
                            + "LEFT JOIN salary ON employee.employee_id = salary.employee_id \n"
                            + "INNER JOIN Application ON Application.application_id = salary.application_id \n"
                            + "WHERE salary.application_id = ?";
                    stm = conn.prepareStatement(sql);
                    stm.setInt(1, application_id);
                    rs = stm.executeQuery();

                    if (rs.next()) {
                        lateDay = rs.getInt("late_day");
                        lateDayPenalty = rs.getInt("late_day_penalty");
                        totalPenalty = rs.getFloat("total_penalty");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stm != null) {
                        stm.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // Create a JSON object with the late time details
            JSONObject jsonData = new JSONObject();
            jsonData.put("lateDay", lateDay);
            jsonData.put("lateDayPenalty", lateDayPenalty);
            jsonData.put("totalPenalty", totalPenalty);

            // Convert the JSONObject to a JSON string
            String jsonString = jsonData.toString();

            // Set the content type of the response to JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            // Write the JSON string to the response
            out.print(jsonString);
            out.flush();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RetrieveLateTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RetrieveLateTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RetrieveLateTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
