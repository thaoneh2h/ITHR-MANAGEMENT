/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.HRDao;
import model.DAO.StaffDao;
import model.DAO.UserDao;
import model.DTO.EmployeeDto;
import model.DTO.ReportDTO;
import model.DTO.UserDto;

/**
 *
 * @author ADMIN
 */
public class UpdateApproveServlet extends HttpServlet {

    private static final String DAY_LEAVE_PAGE = "HR/DayLeave.jsp";

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String url = DAY_LEAVE_PAGE;
        int id = Integer.parseInt(request.getParameter("dayLeaveId"));
        
        String inputDate = request.getParameter("dayLeaveDate");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse(inputDate);

        try {

            // Get employeeID of dayleave
            UserDao userDao = new UserDao();
            EmployeeDto e_employeeID = userDao.getEmployeeIDFromDayleave(id);

            HttpSession session = request.getSession();
            session.setAttribute("EMPLOYEE_ID", e_employeeID);
            EmployeeDto employeeDto = (EmployeeDto) session.getAttribute("EMPLOYEE_ID");
            String employeeID = employeeDto.getEmployee_id();

            StaffDao staffDao = new StaffDao();
            // Get number of execuse day in contract  
            int number = staffDao.getNumberOfExecuseDayOff(employeeID);
            // If dayleave in contract still exist
            if (number > 0) {

                HRDao dao = new HRDao();
                boolean check = dao.updateStatus(id, true);
                // update sau khi tạo timekeeping
                dao.updateDayLeaveIdInTimekeeping(id, "absent with permission");

                //Get report ID
                int reportId = dao.getReportID(employeeID, id);
                //Update absentday in report
                dao.updateReportAbsentDayAndExcuseDay(reportId);

                //Update excuseday in contract
                dao.updateExecuseDayLeft(employeeID);
                
                //Insert timekeeping in dayleave table
                // 1.get timekeeping id
                int timekeepingID = dao.getTimekeepingID(date, employeeID);
                // 2. insert timekeeping
                dao.insertTimekeepingIDInDayLeave(timekeepingID, employeeID, date);
                
            } else {
                request.setAttribute("APPROVE_DAY_LEAVE_ERROR", "Employee's day off is exceeded");
            }
            
            url = "DispatchServlet"
                    + "?btnAction=Pending";

        } catch (Exception e) {
            e.printStackTrace();
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
            Logger.getLogger(UpdateApproveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateApproveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
