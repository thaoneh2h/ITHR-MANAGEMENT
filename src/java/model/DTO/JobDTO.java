/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

/**
 *
 * @author ADMIN
 */
public class JobDTO {
    private int jobID;
    private String jobTitle;
    private boolean jobStatus;
    private String departmentID;

    public JobDTO(int jobID, String jobTitle, boolean jobStatus, String departmentID) {
        this.jobID = jobID;
        this.jobTitle = jobTitle;
        this.jobStatus = jobStatus;
        this.departmentID = departmentID;
    }
      public JobDTO( String jobTitle) {
      
        this.jobTitle = jobTitle;
       
    }

    public int getJobID() {
        return jobID;
    }

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public boolean isJobStatus() {
        return jobStatus;
    }

    public void setJobStatus(boolean jobStatus) {
        this.jobStatus = jobStatus;
    }

    public String getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(String departmentID) {
        this.departmentID = departmentID;
    }
    
    
    
}
