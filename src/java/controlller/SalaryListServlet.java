/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.SalaryDao;
import model.DTO.SalaryDto;

/**
 *
 * @author quanb
 */
@WebServlet(name = "SalaryListServlet", urlPatterns = {"/SalaryListServlet"})
public class SalaryListServlet extends HttpServlet {

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
        String url = "HR/SalaryList.jsp";
        String monthInput = request.getParameter("date");
        
        int month = 0;
        int year = 0;

        try {
          
                if (monthInput != null && !monthInput.isEmpty()) {
                    try {
                        String[] parts = monthInput.split("-");

                        if (parts.length == 2) {
                            year = Integer.parseInt(parts[0]);
                            month = Integer.parseInt(parts[1]);
                            SalaryDao dao = new SalaryDao();
                            SalaryDto dto = new SalaryDto();

                            List<SalaryDto> list = dao.SearchByDate(month, year);
                            request.setAttribute("list", list);
                            request.setAttribute("monthInput", monthInput);
                            url = "HR/SalaryList.jsp";
                     }
                    } catch (NumberFormatException e) {

                    }
                

            }

        } catch (Exception e) {
            request.setAttribute("message", "loi roi");
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
