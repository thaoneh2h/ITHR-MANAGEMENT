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

        <!--------------------------------------------------------------------------------------------->
        <section class="container-fluid banner-bg mb-3">

            <!------------------------------------------------------------------------------------------->
            <div class="row row-cols-2 p-5" data-aos="fade-up">

                <div class="d-flex flex-column justify-content-center col">
                    <h1 class="fw-bold mb-5">New <span class="text-primary">offers</span> are waiting for you</h1>
                    <p class="fs-3">A place where you can show off your <span class="text-primary">qualities</span> and <span
                            class="text-primary">skills</span>. We always offers you the profestional and creative working system.
                    </p>
                </div>
                <div class="col p-5">
                    <%@include file="assets/banner4.svg" %>
                </div>
            </div>
        </section>

        <!--------------------------------------------------------------------------------------------->
        <section class="workplace-and-contact pb-5">

            <!------------------------------------------------------------------------------------------->
            <section class="cotainer-fluid p-5" data-aos="fade-right">

                <!----------------------------------------------------------------------------------------->
                <div class="row justify-content-center">
                    <div class="m-4 col-3">
                        <div class="mb-4">
                            <p class="text-center h2 fw-bold">WORKING PLACE</p>
                        </div>
                        <p class="fs-3">We always provide best <span class="text-primary">quality</span> and <span
                                class="text-primary">comfortable</span> environment for you to perform as well as you can.</p>
                    </div>
                    <div class="slider-container col-6">
                        <div id="environment" class="carousel slide">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#environment" data-bs-slide-to="0" class="active"
                                        aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#environment" data-bs-slide-to="1"
                                        aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#environment" data-bs-slide-to="2"
                                        aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="assets/wp1.jpg" class="d-block w-100" alt="wp1" />
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/wp2.jpg" class="d-block w-100" alt="wp2" />
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/wp3.jpg" class="d-block w-100" alt="wp3" />
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#environment" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#environment" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </section>



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
                                        <td>${job.jobTitle} Recruitment</td>
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
                                        applyButton.classList.add('apply-button'); // Thêm lớp CSS "apply-button"


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
                <style>
                    .apply-button {
                        background-color: #007bff;
                        color: white;
                        border: none;
                        padding: 8px 16px;
                        border-radius: 4px;
                        cursor: pointer;
                        transition: background-color 0.3s, color 0.3s;
                        left: 30px;
                    }

                    .apply-button:hover {
                        background-color: #0056b3;
                    }

                </style>

                <!------------------------------------------------------------------------------------------->
                <section class="container-fluid contact" data-aos="fade-left">
                    <div class="m-4">
                        <p class="text-center h2 fw-bold">CONTACT</p>
                    </div>

                    <!----------------------------------------------------------------------------------------->
                    <div class="row row-cols-2 justify-content-evenly align-items-center">
                        <div class="col-4">
                            <!------------------------------------------------------------------------------------->
                            <form class="container" onSubmit="submitForm()" action="DispatchServlet">
                            <h2 class="mb-3">Leave a message</h2>
                            <div class="mb-3">
                                <label for="txtemail" class="form-label">Email address</label>
                                <input
                                    required
                                    type="email"
                                    class="form-control"
                                    id="txtemail"
                                    placeholder="name@example.com" name="txtemail"
                                    />
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone number</label>
                                <input
                                    required
                                    type="tel"
                                    class="form-control"
                                    id="phone"
                                    placeholder="0912312312" name="phone"
                                    />
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="3" name="message"></textarea>
                            </div>
                            <div class="mb-3">
                                <button
                                    class="btn btn-primary"
                                    id="contactBtn"
                                    type="submit"
                                    value="submit" name="btnAction"
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
            <%@include file="Layout/Footer.jsp" %>
    </body>
</html>
