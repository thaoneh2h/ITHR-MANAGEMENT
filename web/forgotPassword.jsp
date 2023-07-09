<%-- Document : forgotPassword Created on : May 22, 2023, 4:03:33 PM Author : quanb --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>
        <%@include file="Layout/Head.jsp" %>

            <body>
                <%@include file="Layout/Header.jsp" %>

                    <!-- UI -->
                    <div
                        class="container-fluid login-container d-flex flex-column justify-content-center align-items-center p-4">
                        <div
                            class="card forgot-pass-card row justify-content-center align-items-center bg-transparent login-card">
                            <div class="col-7">
                                <div class="mb-3">
                                    <h2>Forgot your password?</h2>
                                    <p>Change your password in three easy steps. This will help you
                                        to secure your password!</p>
                                    <ol class="">
                                        <li><span>1. </span>Enter
                                            your registed account email address below.</li>
                                        <li><span>2. </span>Our
                                            system will send you an OTP to your email</li>
                                        <li><span>3. </span>Enter the OTP on the
                                            next page</li>
                                    </ol>
                                </div>
                                <form class="position-relative row" action="DispatchServlet" method="post">

                                    <div class="mb-3 col-6">
                                        <label for="txtEmail" class="form-label">Email:</label>
                                        <input type="email" class="form-control" id="txtEmail" name="email"
                                            placeholder="example@gmail.com">
                                    </div>

                                    <div>
                                        <p class="text-secondary">Enter the registered email address . Then we'll
                                            email a OTP to this address.
                                        </p>
                                    </div>
                                    <div class="mb-3">
                                        <button class="btn btn-primary" type="submit" name="btnAction"
                                            value="forgot">Get New
                                            Password
                                        </button>
                                        <button class="btn btn-outline-primary" type="submit" name="btnAction"
                                            value="Login">Back to
                                            Login
                                        </button>
                                    </div>
                                    <p class="text-danger">${message}</p>
                                </form>
                            </div>
                            <div class="col-3">
                                <%@include file="assets/forgotpass.svg" %>
                            </div>
                        </div>
                    </div>
                    <%@include file="Layout/Footer.jsp" %>
            </body>

        </html>