<%-- 
    Document   : ApplyPage
    Created on : Jul 3, 2023, 11:22:53 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<% String jobID = request.getParameter("jobID"); %>

<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta charset=UTF-8">
        <title>Apply Page</title>

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
                             
                                 <input type="hidden" name="idValue" value="<%=jobID%>">
                                 
                                

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