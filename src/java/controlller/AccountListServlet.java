/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.HRDao;
import model.DAO.StaffDao;
import model.DTO.EmployeeDto;
import model.DTO.UserDto;

/**
 *
 * @author 23030
 */
public class AccountListServlet extends HttpServlet {

    private static final String ACCOUNT_LIST = "AccountList.jsp";

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

        String url = ACCOUNT_LIST;

        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("user");
        String username = userDto.getUsername();
        String roleName = userDto.getRoleName();
        try {
            StaffDao sDao = new StaffDao();
            EmployeeDto dto = new EmployeeDto();
            HRDao hDao = new HRDao();
            
            switch (roleName) {
                // Get department id
                case "LEADER":
                    // Get department ID
                    EmployeeDto e_departmentid = hDao.getDepartmentID(username);

                    session.setAttribute("DEPARTMENT_ID", e_departmentid);
                    EmployeeDto employeeDto = (EmployeeDto) session.getAttribute("DEPARTMENT_ID");
                    String departmentID = employeeDto.getDepartment_id();

                    sDao.getAccListByDepartment(dto, departmentID);
                    List<EmployeeDto> result1 = sDao.getAccountList();
                    request.setAttribute("LIST_ACCOUNT_BY_DEPARTMENT", result1);
                    url = ACCOUNT_LIST;
                    break;

                case "HRM":
                    sDao.getAccList(dto);
                    List<EmployeeDto> result = sDao.getAccountList();
                    request.setAttribute("LIST_ACCOUNT", result);
                    url = ACCOUNT_LIST;
                    break;
            }

        } catch (Exception e) {
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
