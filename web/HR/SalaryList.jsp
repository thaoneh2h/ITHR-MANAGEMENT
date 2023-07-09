<%-- 
    Document   : SalaryList
    Created on : Jun 1, 2023, 3:05:22 PM
    Author     : quanb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <%@include file="../Layout/TailwindHead.jsp" %>
    </head>

    <body>
        <%@include file="../Layout/Sidebar.jsp" %>
        <section class="p-16 sm:ml-64">
            <div class="p-10 mt-14 rounded-lg bg-[#82cfef10] salary-list "
                 style="box-shadow: rgba(50, 50, 93, 0.35) 0px 50px 50px -20px, rgba(0, 0, 0, 0.4) 0px 30px 30px -30px, rgba(10, 37, 64, 0.45) 0px -2px 6px 0px inset;">
                <p class="text-center text-3xl font-bold mb-10">List of Salary</p>
                <form id="searchForm" action="SalaryListServlet" method="post">
                    <div class="relative max-w-sm">
                        <input name="date" onchange="submitForm()" type="month"  id="datepickerId" data-date="${param.date}" value="${param.date}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " placeholder="Select date">
                    </div>
                </form>
                <table id="salaryTable" class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                    <tr>
                        <th class="px-3 py-2 text-start">NO.</th>
                        <th class="px-3 py-2 text-start">Name.</th>
                        <th class="px-3 py-2 text-start cursor-pointer" onclick="sortTable()" title="Click here to sort">Salary Amount <span id="sortIndicator">&#x25B2;</span> </th>
                        <th class="px-3 py-2 text-start">Bonus</th>
                        <th class="px-3 py-2 text-start">Penalty</th>
                        <th class="px-3 py-2 text-start">Actions</th>
                    </tr>
                  
                    <c:forEach var="salary" items="${list}" varStatus="loop">
                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                            <td class="px-3 py-3 rounded-l-[0.25rem]">
                                ${loop.count}
                            </td>
                            <td class="px-3 py-3">
                                ${salary.employee_name}
                            </td>
                            <td class="px-3 py-3">
                                ${salary.getSalaryBase()}
                            </td>
                            <td class="px-3 py-3">
                                ${salary.bonus}
                            </td>
                            <td class="px-3 py-3">
                                ${salary.penalty}
                            </td>
                            <td>
                                  <a class="px-3 py-3 text-blue-400" href="<c:url value="/SalaryDetailServlet" />?report_id=${salary.application_id}">Details</a>  
                            </td>
                        </tr>
                    </c:forEach>
                    
                </table>
                  <c:if test="${empty list}">
                          <div class="text-red-400 mx-auto justify-center items-center flex flex-col pt-10">
                            <p class="text-lg">Empty list</p>
                            <svg  fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z" />
                            </svg>
                        </div>
                    </c:if>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
        <script>

            function submitForm() {
                document.getElementById("searchForm").submit();
            }
        </script>
        <script>
            var sortDirection = "asc";

            function sortTable() {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("salaryTable");
                switching = true;

                while (switching) {
                    switching = false;
                    rows = table.getElementsByTagName("tr");

                    for (i = 1; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = parseFloat(rows[i].getElementsByTagName("td")[1].textContent);
                        y = parseFloat(rows[i + 1].getElementsByTagName("td")[1].textContent);

                        if (sortDirection === "asc") {
                            if (x > y) {
                                shouldSwitch = true;
                                break;
                            }
                        } else {
                            if (x < y) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }

                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
                sortDirection = sortDirection === "asc" ? "desc" : "asc";
                sortIndicator.innerHTML = sortDirection === "asc" ? "&#x25B2;" : "&#x25BC;";
            }
        </script>

    </body>

</html>




