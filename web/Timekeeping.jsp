<%-- 
    Document   : Timekeeping
    Created on : Jun 10, 2023, 8:18:41 PM
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
                    <h1 class="text-center text-3xl font-bold mb-10">Timekeeping</h1>
                    <c:set var="result" value="${requestScope.TIMEKEEPING_LIST}"/>
                    <c:if test="${not empty result}">
                        
                        <form action="DispatchServlet" class="flex gap-3">
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
                            <input type="submit" value="SearchMonth" name="btnAction" id="myButton" disabled class="text-white bg-[#0d6efd] rounded-md px-2 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium" />
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
                        </form>
                        
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start w-28">Detail</th>
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
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            <c:url var="timekeepingDetail2" value="DispatchServlet">
                                                <c:param name="btnAction" value="timekeepingDetail2" />
                                                <c:param name="employeeName" value="${dto.employee_name}"/>
                                            </c:url>
                                            <a 
                                                href="${timekeepingDetail2}" 
                                                class="rounded-md px-2 py-1 text-white bg-[#0d6efd] hover:scale-105 transition-all"
                                            > 
                                                Detail
                                            </a> 
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </c:if>
                </div>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>
