/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DTO.EmailMessageDTO;

/**
 *
 * @author PREDATOR
 */
@WebServlet(name = "SubmitMessageServlet", urlPatterns = {"/SubmitMessageServlet"})
public class SubmitMessageServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, AddressException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        String emailTo = "maxgotpayne@gmail.com"; // Replace with the specific email address

        // Retrieve form data from the request
        String email = request.getParameter("txtemail");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        try {

            // Create an instance of the model class and populate it with the form data
            EmailMessageDTO emailMessage = new EmailMessageDTO();
            emailMessage.setEmail(email);
            emailMessage.setPhoneNumber(phone);
            emailMessage.setMessage(message);

            // Send the email using the email service (JavaMail API)
            sendEmail(emailTo, emailMessage);
            // Forward the request to a success or confirmation page
        } finally {
            request.getRequestDispatcher("Home page.jsp").forward(request, response);
        }

    }

    private void sendEmail(String emailTo, EmailMessageDTO emailMessage) {
        final String username = "nghia14302@gmail.com"; // Replace with your Gmail email
        final String password = "ujvgkoinfjxrrkkg"; // Replace with your Gmail password

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
            message.setSubject("Contact Form Submission");
            message.setText("Email: " + emailMessage.getEmail() + "\n"
                    + "Phone: " + emailMessage.getPhoneNumber() + "\n"
                    + "Message: " + emailMessage.getMessage());

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

        } catch (SQLException ex) {
            Logger.getLogger(SubmitMessageServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(SubmitMessageServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SubmitMessageServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(SubmitMessageServlet.class.getName()).log(Level.SEVERE, null, ex);
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
