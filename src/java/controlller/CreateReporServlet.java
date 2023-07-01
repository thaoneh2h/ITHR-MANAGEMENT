/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.HRDao;

/**
 *
 * @author ADMIN
 */
public class CreateReporServlet extends HttpServlet {

    private static final String CREATE_REPORT_PAGE = "HR/CreateReport.jsp";
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
         String url = CREATE_REPORT_PAGE;
        String title = request.getParameter("txtTitle");
        String id = request.getParameter("txtEmployeeID");
        String descr = request.getParameter("txtDescr");
        String monthInput = request.getParameter("date");
        int month = 0;
        int year = 0;
        // Lấy ID 
        Random random = new Random();
        int ranID = random.nextInt(500);
        try {
            HRDao dao = new HRDao();
            if (monthInput != null && !monthInput.isEmpty()) {
                try {
                    String[] parts = monthInput.split("-");
                    if (parts.length == 2) {
                        year = Integer.parseInt(parts[0]);
                        month = Integer.parseInt(parts[1]);

                        boolean check = dao.insertReport(ranID, title, id, month, year);
                        if (check) {
                            url = "DispatchServlet?btnAction=CreateReport";
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("message", "Please choose month first");
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
