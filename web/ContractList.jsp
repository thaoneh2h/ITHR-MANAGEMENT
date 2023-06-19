<%-- 
    Document   : ContractList
    Created on : Jun 6, 2023, 8:08:27 AM
    Author     : 23030
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"
                >
                    <h1 class="text-center text-3xl font-bold mb-10">List of Employee's Contract</h1>
                    <c:set var="result" value="${requestScope.LIST_CONTRACT}"/>
                    <c:if test="${not empty result}">            
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Employee's Contract ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
            <!--                        <th class="px-3 py-2 text-start">Salary ID</th>
                                    <th class="px-3 py-2 text-start">Welfare ID</th>-->
                                    <th class="px-3 py-2 text-start">Sign Date</th>
                                    <th class="px-3 py-2 text-start">Expire Date</th>
                                    <th class="px-3 py-2 text-start">Inspire Date</th>
            <!--                        <th>Medical Insurance</th>
                                    <th>Accidental Insurance</th>
                                    <th>Social Insurance</th>-->
            <!--                        <th>Tax</th>
                                    <th>Penalty</th>
                                    <th>Bonus</th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}" varStatus="loop">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">
                                            ${loop.count}   
                                        </td>
                                        <td class="px-3 py-3">
                                            <c:url var="ContractDetail" value="DispatchServlet">
                                            <c:param name="btnAction" value="ContractDetail" />
                                            <c:param name="employee_contractID" value="${dto.employee_contractID}"/>
                                            </c:url>
                                            <a href="${ContractDetail}" class="border-black hover:border-b-2 text-black"> ${dto.employee_contractID}</a>
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employee_name}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.signDate}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.expDate}
                                        </td>   
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            ${dto.inspireDate}
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
