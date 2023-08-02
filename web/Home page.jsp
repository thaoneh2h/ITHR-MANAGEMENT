<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List" %>
<%@ page import="model.DTO.JobDTO" %>


<!DOCTYPE html>

<html>
    <!----------------------------------------------------------------------------------------------->

    <head>
        <title>Home page</title>
        <%@include file="Layout/Head.jsp" %>
    </head>

    <!----------------------------------------------------------------------------------------------->

    <body>
        <%@include file="/Layout/Header.jsp" %>

     

            <!------------------------------------------------------------------------------------------->
            <section class="continer-fluid careers">
                <div class="row row-cols-2 align-items-center">
                    <div class="col image"><%@include file="assets/career.svg" %></div>
                    <div class="col  rounded careers-table" data-aos="fade-left">
                        <div class="m-4">
                            <p class="text-center h2 fw-bold">Careers</p>
                        </div>



                        <!--                                <div class="card border-0 mb-3">
                                                            <div class="card-body d-flex justify-content-between full-width align-items-center">
                                                                <div class="full-width">
                                                                    <h6 class="card-subtitle mb-2 text-secondary">CounsinTech</h6>
                                                                    <h4>{dto.jobTitle} Recruitment</h4> 
                                                                </div>
                                                                <a href="#" onclick="goToDestination('back-end')">
                                                                    <button class="btn btn-primary">
                                                                        Apply
                                                                    </button>
                                                                </a>
                                                            </div>
                                                        </div>-->


                        <table>
                            <tbody id="jobTitles">
                                <c:forEach items="${LIST_JOB}" var="job">
                                    <tr>
                                        <td>${job.jobTitle}</td>
                                    </tr>

                                </c:forEach>


                        </table>

                    </div>
                </div>
                <script>
                    window.addEventListener('DOMContentLoaded', function () {
                        fetchJobTitles(); // Fetch job titles when the page loads
                    });

                    function fetchJobTitles() {
                        fetch('JobRecruitmentServlet') // Use the relative URL here
                                .then(response => response.json())
                                .then(data => {
                                    const jobTitlesContainer = document.getElementById('jobTitles');
                                    data.forEach(job => {
                                        const row = document.createElement('tr');

                                        // Create a cell for the job title
                                        const titleCell = document.createElement('td');
                                        titleCell.textContent = job.jobTitle;
                                        row.appendChild(titleCell);

                                        // Create a cell for the Apply button
                                        const applyCell = document.createElement('td');
                                        const applyButton = document.createElement('button');
                                        applyButton.textContent = 'Apply';

                                        // Set the JobID as a data attribute on the Apply button
                                        applyButton.setAttribute('data-jobid', job.jobID);

                                        applyButton.addEventListener('click', function () {
                                            // Function to navigate to ApplyPage.jsp when the button is clicked
                                            const jobID = applyButton.getAttribute('data-jobid');
                                            window.location.href = 'ApplyPage.jsp?jobID=' + jobID;
                                        });

                                        applyCell.appendChild(applyButton);
                                        row.appendChild(applyCell);

                                        // Append the row to the table body
                                        jobTitlesContainer.appendChild(row);
                                    });
                                })
                                .catch(error => console.error('Error fetching job titles:', error));
                    }

                </script>

                <!------------------------------------------------------------------------------------------->
                <section class="container-fluid contact" data-aos="fade-left">
                    <div class="m-4">
                        <p class="text-center h2 fw-bold">CONTACT</p>
                    </div>

                    <!----------------------------------------------------------------------------------------->
                    <div class="row row-cols-2 justify-content-evenly align-items-center">
                        <div class="col-4">
                            <!------------------------------------------------------------------------------------->
                            <form class="container" onSubmit="submitForm()">
                                <h2 class="mb-3">Leave a message</h2>
                                <div class="mb-3">
                                    <label for="txtemail" class="form-label">Email address</label>
                                    <input
                                        required
                                        type="email"
                                        class="form-control"
                                        id="txtemail"
                                        placeholder="name@example.com"
                                        />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone number</label>
                                    <input
                                        required
                                        type="tel"
                                        class="form-control"
                                        id="phone"
                                        placeholder="0912312312"
                                        />
                                </div>
                                <div class="mb-3">
                                    <label for="message" class="form-label">Message</label>
                                    <textarea class="form-control" id="message" rows="3"></textarea>
                                </div>
                                <div class="mb-3">
                                    <button
                                        class="btn btn-primary"
                                        id="contactBtn"
                                        type="submit"
                                        value="submit"
                                        >
                                        Submit
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="col-4">
                            <h2 class="mb-5">About our social contact</h2>

                            <!------------------------------------------------------------------------------------->
                            <div class="row">
                                <!----------------------------------------------------------------------------------->
                                <div class="row mb-5">
                                    <div class="mb-3 col">
                                        <a href="#" class="text-decoration-none link-primary">
                                            <img
                                                class="me-3"
                                                src="assets/facebook-logo.png"
                                                alt="facebook-logo"
                                                width="40"
                                                />
                                            <span> facebook.com </span>
                                        </a>
                                    </div>
                                    <div class="mb-3 col">
                                        <a href="#" class="text-decoration-none link-primary">
                                            <img
                                                class="me-3"
                                                src="assets/gmail-logo.png"
                                                alt="facebook-logo"
                                                width="40"
                                                />
                                            <span> gmail.com </span>
                                        </a>
                                    </div>
                                </div>

                                <!----------------------------------------------------------------------------------->
                                <div class="row mb-5">
                                    <div class="mb-3 col">
                                        <a href="#" class="text-decoration-none link-primary">
                                            <img
                                                class="me-3"
                                                src="assets/instagram-logo.png"
                                                alt="facebook-logo"
                                                width="40"
                                                />
                                            <span> instagram.com </span>
                                        </a>
                                    </div>
                                    <div class="mb-3 col">
                                        <a href="#" class="text-decoration-none link-primary">
                                            <img
                                                class="me-3"
                                                src="assets/twitter-logo.png"
                                                alt="facebook-logo"
                                                width="40"
                                                />
                                            <span> twitter.com </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            <%@include file="Layout/Footer.jsp" %>
            <script type="text/javascript">
                document.addEventListener('DOMContentLoaded', function () {
                    window.setTimeout(document.querySelector('svg').classList.add('animated'), 1000);
                });
            </script>
            <script>
                function goToDestination(idValue) {
                    window.location.href = 'ApplyPage.jsp?id=' + idValue;
                }
            </script>
    </body>
</html>
