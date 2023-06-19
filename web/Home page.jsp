<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <div class="col image">
                        <%@include file="assets/career.svg" %>
                    </div>
                    <div class="col card careers-table" data-aos="fade-left">
                        <div class="m-4">
                            <p class="text-center h2 fw-bold">Careers</p>
                        </div>
                        <table class="table table-striped table-hover rounded">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Quantity</th>
                                    <th>Base Salary</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tuyển DEV</td>
                                    <td>Tuyển 12 dev</td>
                                    <td>20</td>
                                    <td>10.000.000 VND</td>                    
                                    <td>
                                        <a href="ApplyForm.jsp">Apply</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tuyển Marketing</td>
                                    <td>Tuyển 5 vị trí</td>
                                    <td>10</td>
                                    <td>5.000.000</td>
                                    <td>
                                        <a href="ApplyForm.jsp">Apply</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tuyển nhân viên vệ sinh</td>
                                    <td>3 vị trí</td>
                                    <td>5</td>
                                    <td>3.000.000</td>
                                    <td>
                                        <a href="ApplyForm.jsp">Apply</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tuyển Front-end</td>
                                    <td>Tuyển 10 vị trí</td>
                                    <td>20</td>
                                    <td>20.000.000</td>
                                    <td>
                                        <a href="ApplyForm.jsp">Apply</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tuyển Quản lí dụ án</td>
                                    <td>Tuyển 3 vị trí</td>
                                    <td>10</td>
                                    <td>50.000.000</td>
                                    <td>
                                        <a href="ApplyForm.jsp">Apply</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
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
                                <input required type="email" class="form-control" id="txtemail" placeholder="name@example.com" />
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone number</label>
                                <input required type="tel" class="form-control" id="phone" placeholder="0912312312" />
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary" id="contactBtn" type="submit" value="submit">Submit</button>
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
                                        <img class="me-3" src="assets/facebook-logo.png" alt="facebook-logo" width="40" />
                                        <span> facebook.com </span>
                                    </a>
                                </div>
                                <div class="mb-3 col">
                                    <a href="#" class="text-decoration-none link-primary">
                                        <img class="me-3" src="assets/gmail-logo.png" alt="facebook-logo" width="40" />
                                        <span> gmail.com </span>
                                    </a>
                                </div>
                            </div>

                            <!----------------------------------------------------------------------------------->
                            <div class="row mb-5">
                                <div class="mb-3 col">
                                    <a href="#" class="text-decoration-none link-primary">
                                        <img class="me-3" src="assets/instagram-logo.png" alt="facebook-logo" width="40" />
                                        <span> instagram.com </span>
                                    </a>
                                </div>
                                <div class="mb-3 col">
                                    <a href="#" class="text-decoration-none link-primary">
                                        <img class="me-3" src="assets/twitter-logo.png" alt="facebook-logo" width="40" />
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
        <script type='text/javascript'>document.addEventListener('DOMContentLoaded', function () {
                window.setTimeout(document.querySelector('svg').classList.add('animated'), 1000);
            })</script>
    </body>

</html>