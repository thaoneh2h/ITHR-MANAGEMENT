/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.HRDao;
import model.DTO.EmailMessageDTO;
import model.DTO.EmployeeDto;
import model.DTO.UserDto;

/**
 *
 * @author ADMIN
 */
public class UpdateApplicantServlet extends HttpServlet {

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
            throws ServletException, IOException, NumberFormatException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String button = request.getParameter("btnAction");
        int applicantID = Integer.parseInt(request.getParameter("applicantID"));
        String date = request.getParameter("date");
        String candidateName = request.getParameter("txtName");
        String jobTitle = request.getParameter("txtJobTitle");
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");

        String url = "HR/Applicant.jsp";
        HRDao dao = new HRDao();
        try {
            switch (button) {
                case "Approve":
                    dao.updateApplicantStatus(true, applicantID);
                    url = "MainController?btnAction=Pending";
                    break;
                case "Reject":
                    dao.updateApplicantStatus(false, applicantID);
                    url = "MainController?btnAction=Pending";
                    break;
                case "Set":
                    if (!date.equals("")) {
                        Date interviewDate = formatDate.parse(date);
                        dao.updateInterviewDate(interviewDate, applicantID);
                    }

                    // ====== Send mail to Leader =====
                    HttpSession session = request.getSession();
                    // Get department ID
                    String departmentid = dao.getDepartmentIDInApplicant(jobTitle);
                    // Get Leader of department's username
                    String username = dao.getUsernameByDepartment(departmentid);
                    
                    String emailTo = dao.getEmailByDepartment(departmentid, username); // Replace with the specific email address                   

                    // Retrieve form data from the request
                    Date interviewDate = formatDate.parse(date);
                    String message = "Dear Lead FE,\n"
                            + "HR Department would like to send the list of candidates for interview for the position of "+jobTitle+" as follows:\n"
                            + "     " + candidateName + " – " + interviewDate + "\n"
                            + "Interview location at the Development Cooperation Department.\n"
                            + "If there is any change in time or location, please send it to HR department 24 hours before the interview for HR to re-arrange.\n"
                            + "Thank you\n"
                            + "HRM";

                    // Create an instance of the model class and populate it with the form data
                    EmailMessageDTO emailMessage = new EmailMessageDTO();
                    emailMessage.setMessage(message);
                    emailMessage.setEmail("phongngo17092003@gmail.com");

                    // Send the email using the email service (JavaMail API)
                    sendEmail(emailTo, emailMessage);
                    // Forward the request to a success or confirmation page
                    url = "MainController?btnAction=Pending";
                    break;
            }
        } catch (Exception e) {
        } finally {
            response.sendRedirect(url);
        }
    }

    private void sendEmail(String emailTo, EmailMessageDTO emailMessage) {
        final String username = "phongngo17092003@gmail.com"; // Replace with your Gmail email
        final String password = "fuqnehunzsfoqdld"; // Replace with your Gmail password

        // Setup properties for the mail server
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        // Create a session with authentication
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a MimeMessage for the email
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailMessage.getEmail()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject("Informing About Scheduling Interview Date for Candidates");
            message.setText(emailMessage.getMessage());

            // Send the email
            Transport.send(message);

            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            // Handle any exceptions that occurred during sending the email
            throw new RuntimeException(e);
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
        } catch (NumberFormatException ex) {
            Logger.getLogger(UpdateApplicantServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateApplicantServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NumberFormatException ex) {
            Logger.getLogger(UpdateApplicantServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateApplicantServlet.class.getName()).log(Level.SEVERE, null, ex);
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
