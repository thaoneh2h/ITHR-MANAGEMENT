<%-- 
    Document   : UserTimekeepingMonth
    Created on : Jun 25, 2023, 7:05:34 PM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <% 
            Object user=session.getAttribute("user"); if (user==null) {
            response.sendRedirect("/HRManagement"); } 
        %>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#82cfef10] w-2/3 mx-auto"
                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"
                >
                    <h1 class="text-center text-3xl font-bold mb-10">Your Timekeeping</h1>
                    <c:set var="result" value="${requestScope.USER_TIMEKEEPING_MONTH}"/>
                    <!--<form action="DispatchServlet">
                        <select name="Month" onchange="toggleButton(this)" class="rounded-md p-1 cursor-pointer" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                            <option value="" disabled selected>Select A Month</option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">August</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                        <input type="submit" value="UserSearchMonth" name="btnAction" id="myButton" disabled 
                            class="text-white bg-[#0d6efd] rounded-md px-2 py-[2px] cursor-pointer hover:text-[#0d6efd] 
                            hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium ml-1" 
                        />
                        <script>
                            function toggleButton(selectElement) {
                                var button = document.getElementById("myButton");
                                if (selectElement.value === "") {
                                    button.disabled = true; // Disable the button if the placeholder option is selected
                                } else {
                                    button.disabled = false; // Enable the button for other selected options
                                }
                            }
                        </script>

                    </form> -->
                       <form id="searchForm" action="DispatchServlet?btnAction=UserSearchMonth" method="post">
                        <div class="relative max-w-sm">
                            <input name="Month" onchange="submitForm()" type="month" id="datepickerId" data-date="${param.Month}" value="${param.Month}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " placeholder="Select date">
                        </div>
                    </form>
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Date</th>
                                    <th class="px-3 py-2 text-start">Time In</th>
                                    <th class="px-3 py-2 text-start">Time Out</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">

                                            ${dto.employee_id}

                                        </td>

                                        <td class="px-3 py-3">
                                            ${dto.employee_name}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.date}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.timekiN}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.timeOut}
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            ${dto.status}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </c:if>
                    <c:if test="${empty result}">
                        <div class="text-red-400 mx-auto justify-center items-center flex flex-col pt-10">
                            <p class="text-lg">Empty</p>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z" />
                            </svg>
                        </div> 
                    </c:if>
                </div>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
         <script>

            function submitForm() {
                document.getElementById("searchForm").submit();
            }
        </script>
    </body>
</html>
