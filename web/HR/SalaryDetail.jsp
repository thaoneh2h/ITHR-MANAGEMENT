<%--
    Document   : SalaryDetail
    Created on : Jun 1, 2023, 1:21:01 AM
    Author     : quanb
--%>

<%@page import="model.DTO.SalaryDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!Doctype html>
<html>

    <head>
        <title>Salary Detail</title>
        <%@include file="../Layout/TailwindHead.jsp" %>
    </head>

    <body>
        <%
            if (request.getAttribute("message") != null) {
                out.print("<p>" + request.getAttribute("message") + "</p>");
            }
        %>
        <%@include file="../Layout/Sidebar.jsp" %>
        <section class="w-full ml-64 pb-10 pt-20 sm:ml-32 flex justify-center">

            <div class="w-full flex justify-center align-middle">
                <div class="w-1/3 items-center flex flex-col rounded-xl p-5 overflow-hidden relative"
                     style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
                    <img src="assets/background.png"
                         class="w-full h-60 left-0 -z-[1] -z-[1] absolute top-0" alt="background profile" />

                    <div class="w-fit flex gap-20 my-5">
                        <form action="<c:url value='/SalaryDetailServlet' />">
                            <% SalaryDto salaryDetail = (SalaryDto) request.getAttribute("Salary_DETAIL");%>
                            <div class="w-full h-60"></div>
                            <div class="mb-5 text-center">
                                <h5 class="mb-2 text-3xl font-bold tracking-tight text-gray-900 ">
                                    Salary Detail
                                </h5>
                                <h5 class="text-2xl font-bold tracking-tight text-gray-900 ">
                                    <%= salaryDetail.getEmployee_name()%>
                                </h5>
                            </div>
                            <div class="grid grid-cols-2 justify-center gap-4">
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                          Salary Base
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getSalaryBase()%>
                                        </p>
                                    </div>

                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">

                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Medical Insurance
                                        </h5>

                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getMedicalInsurance()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Accidental Insurance
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getMedicalInsurance()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Social Assurance
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getSocialAssurance()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Tax
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getTax()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 cursor-pointer"
                                     type="button" 
                                     data-modal-target="bonusDetails"
                                     data-modal-toggle="bonusDetails"
                                     id='bonusDetailsButton'
                                     >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Bonus
                                        </h5>
                                        <div class="flex justify-between">
                                            <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                                <%= salaryDetail.getBonus()%>
                                                <input type="text" hidden value="<%= salaryDetail.getBonus()%>" readonly/><br>
                                            </p> 
                                            <!-- <button type="button" data-modal-target="bonusDetails" data-modal-toggle="bonusDetails" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                                                Read more
                                                <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                            </button> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Last Receiver
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getLastReceiver()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Penalty Money
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getPenalty()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 cursor-pointer "    
                                     type="button"    
                                     id="lateForWorkButton"
                                     data-modal-target="lateForWork"
                                     data-modal-toggle="lateForWork"
                                     >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Late for work
                                        </h5>
                                        <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                            <%= salaryDetail.getLateForWorktimes()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 cursor-pointer"
                                     type="button" 
                                     id="absentForWorkButton"
                                     data-modal-target="absentForWork"
                                     data-modal-toggle="absentForWork"
                                     >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Absent for work
                                        </h5>
                                        <div class="flex justify-between">
                                            <p class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                                <%= salaryDetail.getAbsentForWork()%>
                                            </p>    
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="applicationId" value="<%= salaryDetail.getApplication_id()%>" />
                        </form>

                    </div>
                </div>

                <c:out value="${message}"></c:out>
                </div>

            </section>


            <div id="bonusDetails" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative w-full max-w-2xl max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow ">
                        <!-- Modal header -->
                        <div class="flex items-start justify-between p-4 border-b rounded-t ">
                            <h3 class="text-xl font-semibold text-gray-900 ">
                                Bonus Details
                            </h3>
                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-hide="bonusDetails">
                                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->
                        <div class="p-6 space-y-6">
                            <div  class="grid grid-cols-2 justify-center gap-4">
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Bonus Day
                                        </h5>
                                        <p id="bonusDay" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">

                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Bonus Money
                                        </h5>

                                        <p id="bonusMoney" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>

                                </div>
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Total Money
                                        </h5>
                                        <p id="totalMoney" class="mb-3 font-normal text-gray-700 font-bold text-lg">
                                        </p>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!-- Modal footer -->
                        <div class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b ">
                            <button data-modal-hide="bonusDetails" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center   ">OK</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="lateForWork" tabindex="1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative w-full max-w-2xl max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow ">
                        <!-- Modal header -->
                        <div class="flex items-start justify-between p-4 border-b rounded-t ">
                            <h3 class="text-xl font-semibold text-gray-900 ">
                                Late times Details
                            </h3>
                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-hide="lateForWork">
                                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                <span class="sr-only">Close modal</span>
                            </button>

                        </div>
                        <!-- Modal body -->
                        <div class="p-6 space-y-6">
                            <div  class="grid grid-cols-2 justify-center gap-4">
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Late Day
                                        </h5>
                                        <p id="lateDay" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Late Day Penalty
                                        </h5>
                                        <p id="lateDayPenalty" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Total Penalty
                                        </h5>
                                        <p id="totalPenalty" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b ">
                            <button data-modal-hide="lateForWork" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center   ">OK</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="absentForWork" tabindex="1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative w-full max-w-2xl max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow ">
                        <!-- Modal header -->
                        <div class="flex items-start justify-between p-4 border-b rounded-t ">
                            <h3 class="text-xl font-semibold text-gray-900 ">
                                Absent times Details
                            </h3>
                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-hide="absentForWork">
                                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                <span class="sr-only">Close modal</span>
                            </button>

                        </div>
                        <!-- Modal body -->
                        <div class="p-6 space-y-6">
                            <div  class="grid grid-cols-2 justify-center gap-4">
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Absent Day
                                        </h5>
                                        <p id="absentDay" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                                <div class="col-span-1 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Absent Day Penalty
                                        </h5>
                                        <p id="absentDayPenalty" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                                <div class="col-span-2 w-full bg-white border border-gray-200 rounded-lg shadow hover:box-shadow-2xl transition duration-300 ease-in-out transform hover:-translate-y-1 " >
                                    <div class="p-5">
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 ">
                                            Total Penalty
                                        </h5>
                                        <p id="totalPenaltyAbsent" class="mb-3 font-normal text-gray-700 font-bold text-lg"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b ">
                            <button data-modal-hide="absentForWork" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center   ">OK</button>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <script>
                $(document).ready(function () {
                    var dialogInstance1;
                    var dialogInstance2;
                    var dialogInstance3;

                    $('#bonusDetailsButton').click(function () {
                        var applicationId = $('#applicationId').val();
                        $.ajax({
                            type: 'POST',
                            url: 'RetrieveBonusServlet',
                            data: {
                                application_id: applicationId
                            },
                            dataType: 'json',
                            success: function (response) {
                                $('#bonusDay').text(response.bonusDay + " Times");
                                $('#bonusMoney').text(formatCurrency(response.bonusMoney));
                                $('#totalMoney').text(formatCurrency(response.totalMoney));
                            },
                            error: function (xhr, status, error) {
                                console.error(error);
                                alert('Failed to retrieve bonus details.');
                            }
                        });
                    });

                });
                $('#lateForWorkButton').click(function () {
                    var application_id = $(this).val();
                    $.ajax({
                        type: 'POST',
                        url: 'RetrieveLateTimeServlet',
                        data: {
                            application_id: applicationId
                        },
                        dataType: 'json',
                        success: function (response) {
                            $('#lateDay').text(response.lateDay + " Times");
                            $('#lateDayPenalty').text(formatCurrency(response.lateDayPenalty));
                            $('#totalPenalty').text(formatCurrency(response.totalPenalty));
                        },
                        error: function (xhr, status, error) {
                            console.error(error);
                            alert('Failed to retrieve late day details.');
                        }
                    });
                })
                $('#absentForWorkButton').click(function () {
                    var applicationId = $('#applicationId').val();
                    $.ajax({
                        type: 'POST',
                        url: 'RetrieveAbsentTimeServlet',
                        data: {
                            application_id: applicationId
                        },
                        dataType: 'json',
                        success: function (response) {
                            $('#absentDay').text(response.absentDay + " Times");
                            $('#absentDayPenalty').text(formatCurrency(response.absentDayPenalty));
                            $('#totalPenaltyAbsent').text(formatCurrency(response.totalPenaltyAbsent));


                        },
                        error: function (xhr, status, error) {
                            console.error(error);
                            alert('Failed to retrieve absent day details.');
                        }
                    });
                });

                function formatCurrency(amount) {
                    return amount.toLocaleString('vi-VN') + 'VNĐ';
                }

                function formatDay(amount) {
                    return amount.toLocaleString('vi-VN') + 'VNĐ';
                }
            </script>
        <%@include file="../Layout/TailwindFooter.jsp" %>
    </body>

</html>
