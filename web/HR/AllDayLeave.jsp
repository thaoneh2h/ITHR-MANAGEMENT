<%-- 
    Document   : newjsp
    Created on : Jun 4, 2023, 8:37:46 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <%@include file="../Layout/TailwindHead.jsp" %>
    </head>

    <body>
        <%@include file="../Layout/Sidebar.jsp" %>
        <section class="w-full p-20 sm:ml-32 flex justify-center">
            <div class="w-full flex justify-center ">
                <div class="m-10 p-10 w-1/2 rounded-lg bg-[#82cfef10]" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <p class="text-center text-3xl font-bold mb-10">List Application Of Day Leave</p>
                    <br>
                    <form action="HRMainController" id="statusForm" class="w-1/4" method="get">
                        <c:set value="${param.btnAction}" var="action"></c:set>
                            <select 
                                onChange="getApplicationByStatus()"
                                id="statusSelected" 
                                name="btnAction" 
                                class=" border text-sm rounded-lg block w-full p-2.5  border-gray-600 placeholder-gray-400  ring-blue-500 focus:border-blue-500"
                                >   
                                <option value="Pending" ${action=="Pending" ? "selected" : ""}>Pending</option>
                            <option value="Approved" ${action=="Approved" ? "selected" : ""}>Approved</option>
                            <option value="Rejected"  ${action=="Rejected" ? "selected" : ""}>Rejected</option>  
                        </select>
                    </form>
                    <!-- Pending list  -->
                    <c:set var="resultPending" value="${requestScope.PENDING_LIST}" />
                    <c:if test="${not empty resultPending}">

                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No.</th>
                                    <th class="px-3 py-2 text-start">Name</th>
                                    <th class="px-3 py-2 text-start">Title</th>
                                    <th class="px-3 py-2 text-start">Description</th>
                                    <th class="px-3 py-2 text-start">Create at</th>
                                    <th class="px-3 py-2 text-start">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="error1" value="${requestScope.APPROVE_DAY_LEAVE_ERROR}"/>
                                <c:if test="${not empty error1}">
                                    ${error1}
                                </c:if>

                                <c:forEach var="dto" items="${resultPending}" varStatus="counter">
                                <form action="DispatchServlet" method="POST">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3">
                                            ${counter.count}.
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employeeName}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.dayleave_title}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.dayleave_description}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.date_created}
                                        </td>  

                                        <td class="px-2 py-3 rounded-r-[0.25rem]">

                                            <input type="hidden" name="dayLeaveId" value="${dto.dayleave_id}">
                                            <input type="hidden" name="dayLeaveDate" value="${dto.date_created}">                                            
                                                <button>
                                                    <input type="submit" name="btnAction" value="Reject" class="text-white bg-red-700 rounded-md px-2 py-1 cursor-pointer hover:text-red-700 hover:bg-red-100 border-2 border-red-700 transition-all font-medium" />
                                                </button>

                                                <button>
                                                    <input type="submit" name="btnAction" value="Approve" class="text-white bg-[#0d6efd] rounded-md pqx-2 py-1 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium"/>
                                                </button>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </c:if>
                   

                    <c:if test="${empty resultPending}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No.</th>
                                    <th class="px-3 py-2 text-start">Name</th>
                                    <th class="px-3 py-2 text-start">Title</th>
                                    <th class="px-3 py-2 text-start">Description</th>
                                    <th class="px-3 py-2 text-start">Create at</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="error1" value="${requestScope.APPROVE_DAY_LEAVE_ERROR}"/>
                                <c:if test="${not empty error1}">
                                    ${error1}
                                </c:if>

                                <!-- Approve list  -->
                                <c:set var="resultApprove" value="${requestScope.APPROVE_LIST}" />
                                <c:if test="${not empty resultApprove}">
                                    <c:forEach var="dto" items="${resultApprove}" varStatus="counter">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3">
                                                ${counter.count}.
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employeeName}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.dayleave_title}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.dayleave_description}
                                            </td>   
                                            <td class="px-3 py-3">
                                                ${dto.date_created}
                                            </td>   

                                            <td class="px-3 py-3">

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <!-- Reject list list  -->
                                <c:set var="resultReject" value="${requestScope.REJECT_LIST}" />
                                <c:if test="${not empty resultReject}">
                                    <c:forEach var="dto" items="${resultReject}" varStatus="counter">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3">
                                                ${counter.count}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employeeName}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.dayleave_title}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.dayleave_description}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.date_created}
                                            </td>  

                                            <td class="px-2 py-3 rounded-r-[0.25rem]">

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>

                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty resultApprove &&  empty resultPending && empty resultReject}">
                        <div class="text-red-400 mx-auto justify-center items-center flex flex-col pt-10">
                            <p class="text-lg">Empty list</p>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z" />
                            </svg>
                        </div> 
                    </c:if>     
                </div>       
            </div>
        </section>


        <%@include file="../Layout/TailwindFooter.jsp" %>
        <div id="additional-fields" style="display: none;">
            Report Type <input type="text" name="txtTitle" value="">
        </div>

        <script>
            let statusForm = document.getElementById("statusForm");
            function getApplicationByStatus() {
                statusForm.submit();
            }
            function showAdditionalFields() {
                var selectElement = document.getElementById("lang-select");
                var additionalFields = document.getElementById("additional-fields");

                if (selectElement.value === "report") {
                    additionalFields.style.display = "block";
                } else {
                    additionalFields.style.display = "none";
                }
            }
        </script>

    </body>
</html>


