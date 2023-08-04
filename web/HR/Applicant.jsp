<%-- 
    Document   : Applicant
    Created on : Jun 12, 2023, 8:14:56 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%
            Object user = session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("/HRManagement");
            }
        %>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#82cfef10]"
                     style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"
                     >
                    <h1 class="text-center text-3xl font-bold mb-10">List Applicant</h1>
                    <form 
                        action="MainController" 
                        class="w-fit font-medium flex gap-2 rounded-xl bg-[#9BABB850] overflow-hidden p-[6px] ml-auto mb-5" id="btn-mode"
                        style="box-shadow: rgba(0, 0, 0, 0.1) 0px 25px 50px -10px, rgba(0, 0, 0, 0.15) 0px 15px 30px -15px, rgba(0, 0, 0, 0.25) 0px -1px 3px 0px inset;"
                        >
                    </form>
                    <style>
                        tr[data-applicant-id] + tr {
                            display: none;
                        }

                    </style>
                    <script>
                        function addInputRow(row) {
                            const inputRow = row.nextElementSibling;
                            if (inputRow.style.display === 'none') {
                                inputRow.style.display = 'table-row';
                            } else {
                                inputRow.style.display = 'none';
                            }
                        }

                    </script>

                    <c:set var="resultPending" value="${requestScope.LIST_PENDING_APPLICANT}" />
                    <c:if test="${not empty resultPending}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Name</th>
                                    <th class="px-3 py-2 text-start">Gender</th>
                                    <th class="px-3 py-2 text-start">Email</th>
                                    <th class="px-3 py-2 text-start">Phone</th>
                                    <th class="px-3 py-2 text-start">Position</th>
                                    <th class="px-3 py-2 text-start">Interview Date</th>
                                    <th class="px-3 py-2 text-start">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${resultPending}" varStatus="loop">
                                <form action="UpdateApplicantServlet">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]" data-applicant-id="${dto.applicantID}" onclick="addInputRow(this)"">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${loop.count}.</td>
                                        <td class="px-3 py-3">
                                            ${dto.name}
                                             <input type="hidden" name="txtName" value="${dto.name}">
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            <c:if test="${dto.gender}">
                                                Male
                                            </c:if>
                                            <c:if test="${!dto.gender}">
                                                Female
                                            </c:if>
                                        </td>
                                        <td class="px-3 py-3">${dto.email}</td>
                                        <td class="px-3 py-3">${dto.phoneNumber}</td>
                                        <td class="px-3 py-3">
                                            ${dto.jobTitle}
                                              <input type="hidden" name="txtJobTitle" value="${dto.jobTitle}">
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.interviewDate}
                                            <c:if test="${empty dto.interviewDate}">
                                                Not Set
                                            </c:if>
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            <input type="hidden" name="applicantID" value="${dto.applicantID}">
                                            <button>
                                                <input type="submit" name="btnAction" value="Reject" class="text-white bg-red-700 rounded-md px-2 py-1 cursor-pointer hover:text-red-700 hover:bg-red-100 border-2 border-red-700 transition-all font-medium" >

                                            </button>
                                            <button>
                                                <input type="submit" name="btnAction" value="Approve" class="text-white bg-[#0d6efd] rounded-md pqx-2 py-1 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] p-2 border-2 border-[#0d6efd] transition-all font-medium">

                                            </button>
                                        </td> 
                                    </tr>
                                    <tr class="hidden" data-applicant-id="${dto.applicantID}">
                                        <td colspan="8">
                                            <input type="date" name="date" class="w-full p-2 border rounded-md" min="${currentDate}" onchange="validateDate(this)">
                                            <button class="bg-blue-500 text-white px-4 py-2 rounded-md ml-2">
                                                <input type="submit" name="btnAction" value="Set" >
                                            </button>
                                        </td>
                                    </tr>

                                    <script>
                                        // Lấy ngày hiện tại
                                        const currentDate = new Date().toISOString().split('T')[0];
                                    </script>
                                    <script>
                                        function validateDate(input) {
                                            const selectedDate = new Date(input.value);
                                            const currentDate = new Date();

                                            if (selectedDate < currentDate) {
                                                alert("Please choose the correct date.");
                                                input.value = '';
                                            }
                                        }
                                    </script>


                                </form>
                            </c:forEach>
                        </c:if>

                        <c:set var="resultPassed" value="${requestScope.LIST_PASSED_APPLICANT}" />
                        <c:if test="${not empty resultPassed}">
                            <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                                <thead>
                                    <tr class="text-[#464646] text-lg font-semibold">
                                        <th class="px-3 py-2 text-start">No</th>
                                        <th class="px-3 py-2 text-start">Name</th>
                                        <th class="px-3 py-2 text-start">Gender</th> 
                                        <th class="px-3 py-2 text-start">Email</th>
                                        <th class="px-3 py-2 text-start">Phone</th>
                                        <th class="px-3 py-2 text-start">Position</th>
                                        <th class="px-3 py-2 text-start">Interview Date</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="dto" items="${resultPassed}" varStatus="loop">               
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3 rounded-l-[0.25rem]">${loop.count}.</td>
                                            <td class="px-3 py-3">${dto.name}</td>
                                            <td class="px-3 py-3 rounded-r-[0.25rem]">
                                                <c:if test="${dto.gender}">
                                                    Male
                                                </c:if>
                                                <c:if test="${!dto.gender}">
                                                    Female
                                                </c:if>
                                            </td> 
                                            <td class="px-3 py-3">${dto.email}</td>
                                            <td class="px-3 py-3">${dto.phoneNumber}</td>
                                            <td class="px-3 py-3">${dto.jobTitle}</td>
                                            <td class="px-3 py-3">
                                                ${dto.interviewDate}
                                                <c:if test="${empty dto.interviewDate}">
                                                    Not Set
                                                </c:if>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </c:if>

                                <c:set var="resultReject" value="${requestScope.LIST_REJECT_APPLICANT}" />
                                <c:if test="${not empty resultReject}">
                                <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                                    <thead>
                                        <tr class="text-[#464646] text-lg font-semibold">
                                            <th class="px-3 py-2 text-start">No</th>
                                            <th class="px-3 py-2 text-start">Name</th>
                                            <th class="px-3 py-2 text-start">Gender</th>
                                            <th class="px-3 py-2 text-start">Email</th>
                                            <th class="px-3 py-2 text-start">Phone</th>
                                            <th class="px-3 py-2 text-start">Position</th>
                                            <th class="px-3 py-2 text-start">Interview Date</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${resultReject}" varStatus="loop">               
                                            <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                                <td class="px-3 py-3 rounded-l-[0.25rem]">${loop.count}.</td>
                                                <td class="px-3 py-3">
                                                    ${dto.name}
                                                </td>
                                                <td class="px-3 py-3">
                                                    <c:if test="${dto.gender}">
                                                        Male
                                                    </c:if>
                                                    <c:if test="${!dto.gender}">
                                                        Female
                                                    </c:if>
                                                </td>
                                                <td class="px-3 py-3">${dto.email}</td>
                                                <td class="px-3 py-3">${dto.phoneNumber}</td>
                                                <td class="px-3 py-3">${dto.jobTitle}</td>
                                                <td class="px-3 py-3">
                                                    ${dto.interviewDate}
                                                    <c:if test="${empty dto.interviewDate}">
                                                        Not Set
                                                    </c:if>
                                                </td>

                                            </tr>                                           
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if> 
                            </div>
                            </div>
                            </section>       

                            <script>
                                let params = new URLSearchParams(new URL(window.location.href).search);
                                let status = params.get("btnAction");
                                if (status === "Pending")
                                    document.getElementById("btn-mode").innerHTML = `
                                    <input type="submit" name="btnAction" value="Pending" class="cursor-pointer w-full p-[6px] px-4 rounded-lg bg-[#0d6efd] text-white"/>
                                    <input type="submit" name="btnAction" value="Passed" class="cursor-pointer w-full p-[6px] px-4 hover:scale-110 transition-all"/>
                                    <input type="submit" name="btnAction" value="Rejected" class="cursor-pointer w-full p-[6px] px-4 hover:scale-110 transition-all"/>
                                `

                                if (status === "Passed")
                                    document.getElementById("btn-mode").innerHTML = `
                                    <input type="submit" name="btnAction" value="Pending" class="cursor-pointer w-full p-[6px] px-4 hover:scale-110 transition-all"/>
                                    <input type="submit" name="btnAction" value="Passed" class="cursor-pointer w-full p-[6px] px-4 bg-[#00c851] rounded-lg text-white"/>
                                    <input type="submit" name="btnAction" value="Rejected" class="cursor-pointer w-full p-[6px] px-4 hover:scale-110 transition-all"/>
                                `

                                if (status === "Rejected")
                                    document.getElementById("btn-mode").innerHTML = `
                                    <input type="submit" name="btnAction" value="Pending" class="cursor-pointer w-full p-[6px] px-4 hover:scale-110 transition-all"/>
                                    <input type="submit" name="btnAction" value="Passed" class="cursor-pointer w-full p-[6px] px-4 hover:scale-110 transition-all"/>
                                    <input type="submit" name="btnAction" value="Rejected" class="cursor-pointer w-full p-[6px] px-4 rounded-lg bg-[#dc3545] text-white"/>
                                `
                            </script>


                            <%@include file="/Layout/TailwindFooter.jsp" %>
                            </body>
                            </html>
