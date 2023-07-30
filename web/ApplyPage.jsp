<%-- 
    Document   : ApplyPage
    Created on : Jul 3, 2023, 11:22:53 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta charset=UTF-8">
        <title>Apply Page</title>
        <script>
            window.onload = function () {
                var urlParams = new URLSearchParams(window.location.search);
                var idValue = urlParams.get("id");
                document.getElementById("idValue").value = idValue;
                if (idValue === "back-end") {
                    var element = document.getElementById(idValue);
                    if (element) {
                        element.style.display = "block";
                        positionInput.value = "SD";
                    }
                } else if (idValue === "productManager") {
                    var element = document.getElementById(idValue);
                    if (element) {
                        element.style.display = "block";
                        positionInput.value = "PM";
                    }
                } else if (idValue === "front-end") {
                    var element = document.getElementById(idValue);
                    if (element) {
                        element.style.display = "block";
                        positionInput.value = "UI";
                    }
                } else if (idValue === "marketing") {
                    var element = document.getElementById(idValue);
                    if (element) {
                        element.style.display = "block";
                        positionInput.value = "SM";
                    }
                }
            };
        </script>
        <%@include file="Layout/Head.jsp" %>
    </head>
    <body>      

        <%@include file="/Layout/Header.jsp" %>
        <button onclick="history.back()" class="btn btn-outline-danger border-none back-button"
                >
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z"/>
            </svg>
            Back
        </button>
        <div
            class="d-flex flex-column justify-content-center align-items-center apply-page">
            <!--Hiển thị thông tin vị trí back-end-->
            <div class="apply-card">
                <div id="back-end" style="display: none;" >
                    <h1>Back-end Developer</h1> </br>  
                    <!-- <a href="#form">Apply for this job</a> -->
                    <p>
                        CounsinTech  was established in 2009 as a U.S.-based software development & consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers' expertise.

                        CounsinTech  Technology focuses on custom software development and a wide variety of consulting services
                        CounsinTech  Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support
                        CounsinTech  Solutions serves the Asia Pacific region, bringing the world's innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions
                        Besides providing services, CounsinTech  builds and successfully launches its own software companies through its internal startup incubator, CounsinTech  Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.

                        CounsinTech  is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.
                    </p> 
                    <h3>Responsibility</h3>
                    <p>You have a crucial role in building and maintaining the server-side of web applications. Your responsibilities revolve around designing, developing, and managing the behind-the-scenes functionality that powers these applications. Here are some key responsibilities associated with being a back-end develope</p>

                    <h3>Qualifications</h3>
                    <ul>
                        <li>Ready to work fulltime</li>
                        <li>Having experience with one programming language (C#, .NET, Java, Python) and a drive to learn and work with C#</li>
                        <li>Theoretical knowledge of software development good practices and basic software design patterns</li>
                        <li>Problem-solving skills and solution-oriented attitude</li>
                        <li>Ability to work independently and in a team setting</li>
                        <li>Good English skills (especially reading and writing)</li>
                    </ul>

                    <h3>Benefit and Perks</h3>
                    <ul>
                        <li>Working in one of the Best Places to Work in Vietnam</li>
                        <li>Building large-scale & global software products</li>
                        <li>Working & growing with Passionate & Talented Team</li>
                        <li>Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions & Consulting</li>
                        <li>Attractive Salary and Benefits</li>
                        <li>Two performance appraisals every year and performance bonus</li>
                        <li>Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</li>
                        <li>Flexible working time</li>
                        <li>Various training on hot-trend technologies, best practices and soft skills</li>
                        <li>Premium healthcare insurance for you and your loved ones</li>
                        <li>Company trip, big annual year-end party every year, team building, etc.</li>
                        <li>Fitness & sport activities: football, tennis, table-tennis, badminton, yoga, swimming…</li>
                        <li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</li>
                        <li>Free in-house entertainment facilities (foosball, ping pong, gym…), coffee, and snack (instant noodles, cookies, candies…)</li>
                    </ul>
                    And much more, join us and let yourself explore other fantastic things!

                </div>
                <!--Hiển thị thông tin vị trí front-end-->
                <div id="front-end" style="display: none;">
                    <h1>Front-end Developer</h1>
                    <!-- <a href="#form">Apply for this job</a> -->
                    <p>
                        CounsinTech  was established in 2009 as a U.S.-based software development & consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers' expertise.

                        CounsinTech  Technology focuses on custom software development and a wide variety of consulting services
                        CounsinTech  Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support
                        CounsinTech  Solutions serves the Asia Pacific region, bringing the world's innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions
                        Besides providing services, CounsinTech  builds and successfully launches its own software companies through its internal startup incubator, CounsinTech  Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.

                        CounsinTech  is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.
                    </p>
                    <h3>Responsibility</h3>
                    <p>Your responsibilities revolve around designing and implementing the visual and interactive elements of a website or web application. You work closely with designers and back-end developers to ensure a seamless user experience</p>

                    <h3>Qualification</h3>
                    <ul>
                        <li>Proficient in HTML, CSS, and JavaScript</li>
                        <li>Experience with front-end frameworks and libraries (e.g., React, Angular, Vue.js)</li>
                        <li>Understanding of responsive web design principles</li>
                        <li>Knowledge of cross-browser compatibility and testing</li>
                        <li>Familiarity with version control systems like Git</li>
                        <li>Experience with CSS preprocessors (e.g., Sass, Less)</li>
                        <li>Understanding of web accessibility standards (WCAG)</li>
                        <li>Ability to collaborate effectively with designers, back-end developers, and project managers</li>
                        <li>Strong problem-solving and debugging skills</li>
                        <li>Experience with optimizing front-end performance</li>
                        <li>Understanding of user-centered design principles</li>
                        <li>Knowledge of SEO best practices</li>
                        <li>Continuous learning mindset to keep up with industry trends and advancements</li>
                        <li>Good communication and teamwork skills</li>
                    </ul>
                    <h3>Benefit and Perks</h3>
                    <ul>
                        <li>Working in one of the Best Places to Work in Vietnam</li>
                        <li>Building large-scale & global software products</li>
                        <li>Working & growing with Passionate & Talented Team</li>
                        <li>Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions & Consulting</li>
                        <li>Attractive Salary and Benefits</li>
                        <li>Two performance appraisals every year and performance bonus</li>
                        <li>Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</li>
                        <li>Flexible working time</li>
                        <li>Various training on hot-trend technologies, best practices and soft skills</li>
                        <li>Premium healthcare insurance for you and your loved ones</li>
                        <li>Company trip, big annual year-end party every year, team building, etc.</li>
                        <li>Fitness & sport activities: football, tennis, table-tennis, badminton, yoga, swimming…</li>
                        <li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</li>
                        <li>Free in-house entertainment facilities (foosball, ping pong, gym…), coffee, and snack (instant noodles, cookies, candies…)</li>
                    </ul>
                    And much more, join us and let yourself explore other fantastic things!

                </div>
                <!--Hiển thị thông tin vị trí marketing-->
                <div id="marketing" style="display: none;">
                    <h1>Marketing</h1>
                    <!-- <a href="#form">Apply for this job</a> -->
                    <p>
                        CounsinTech  was established in 2009 as a U.S.-based software development & consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers' expertise.

                        CounsinTech  Technology focuses on custom software development and a wide variety of consulting services
                        CounsinTech  Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support
                        CounsinTech  Solutions serves the Asia Pacific region, bringing the world's innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions
                        Besides providing services, CounsinTech  builds and successfully launches its own software companies through its internal startup incubator, CounsinTech  Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.

                        CounsinTech  is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.
                    </p>
                    <h3>Responsibility</h3>
                    <p>
                        Your responsibilities revolve around promoting and selling products or services, driving revenue growth, and building strong customer relationships. You play a crucial role in driving the success of the company's sales and marketing efforts
                    </p>
                    <h3>Qualification</h3>
                    <ul>
                        <li>Excellent communication and interpersonal skills</li>
                        <li>Strong sales and negotiation skills</li>
                        <li>Understanding of marketing principles and strategies</li>
                        <li>Ability to build and maintain relationships with clients</li>
                        <li>Knowledge of digital marketing channels and strategies</li>
                        <li>Ability to work well in a team and collaborate with other departments</li>
                        <li>Goal-oriented mindset with a focus on achieving targets and driving results</li>
                        <li>Adaptability and willingness to learn and grow in a dynamic market</li>
                        <li>Attention to detail and strong organizational skills</li>
                    </ul>

                    <h3>Benefit and Perks</h3>
                    <ul>
                        <li>Working in one of the Best Places to Work in Vietnam</li>
                        <li>Building large-scale & global software products</li>
                        <li>Working & growing with Passionate & Talented Team</li>
                        <li>Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions & Consulting</li>
                        <li>Attractive Salary and Benefits</li>
                        <li>Two performance appraisals every year and performance bonus</li>
                        <li>Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</li>
                        <li>Flexible working time</li>
                        <li>Various training on hot-trend technologies, best practices and soft skills</li>
                        <li>Premium healthcare insurance for you and your loved ones</li>
                        <li>Company trip, big annual year-end party every year, team building, etc.</li>
                        <li>Fitness & sport activities: football, tennis, table-tennis, badminton, yoga, swimming…</li>
                        <li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</li>
                        <li>Free in-house entertainment facilities (foosball, ping pong, gym…), coffee, and snack (instant noodles, cookies, candies…)</li>
                    </ul>
                    And much more, join us and let yourself explore other fantastic things!
                </div>
                <!--Hiển thị thông tin vị trí PM-->
                <div id="productManager" style="display: none;">
                    <h1>Product manager</h1>
                    <!-- <a href="#form">Apply for this job</a> -->
                    <p>
                        CounsinTech  was established in 2009 as a U.S.-based software development & consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers' expertise.

                        CounsinTech  Technology focuses on custom software development and a wide variety of consulting services
                        CounsinTech  Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support
                        CounsinTech  Solutions serves the Asia Pacific region, bringing the world's innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions
                        Besides providing services, CounsinTech  builds and successfully launches its own software companies through its internal startup incubator, CounsinTech  Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.

                        CounsinTech  is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.
                    </p>
                    <h3>Responsibility</h3>
                    <p>
                        You have a pivotal role in leading the development and management of a product throughout its lifecycle. You collaborate with cross-functional teams, gather insights, and make strategic decisions to ensure the success of the product
                    </p>
                    <h3>Qualification</h3>

                    <ul>
                        <li>Strong strategic thinking and ability to develop a product vision and roadmap</li>
                        <li>Excellent communication and interpersonal skills to collaborate with cross-functional teams and stakeholders</li>
                        <li>Ability to gather and analyze market research and customer insights</li>
                        <li>Proficiency in product management methodologies and frameworks</li>
                        <li>Ability to adapt to changing market conditions and customer needs</li>
                        <li>Strong problem-solving and critical-thinking abilities</li>
                        <li>Experience in managing product lifecycles from concept to launch</li>
                        <li>Ability to work well in a fast-paced and collaborative environment</li>
                        <li>Excellent organizational and project management skills</li>
                    </ul>
                    <h3>Benefit and Perks</h3>
                    <ul>
                        <li>Working in one of the Best Places to Work in Vietnam</li>
                        <li>Building large-scale & global software products</li>
                        <li>Working & growing with Passionate & Talented Team</li>
                        <li>Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions & Consulting</li>
                        <li>Attractive Salary and Benefits</li>
                        <li>Two performance appraisals every year and performance bonus</li>
                        <li>Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</li>
                        <li>Flexible working time</li>
                        <li>Various training on hot-trend technologies, best practices and soft skills</li>
                        <li>Premium healthcare insurance for you and your loved ones</li>
                        <li>Company trip, big annual year-end party every year, team building, etc.</li>
                        <li>Fitness & sport activities: football, tennis, table-tennis, badminton, yoga, swimming…</li>
                        <li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</li>
                        <li>Free in-house entertainment facilities (foosball, ping pong, gym…), coffee, and snack (instant noodles, cookies, candies…)</li>
                    </ul>
                    And much more, join us and let yourself explore other fantastic things!
                </div>
                <div class="container-fluid d-flex justify-content-center position-relative">
                    <div class="card mt-3 apply-form-container position-sticky sticky-top mt-3">
                        <div class="card-header">
                            <h2>Apply for this job</h2>
                        </div>
                        <div class="card-body">                       
                            <form action="ApplyApplicantServlet" method="POST" enctype="multipart/form-data" id="form">
                                <div class="mb-3">
                                    <label for="txtName" class="form-label">Full name</label>
                                    <input required type="text" class="form-control" id="txtName" name="txtName"
                                           placeholder="Name">
                                </div>
                                <div class="mb-3">
                                    <label for="txtPhone" class="form-label">Phone</label>
                                    <input required type="tel" class="form-control" id="txtPhone" name="txtPhone"
                                           placeholder="Phone" size="10" pattern="[0-9]{10}" title="Please enter 10 digits only">
                                </div>
                                <div class="mb-3">
                                    <label for="txtSex" class="form-label">Gender</label>
                                    <select 
                                        name="txtSex" 
                                        class=" border form-select text-sm rounded-lg block w-full p-2.5  border-gray-600 placeholder-gray-400  ring-blue-500 focus:border-blue-500"
                                        >   
                                        <option value="true" >Male</option>
                                        <option value="false" >Female</option>
                                    </select>

                                </div>
                                <div class="mb-3">
                                    <label for="txtEmail" class="form-label">Email</label>
                                    <input required type="email" class="form-control" id="txtEmail" name="txtEmail"
                                           placeholder="Email">
                                </div>
                                <div class="mb-3">
                                    <label for="txtAdress" class="form-label">Address</label>
                                    <input required type="text" class="form-control" id="txtAdress" name="txtAdress"
                                           placeholder="Address">
                                </div>
                                <div class="mb-3">
                                    <label for="txtDate" class="block mb-2 text-sm font-medium ">
                                        Date of birth</label>
                                    <div class="relative max-w-sm">
                                        <input required name="date" type="date"  id="datepickerId"
                                               data-date="${param.date}" value="" 
                                               class="bg-gray-50 form-control border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " placeholder="Select date"/>
                                    </div>
                                </div>
                                <div>
                                    <label for="txtDate" class="block mb-2 text-sm font-medium ">
                                        CV
                                    </label>
                                    <input class="form-control"  id="formFile" type="file" name="cv" value=""/> <br/>
                                </div>
                                <p class="text-danger">${message}</p>
                                <div class="mb-3">
                                    <input type="hidden" name="position" id="positionInput">
                                    <input type="hidden" name="idValue" id="idValue">
                                    <input class="btn btn-primary" type="submit" name="btnAction" value="Apply"  onclick="showMessage()">                              
                                </div>
                                <div id="messageBox" class="message-box"></div>
                            </form>
                            <c:set var="message" value="${requestScope.MESSAGE_SUCCESS}"/>
                            <c:if test="${not empty message}">
                                ${message}
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <style>
            .message-box {
                display: none;
                position: absolute;
                top: 700px;
                right: 20px;
                padding: 10px 20px;
                background-color: #228B22;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-size: 16px;
                font-weight: bold;
                color: #FFFFFF;
                z-index: 9999;
            }
        </style>



        <script>
            var isValid = false;

            function checkValidity() {
                var txtName = document.getElementById("txtName").value;
                var txtPhone = document.getElementById("txtPhone").value;
                var txtEmail = document.getElementById("txtEmail").value;
                var txtAdress = document.getElementById("txtAdress").value;
                var datepickerId = document.getElementById("datepickerId").value;

                // Kiểm tra số điện thoại phải chứa đúng 10 chữ số và không chứa chữ
                var phonePattern = /^\d{10}$/;
                var isValidPhoneNumber = phonePattern.test(txtPhone);

                // Kiểm tra định dạng email
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var isValidEmail = emailPattern.test(txtEmail);

                if (
                        txtName.trim() !== "" &&
                        isValidPhoneNumber &&
                        isValidEmail &&
                        txtAdress.trim() !== "" &&
                        datepickerId.trim() !== ""
                        ) {
                    isValid = true;
                } else {
                    isValid = false;
                }
            }


            function showMessage() {
                checkValidity();
                if (isValid) {
                    var messageBox = document.getElementById("messageBox");
                    messageBox.innerHTML = "Submitted successfully!";
                    messageBox.style.display = "block";
                    sessionStorage.setItem("successMessageShown", "true");

                    setTimeout(function () {
                        messageBox.style.display = "none";
                    }, 2000);
                }
            }
            document.addEventListener("DOMContentLoaded", function () {
                if (sessionStorage.getItem("successMessageShown") === "true") {
                    var messageBox = document.getElementById("messageBox");
                    messageBox.innerHTML = "Submitted successfully!";
                    messageBox.style.display = "block";

                    // Auto-hide the message box after 3 seconds
                    setTimeout(function () {
                        messageBox.style.display = "none";
                    }, 2000);

                    // Clear the flag in sessionStorage so the message won't show on subsequent reloads
                    sessionStorage.removeItem("successMessageShown");
                }
            });
        </script>



    </body>
</html>
