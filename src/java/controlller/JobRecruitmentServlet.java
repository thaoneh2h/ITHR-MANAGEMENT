package controlller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.HRMDao;
import model.DTO.JobDTO;

public class JobRecruitmentServlet extends HttpServlet {

    private final Gson gson = new Gson(); // Create a Gson instance

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json"); // Set the response content type to JSON
        try {
            HRMDao dao = new HRMDao();

            List<JobDTO> list = dao.JobList(); // Retrieve the job list from the DAO

            // Convert the list to JSON using Gson and write it to the response
            response.getWriter().write(gson.toJson(list));
        } catch (Exception e) {
            e.printStackTrace();
            // In case of an exception, you might want to handle the error response here
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Job Recruitment Servlet";
    }
}
