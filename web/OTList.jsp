<%-- 
    Document : OTList 
    Created on : May 23, 2023, 7:35:28 PM 
    Author : 23030 
--%>

<%@page import="model.DAO.OvertimeDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body>
        <% 
            String status=request.getParameter("statusWorker"); boolean statusValue=(status !=null &&
            status.equals("false")) ? false : true; session.setAttribute("statusWorker", statusValue);
            Object user=session.getAttribute("user"); if (user==null) {
            response.sendRedirect("/HRManagement"); } 
        %>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#82cfef10]"
                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <p class="text-center text-3xl font-bold mb-10">Overtime List</p>
                    <br>
                    <div class="flex justify-between my-5">
                        <form action="DispatchServlet" class="flex gap-3">
                            <select name="monthparam" onchange="toggleButton(this)" class="rounded-md p-1 cursor-pointer" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
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
                            <input type="submit" value="SearchOTMonth" name="btnAction" id="myButton" disabled class="text-white bg-[#0d6efd] rounded-md px-2 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium"  />
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
                        <div id="toggle-button" for="check"
                            class="bg-white cursor-pointer relative w-[105px] h-10 rounded-full block scale-75 ml-auto"
                            style="box-shadow: rgba(50, 50, 93, 0.35) 0px 50px 100px -20px, rgba(0, 0, 0, 0.4) 0px 30px 60px -30px, rgba(10, 37, 64, 0.45) 0px -2px 6px 0px inset;"
                            onclick="changeStatus()">
                        </div>
                    </div>
                        
                    <c:set var="result" value="${requestScope.OT_LIST}" />
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Department ID</th>
                                    <th class="px-3 py-2 text-start">Role</th>
                                    <th class="px-3 py-2 text-start">Working Status</th>
                                    <th class="px-3 py-2 text-start">Has OverTime</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}" varStatus="loop">
                                    <c:if test="${statusWorker == dto.hasOvertime}">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3 rounded-l-[0.25rem]">
                                                ${loop.count}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employeeId}
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:url var="OTDetail2" value="DispatchServlet">
                                                    <c:param name="btnAction" value="OTDetail2" />
                                                    <c:param name="employee_name"
                                                        value="${dto.employee_name}" />
                                                </c:url>
                                                <a href="${OTDetail2}"
                                                    class="border-black hover:border-b-2 text-black">
                                                    ${dto.employee_name}
                                                </a>
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.department_id}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.role}
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.hasOvertime}">
                                                    <p
                                                        class="text-sm text-[#52c41a] bg-[#f6ffed] border-2 border-[#b7eb8f] rounded-md w-fit py-[1px] px-[17px]">
                                                        Active
                                                    </p>
                                                </c:if>
                                                <c:if test="${!dto.hasOvertime}">
                                                    <p
                                                        class="text-sm text-[#ff4d4f] bg-[#fff2f0] border-2 border-[#ffccc7] rounded-md w-fit py-[1px] px-3">
                                                        Inactive
                                                    </p>
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3 rounded-r-[0.25rem]">
                                                ${dto.workingStatus}
                                            </td>
                                        </tr>
                                    </c:if>

                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
    <script>
        let currentUrl = window.location.href;
        let urlParams = new URLSearchParams(currentUrl);
        let status = urlParams.get("statusWorker") !== "false";

        !status
            ? document.getElementById("toggle-button").innerHTML = `
    <input type="checkbox" id="check" class="sr-only peer" value="true" 
    unchecked/>
    <span for="check" class="w-[32px] h-[32px] bg-gray-500 absolute rounded-full left-1 top-1 peer-checked:bg-green-400
    peer-checked:left-[69px] transition-all duration-500"></span>
    <p class="absolute top-[6px] right-2 z-10 text-black font-medium">Inactive</p>
    `

            : document.getElementById("toggle-button").innerHTML = `
    <input type="checkbox" id="check" class="sr-only peer" value="true" 
    checked/>
    <span for="check" class="w-[32px] h-[32px] bg-gray-500 absolute rounded-full left-1 top-1 peer-checked:bg-green-400
    peer-checked:left-[69px] transition-all duration-500"></span>
    <p class="absolute top-[6px] left-2 z-10 text-black font-medium">Active</p>
    `;

        function changeStatus() {
            window.location.href = "/HRManagement/DispatchServlet?btnAction=ShowOvertimeList&statusWorker=" + !status;
        }
    </script>
</html>