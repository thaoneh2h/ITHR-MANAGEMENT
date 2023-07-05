<%-- 
    Document   : ApplyForm
    Created on : Jun 13, 2023, 9:00:01 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="styles/login.css" />
        <title>Home page</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="styles/homepage.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <script src="js/anime-master/lib/anime.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        

    </head>

    <body class="">
        
        
        
        
        
        <%@include file="Layout/Header.jsp" %>
        <div
            class="container-fluid login-container d-flex flex-column justify-content-center align-items-center p-4">
            
            <div
                class="card apply-card-container d-flex flex-column justify-content-center align-items-center bg-transparent login-card">
                <div class="apply-form-bg">
                    <img src="assets/applicant.svg" class="apply-bg">
                </div>
        
                <!--<form  action="DispatchServlet" method="post">-->
                    <form class="position-relative" action="ApplyApplicantServlet" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="txtName" class="form-label">Name</label>
                            <input required type="text" class="form-control" id="txtName" name="txtName"
                                   placeholder="txtName">
                        </div>
                        <div class="mb-3">
                            <label for="txtPhone" class="form-label">Phone</label>
                            <input required type="tel" class="form-control" id="txtPhone" name="txtPhone"
                                   placeholder="Phone">
                        </div>
                        <div class="mb-3">
                            <label for="txtSex" class="form-label">Gender</label>
                            <select 
                                name="txtSex" 
                                class=" border text-sm rounded-lg block w-full p-2.5  border-gray-600 placeholder-gray-400  ring-blue-500 focus:border-blue-500"
                                >   
                                <option value="male" >Male</option>
                                <option value="female" >Female</option>
                            </select>

                        </div>
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email</label>
                            <input required type="email" class="form-control" id="txtEmail" name="txtEmail"
                                   placeholder="Email">
                        </div>
                        <div class="mb-3">
                            CV <input type="file" name="cv" value=""/> <br/>
                        </div>
                        <p class="text-danger">${message}</p>
                        <div class="mb-3">
                            <input class="btn btn-primary" type="submit" name="btnAction" value="Apply"/>
                        </div>
                    </form>
            </div>
        </div>
        <%@include file="Layout/Footer.jsp" %>
    </body>

</html>


