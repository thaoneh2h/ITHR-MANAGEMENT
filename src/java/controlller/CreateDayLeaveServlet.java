/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.StaffDao;
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String button = request.getParameter("btnAction");
        if (button.equals("Create")) {
            
            String title = request.getParameter("txtTitle");
            String type = request.getParameter("txtType");
            String description = request.getParameter("txtDescr");

            HttpSession session = request.getSession();
            UserDto userDTO = (UserDto) session.getAttribute("user");
            String username = userDTO.getUsername();

            // Lấy thời gian hiện tại
            LocalDateTime currentDateTime = LocalDateTime.now();
            // Tạo định dạng ngày giờ mong muốn
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            // Tạo ngẫu nhiên một giá trị thời gian trong khoảng 10 ngày trước đến hiện tại
            LocalDateTime randomDateTime = currentDateTime.minusMonths((long) (Math.random() * 3))
                    .minusHours((long) (Math.random() * 24))
                    .minusMinutes((long) (Math.random() * 60))
                    .minusSeconds((long) (Math.random() * 60));
            // Định dạng giá trị ngẫu nhiên của datetime
            String dateCreate = randomDateTime.format(formatter);

            // Lấy ID 
            Random random = new Random();
            int ranID = random.nextInt(50);

            String url = CREATE_LEAVE_DAY_PAGE;
            try {
                StaffDao dao = new StaffDao();
                boolean check = dao.insertLeaveReport(ranID, title, description, dateCreate, username, type);
                if (check) {
                    url = CREATE_LEAVE_DAY_PAGE;
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
