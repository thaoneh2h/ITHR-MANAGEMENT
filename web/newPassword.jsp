<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Change password</title>
    <%@include file="Layout/TailwindHead.jsp" %>
    
     <style>
        .form-container {
            position: relative;
            left: -3cm;
            top: 30px;
        }
        
        body {
           background: url("assets/banner-bg.png") no-repeat;
        }
    </style>
</head>

<body>   
    <%--<%@include file="Layout/Sidebar.jsp" %>--%>
    <section class="pt-16 sm:ml-64">
        <button onclick="history.back()" class="flex gap-2 items-center py-1 px-3 m-10 text-red-500
            hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                    d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
            </svg>
            Back
        </button>
        <div class="p-10 rounded-lg flex justify-center">
            <!-- new UI -->
            <div class="w-1/3 items-center flex  flex-col rounded-xl p-5 overflow-hidden relative form-container"
                style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
                <img src="https://kiranworkspace.com/demo/projects/code-snippets/card/profile-card/img/banner.jpg"
                    class="w-full h-28 absolute top-0 left-0 -z-[1] -z-[1]" alt="background profile" />
                <div class="p-1 bg-white mt-10 rounded-full">
                    <img src="https://t3.ftcdn.net/jpg/05/26/72/48/360_F_526724825_fEKkOFrsAnTBW3G5Qc9VCZxArl3zWEdT.jpg" alt="avatar" class="w-28 h-28 rounded-full"
                        style="box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;" />
                </div>
                <p class="text-2xl font-bold text-center w-full my-2 mb-4">
                    ${userSalary.employee_name}
                </p>
                <form class="position-relative w-full" action="DispatchServlet" method="POST">
                    <div class="mb-3">
                        <label for="password" class="block mb-2 text-sm font-medium ">
                            New Password</label>
                        <input type="password"
                            class="border text-sm rounded-lg block w-full p-2.5 border-gray-600 placeholder-gray-400 ring-blue-500 focus:border-blue-500"
                            id="password" name="password" placeholder="New Password" onkeyup="validatePassword()">

                    </div>
                    <div id="passwordError" class="text-red-400 hidden">New password must have 8 characters, must contain 1 special character, and the first letter must be uppercase.</div>


                    <div class="mb-3">
                        <label for="confPassword" class="block mb-2 text-sm font-medium ">
                            Confirm Password</label>
                        <input type="password"
                            class="border text-sm rounded-lg  block w-full p-2.5  border-gray-600 placeholder-gray-400 ring-blue-500 focus:border-blue-500"
                            id="confPassword" name="confPassword" placeholder="Confirm Password">

                    </div>

                    <% if (request.getAttribute("message") != null) {
                            out.print("<p class=\" text-red-400\">"
                                    + request.getAttribute("message") + "</p>");
                        }
                    %>
                    <div class="mb-4">
                        <button id="submitButton"
                            class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2"
                            type="submit" name="btnAction" value="newPassword">
                            Confirm
                        </button>
                    </div>
                </form>
                    
            </div>
            <!--<img src="./assets/cv-deco.gif" alt="cv decoration" class="absolute bottom-5 right-0 cv-decoration" />-->
            <!-- UI -->
        </div>
    </section>
    <div id="successMessage" class="success-message hidden">Password changed successfully!</div>
    <%@include file="Layout/TailwindFooter.jsp" %>
    <script>
        <% if (session.getAttribute("passwordChangeSuccess") != null) { %>
            document.getElementById("successMessage").classList.remove("hidden");
            setTimeout(function() {
                window.location.href = "Login page.jsp";
            }, 4000);
        <% } %>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var pattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            var submitButton = document.getElementById("submitButton");
            var errorMessage = document.getElementById("passwordError");

            if (!pattern.test(password)) {
                submitButton.disabled = true;
                errorMessage.textContent = "New password must have 8 characters, must contain 1 special character, and the first letter must be uppercase.";
                errorMessage.style.display = "block";
            } else {
                submitButton.disabled = false;
                errorMessage.style.display = "none";
            }
        }
    </script>

</body>

</html>
