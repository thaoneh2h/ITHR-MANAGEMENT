/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.StaffDao;
import model.DAO.UserDao;
import model.DTO.EmployeeDto;
import model.DTO.UserDto;

/**
 *
 * @author ADMIN
 */
public class CreateDayLeaveServlet extends HttpServlet {

    private static final String CREATE_LEAVE_DAY_PAGE = "CreateDayLeave.jsp";

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String button = request.getParameter("btnAction");
        if (button.equals("Create")) {

            String title = request.getParameter("txtTitle");
            String description = request.getParameter("txtDescr");
            String date = request.getParameter("date");

            HttpSession session = request.getSession();
            UserDto userDTO = (UserDto) session.getAttribute("user");
            String username = userDTO.getUsername();

            // Get employeeID
            UserDao userDao = new UserDao();
            EmployeeDto e_employeeID = userDao.getEmployeeID(username);

            session.setAttribute("EMPLOYEE_ID", e_employeeID);
            EmployeeDto employeeDto = (EmployeeDto) session.getAttribute("EMPLOYEE_ID");
            String employeeID = employeeDto.getEmployee_id();

            // Lấy ID 
            Random random = new Random();
            int ranID = random.nextInt(500);

            String url = CREATE_LEAVE_DAY_PAGE;

            try {

                StaffDao dao = new StaffDao();
                // Get number of execuse day in contract  
                int number = dao.getNumberOfExecuseDayOff(employeeID);
                if (number > 0) {
                    if (((!title.isEmpty()) || (!description.isEmpty()) )) {
                        boolean check = dao.insertLeaveReport(ranID, title, description, date, username, employeeID);
                        if (check) {
                            url = CREATE_LEAVE_DAY_PAGE;
                        }
                    } else {
                        request.setAttribute("EMPTY_ERROR", "All fields must be filled");
                    } 
                } else {
                    request.setAttribute("CREATE_DAY_LEAVE_ERROR", "Your number of day off is exceeded");
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
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
        } catch (SQLException ex) {
            Logger.getLogger(CreateDayLeaveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(CreateDayLeaveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
