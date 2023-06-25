/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class DispatchServlet extends HttpServlet {

    private static final String STAFF_LIST = "StaffListController";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePasswordController";
    private static final String STAFF_DETAIL_CONTROLLER = "StaffDetailController";
    private static final String LOGIN_CONTROLLER = "LoginServlet";
    private static final String LOGOUT_CONTROLLER = "LogoutServlet";
    private static final String FORGOT_CONTROLLER = "forgotPassowrdServlet";
    private static final String NewPass_CONTROLLER = "newPasswordServlet";
    private static final String FIND_STAFF_DETAIL_CONTROLLER = "FindStaffDetailServlet";
    private static final String UPDATE_STAFF_DETAIL_CONTROLLER = "UpdateStaffDetailServlet";
    private static final String DELETE_STAFF_DETAIL_CONTROLLER = "DeleteStaffDetailServlet";
    private static final String ACCOUNT_LIST = "AccountListServlet";
    private static final String ACCOUNT_DETAIL = "AccountDetailServlet";
    private static final String DROP_DOWN_CONTROLLER = "DropDownServlet";
    private static final String DAY_LEAVE_PENDING_CONTROLLER = "DayLeavePendingServlet";
    private static final String APPROVE_DAY_LEAVE_CONTROLLER = "UpdateApproveServlet";
    private static final String DAY_LEAVE_CONTROLLER = "DayLeaveServlet";
    private static final String DAY_LEAVE_REJECT_CONTROLLER = "DayLeaveRejectServlet";
    private static final String REJECT_DAY_LEAVE_CONTROLLER = "UpdateRejectServlet";
    private static final String SENT_DAY_LEAVE_CONTROLLER = "SentDayLeaveServlet";
    private static final String USER_INFO_CONTROLLER = "UserInfoServlet";
    private static final String REPORT_CONTROLLER = "ReportServlet";

    private static final String REPORT_DETAIL_CONTROLLER = "ViewReportServlet";
    private static final String TIMEKEEPING_CONTROLLER = "TimekeepingServlet";
    private static final String SEARCH_TIMEKEEPING_CONTROLLER = "SearchDateTimekeepingServlet";
    private static final String TIMEKEEPING_DETAIL_CONTROLLER = "TimekeepingDetailServlet";
    private static final String TIMEKEEPING_DETAIL_2_CONTROLLER = "TimekeepingDetail";

    private static final String UPDATE_USER_INFO_CONTROLLER = "UpdateUserInfoServlet";

    private static final String OVERTIME_LIST = "OvertimeListServlet";
    private static final String OVERTIME_DETAIL = "OvertimeDetailServlet";
    private static final String OVERTIME_DETAIL_2 = "OvertimeDetail2";
    private static final String SEARCH_OVERTIME = "SearchDateOvertime";
    private static final String CONTRACT_LIST = "ContractListServlet";
    private static final String CONTRACT_DETAIL = "ContractDetailServlet";
    private static final String APPLY_APPLICATION_CONTROLLER = "ApplyApplicantServlet";

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
        String url = STAFF_LIST;
        try {
            switch (button) {
                case "Display":
                    break;
                case "Login":
                    url = LOGIN_CONTROLLER;
                    break;
                case "Logout":
                    url = LOGOUT_CONTROLLER;
                    break;
                case "Update":
                    url = CHANGE_PASSWORD_CONTROLLER;
                    break;
                case "staffDetail":
                    url = STAFF_DETAIL_CONTROLLER;
                    break;
                case "Staff":
                    url = "StaffListController";
                    break;
//                case "ShowOverTimeList":
//                    url = "";
//                    break;
                case "forgot":
                    url = FORGOT_CONTROLLER;
                    break;
                case "newPassword":
                    url = NewPass_CONTROLLER;
                    break;
                case "Edit_StaffDetail":
                    url = FIND_STAFF_DETAIL_CONTROLLER;
                    break;
                case "Delete_StaffDetail":
                    url = DELETE_STAFF_DETAIL_CONTROLLER;
                    break;
//                case "Save":
//                    url = UPDATE_STAFF_DETAIL_CONTROLLER;
//                    break;
                case "ShowAccountList":
                    url = ACCOUNT_LIST;
                    break;
                case "AccDetail":
                    url = ACCOUNT_DETAIL;
                    break;
                case "Pending":
                    url = DAY_LEAVE_PENDING_CONTROLLER;
                    break;
                case "Approve":
                    url = APPROVE_DAY_LEAVE_CONTROLLER;
                    break;
                case "Approved":
                    url = DAY_LEAVE_CONTROLLER;
                    break;
                case "Rejected":
                    url = DAY_LEAVE_REJECT_CONTROLLER;
                    break;
                case "Reject":
                    url = REJECT_DAY_LEAVE_CONTROLLER;
                    break;
                case "Sent":
                    url = SENT_DAY_LEAVE_CONTROLLER;
                    break;
                case "UserInfo":
                    url = USER_INFO_CONTROLLER;
                    break;
                case "Report":
                    url = REPORT_CONTROLLER;
                    break;
                case "ViewReport":
                    url = REPORT_DETAIL_CONTROLLER;
                    break;
                case "Timekeeping":
                    url = TIMEKEEPING_CONTROLLER;
                    break;
                case "SearchMonth":
                    url = SEARCH_TIMEKEEPING_CONTROLLER;
                    break;
                case "timekeepingDetail":
                    url = TIMEKEEPING_DETAIL_CONTROLLER;
                    break;
                case "timekeepingDetail2":
                    url = TIMEKEEPING_DETAIL_2_CONTROLLER;
                    break;

                case "ShowOvertimeList":
                    url = OVERTIME_LIST;
                    break;

                case "OTDetail":
                    url = OVERTIME_DETAIL;
                    break;

                case "SearchOTMonth":
                    url = SEARCH_OVERTIME;
                    break;

                case "OTDetail2":
                    url = OVERTIME_DETAIL_2;
                    break;

                case "ShowContractList":
                    url = CONTRACT_LIST;
                    break;

                case "ContractDetail":
                    url = CONTRACT_DETAIL;
                case "Save":
                    url = UPDATE_USER_INFO_CONTROLLER;
                    break;

                case "Salary":
                    url = "SalaryListServlet";
                    break;
                case "SalaryDetail":
                    url = "SalaryDetailServlet";
                    break;
                case "Apply":
                    url = APPLY_APPLICATION_CONTROLLER;
                    break;
                case "CreateReport":
                    url = DROP_DOWN_CONTROLLER;
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
