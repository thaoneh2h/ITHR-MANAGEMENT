/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.DAO.GuessDao;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
public class ApplyApplicantServlet extends HttpServlet {

    private static final String APPLY_PAGE = "ApplyPage.jsp";

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
        String url = APPLY_PAGE;
        request.setCharacterEncoding("UTF-8");
      

        String idValue = request.getParameter("idValue");
        int jobId = 0; // Default value in case the parameter is not provided or invalid

        if (idValue != null && !idValue.isEmpty()) {
            try {
                jobId = Integer.parseInt(idValue);
            } catch (NumberFormatException e) {
                // Handle the case when the idValue cannot be parsed into an integer
                e.printStackTrace();
                // You may choose to show an error message to the user or handle it differently based on your requirements
            }
        }
        Random random = new Random();

        String name = request.getParameter("txtName");
        String phone = request.getParameter("txtPhone");
        boolean gender = Boolean.parseBoolean(request.getParameter("txtSex"));
        String email = request.getParameter("txtEmail");
        String address = request.getParameter("txtAdress");
        int applicantID = random.nextInt(200);

        Part part = request.getPart("cv");

        String dob = request.getParameter("date");
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate birthDate = LocalDate.parse(dob, dateFormatter);
        // Ngày hiện tại
        LocalDate currDate = LocalDate.now();
        // Tính số tuổi
        Period period = Period.between(birthDate, currDate);
        int age = period.getYears();

        Calendar calendar = Calendar.getInstance();
        Date currentDate = calendar.getTime();

        // Tạo một số ngẫu nhiên từ 0 đến 10
        int randomDays = random.nextInt(10);

        // Thêm số ngày ngẫu nhiên vào ngày hiện tại
        calendar.add(Calendar.DAY_OF_YEAR, randomDays);
        Date randomDate = calendar.getTime();

        // Định dạng ngày bất kỳ theo định dạng năm-tháng-ngày
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String interviewDate = dateFormat.format(randomDate);

        try {

            String filename = part.getSubmittedFileName();

            String path = getServletContext().getRealPath("/" + "files" + File.separator + filename);
            // Tiếp tục xử lý tập tin
            InputStream is = part.getInputStream();
            boolean sucs = uploadFile(is, path);
            boolean check = GuessDao.insertApplicant(applicantID, name, phone, email, gender, interviewDate, address, dob, age, jobId);

            url = "ApplyPage.jsp"
                    + "?id=" + idValue;
            request.setAttribute("MESSAGE_SUCCESS", "You will receive an email to schedule an interview soon");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
        }
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[is.available()];
            is.read(byt);
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
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
