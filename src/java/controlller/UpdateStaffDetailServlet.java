/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.StaffDao;
import model.DTO.EmployeeDto;

/**
 *
 * @author ADMIN
 */
public class UpdateStaffDetailServlet extends HttpServlet {

    private static final String ERROR = "HR/UpdateStaffDetail.jsp";

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
            throws ServletException, IOException, ParseException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        String filename = null;
        // String dateString = request.getParameter("txtEmployeeDOB");
        //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String employeeId = request.getParameter("txtEmployeeId");
        String employeeName = request.getParameter("txtEmployeeName");
        //Date employeedob = sdf.parse(dateString);
        String phoneNumer = request.getParameter("txtEmployeePhone");
        String employeeEmail = request.getParameter("txtEmployeeEmail");
        String address = request.getParameter("txtEmployeeAddress");
        // String roleName = request.getParameter("txtEmployeeRole");
        String employeePhoto = request.getParameter("");

        String url = ERROR;
        try {
            // call Dao
            StaffDao dao = new StaffDao();
             EmployeeDto dto = new EmployeeDto(employeeId, "", employeeName, null, phoneNumer, null,
                    "", 0, false, "", employeeEmail, address, null, "", "", "", "", "", false);
            
            
            boolean result = dao.UpdateStaffDetail(dto);

            if (result) {
                url = "DispatchServlet?"
                        + "btnAction=Display"
                        + "&employee_name=" + employeeName;
            }
        } catch (SQLException e) {
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateStaffDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UpdateStaffDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(UpdateStaffDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UpdateStaffDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
