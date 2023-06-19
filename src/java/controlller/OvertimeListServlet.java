/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.OvertimeDAO;
import model.DTO.OvertimeDTO;

/**
 *
 * @author 23030
 */
@WebServlet(name = "OvertimeListServlet", urlPatterns = {"/OvertimeListServlet"})

public class OvertimeListServlet extends HttpServlet {
     
    private static final String OT_LIST = "OTList.jsp";
    
//    List<EmployeeDto> employees = (List<EmployeeDto>) getEmployees();
//    
//    private static List<EmployeeDto> getEmployees() {
//
//        List<EmployeeDto> employees = new ArrayList<>();
//        return employees;
//    }
    
//        int totalEmployeesWorkingOvertime = 0;
//        int totalEmployeesNotWorkingOvertime = 0;
//            for (EmployeeDTO employee : employees) {
//                if (employee.getWorkingStatus() = true) {
//                    totalEmployeesWorkingOvertime++;
//                } else {
//                    totalEmployeesNotWorkingOvertime++;
//                }
//            }
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = OT_LIST;
        try {
            OvertimeDAO dao = new OvertimeDAO();
            OvertimeDTO dto = new OvertimeDTO();
            dao.getOvertimes(dto);
            List<OvertimeDTO> result = dao.getOvertimeList();
            request.setAttribute("OT_LIST", result);
            url = OT_LIST;
        } catch (Exception e) {
        }finally {
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
        processRequest(request, response);
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
        processRequest(request, response);
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
