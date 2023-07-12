<%-- Document : CreateDayLeave Created on : May 31, 2023, 3:26:15 PM Author : ADMIN --%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page contentType="text/html"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Create Page</title>
		<%@include file="../Layout/TailwindHead.jsp" %>
	</head>

	<body>
		<%@include file="../Layout/Sidebar.jsp" %>
		<section class="w-full p-20 sm:ml-32 flex justify-center">
			<div class="w-full flex justify-center">
				<div
					class="w-1/3 items-center flex flex-col rounded-xl p-5 overflow-hidden relative"
					style="
						box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
							rgba(0, 0, 0, 0.3) 0px 30px 60px -30px,
							rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
					"
				>
					<img
						src="https://kiranworkspace.com/demo/projects/code-snippets/card/profile-card/img/banner.jpg"
						class="w-full h-28 absolute top-0 left-0 -z-[1] -z-[1]"
						alt="background profile"
					/>
					<div class="mt-10 rounded-full"></div>
					<p class="text-2xl text-white font-bold text-center w-full my-2 mb-4">
						Create Application
					</p>

					<c:set var="error1" value="${requestScope.CREATE_DAY_LEAVE_ERROR}" />
					<c:if test="${not empty error1}"> ${error1} </c:if>

					<div
						class="w-full items-center flex flex-col rounded-xl p-5 overflow-hidden relative"
					>
						<div class="w-full">
							<form class="position-relative w-full" action="CreateDayLeaveServlet">
								<div class="mb-3">
									<label for="txtType" class="block mb-2 text-sm font-medium">
										Title</label
									>
									<input
										type="text"
										class="border text-sm rounded-lg block w-full p-2.5 border-gray-600 placeholder-gray-400 ring-blue-500 focus:border-blue-500"
										id="txtType"
										name="txtTitle"
										placeholder="Enter your title"
									/>
								</div>
								<!--                                <div class="mb-3">
                                                                    <label for="lang-select"
                                                                           class="block mb-2 text-sm font-medium ">Type</label>
                                                                    <select name="txtType" id="lang-select"
                                                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 ">
                                                                        <option selected value="dayleave">Day leave</option>
                                                                    </select>
                                                                </div>-->
								<label for="txtDate" class="block mb-2 text-sm font-medium">
									Date off</label
								>
								<div class="relative max-w-sm">
									<input
										name="date"
										type="date"
										id="datepickerId"
										data-date="${param.date}"
										value=""
										class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
										placeholder="Select date"
									/>
								</div>
								<div class="mb-3">
									<label for="txtDescr" class="block mb-2 text-sm font-medium">
										Description</label
									>
									<textarea
										type="description"
										class="border text-sm rounded-lg block w-full p-2.5 border-gray-600 placeholder-gray-400 ring-blue-500 focus:border-blue-500"
										id="description"
										name="txtDescr"
										placeholder="Enter your description"
									></textarea>
								</div>
								<input
									class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2"
									type="submit"
									name="btnAction"
									value="Create"
								/>
							</form>
							<c:set var="error" value="${requestScope.CREATE_DAY_LEAVE_ERROR}" />
							<c:if test="${not empty error}">
								<p class="text-red-500 h-4">${error}</p>
							</c:if>
                            <c:set var="error" value="${requestScope.EMPTY_ERROR}" />
							<c:if test="${not empty error}">
								<p class="text-red-500 h-4">${error}</p>
							</c:if>
							<c:set var="message" value="${requestScope.CREATE_DAY_LEAVE}" />
							<c:if test="${not empty message}">
								<p class="text-green-500 h-4">${message}</p>
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</section>

		<%@include file="../Layout/TailwindFooter.jsp" %>
		<div id="additional-fields" style="display: none">
			Report Type <input type="text" name="txtTitle" value="" />
		</div>

		<script>
			function showAdditionalFields() {
				var selectElement = document.getElementById('lang-select');
				var additionalFields = document.getElementById('additional-fields');

				if (selectElement.value === 'report') {
					additionalFields.style.display = 'block';
				} else {
					additionalFields.style.display = 'none';
				}
			}
		</script>
	</body>
</html>
