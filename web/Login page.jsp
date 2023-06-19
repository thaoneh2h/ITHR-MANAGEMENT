<%-- Document : Login page Created on : May 23, 2023, 5:27:11 PM Author : ADMIN --%>

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
                class="card card-container d-flex flex-column justify-content-center align-items-center bg-transparent login-card">
                <div class="login-form-bg">
                    <img src="assets/login.svg" class="login-bg">
                </div>
                <form class="position-relative form-container" action="DispatchServlet" method="post">
                    <div class="mb-3">
                        <label for="txtUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="txtUsername" name="txtUsername"
                               placeholder="username">
                    </div>
                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="txtPassword" name="txtPassword"
                               placeholder="password">
                        <p class="text-danger">${message}</p>
                    </div>
                    <div class="mb-3">
                        <input class="btn btn-primary" type="submit" name="btnAction" value="Login">
                    </div>
                    <a href="forgotPassword.jsp">Forgot Password? </a>
                </form>
            </div>
        </div>
        <%@include file="Layout/Footer.jsp" %>
    </body>

</html>