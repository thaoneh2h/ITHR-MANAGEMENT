/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.StaffDao;
import model.DTO.EmployeeDto;
import model.DTO.UpdateErrorDto;
import model.DAO.UserDao;
import model.DTO.UserDto;
import utils.Validation;

/**
 *
 * @author ADMIN
 */
public class ChangePasswordController extends HttpServlet {

    private static final String CHANGE_PASS_PAGE = "ChangePassword.jsp";
    //private static final String SPECIAL_PATTERN = "(?=.*[!.#$@_+,?-]))"; 
    //private static final String SPECIAL_PATTERN = "[!@#$%&*()_+=|<>?{}\\[\\]~-]";

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
        String url = CHANGE_PASS_PAGE;

        //Get param from updatePage
        String currentPassword = request.getParameter("txtCurrentPassword");
        String newPassword = request.getParameter("txtNewPassword");
        String confirm = request.getParameter("txtConfirm");

        HttpSession session = request.getSession();
        UserDto user = (UserDto) session.getAttribute("user");
        String username = user.getUsername();

        boolean foundError = false;
        UpdateErrorDto error = new UpdateErrorDto();
        UserDao dao = new UserDao();
        try {
            UserDto check = dao.getPassword(username, currentPassword);
            if (check == null) {
                error.setPasswordError("Incorrect password");
                foundError = true;
            }

            if (Validation.readPattern(newPassword) == false) {
                error.setSpecialCharError("Must contain at least 1 special character");
                foundError = true;
            }

            if (Validation.checkUpperCase(newPassword) == false) {
                error.setFirstCharPasswordError("Must contain at least 1 uppercase");
                foundError = true;
            }
            boolean checkNum = Validation.numberPattern(newPassword);
            if (checkNum == false) {
                error.setFirstCharPasswordError("Must contain at least 1 number");
                foundError = true;
            }

            if (newPassword.length() < 8) {
                error.setPasswordLenError("Password must be at least 8 characters");
                foundError = true;
            }

            if (newPassword.isEmpty()) {
                error.setNewPasswordEmpty("Field must be filled");
            }

            if (!(newPassword.trim().equalsIgnoreCase(confirm))) {
                error.setIsNotMatch("2 passwords are not matched");
                foundError = true;
            }

            if (newPassword.equalsIgnoreCase(currentPassword)) {
                error.setPassIsExisted("Password is already existed");
                foundError = true;
            }

            if (foundError) {
                request.setAttribute("CREATE_ERROR", error);
                session.setAttribute("USER", check);
            } else {
//                dao.getUserPhoto(username);
//                List<EmployeeDto> userInfo = dao.getUserInfoList();
//                session.setAttribute("USER_PHOTO", userInfo);

                //String username = request.getParameter("txtUsername");
                boolean result = dao.updatePassword(newPassword, username);
                if (result) {
                    url = CHANGE_PASS_PAGE;
                    request.setAttribute("MESSAGE_SUCESS", "Update password sucesfully");
                }
            }
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
