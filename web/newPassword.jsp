<%-- Document : newPassword Created on : May 23, 2023, 8:01:33 PM Author : quanb --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Change password</title>
            <%@include file="Layout/TailwindHead.jsp" %>
        </head>

        <body>
            <%@include file="Layout/Sidebar.jsp" %>
                <section class="pt-16 sm:ml-64">
                    <button onclick="history.back()" class="flex gap-2 items-center py-1 px-3 m-10 text-red-500
                    hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
                        </svg>
                        Back
                    </button>
                    <div class="p-10 rounded-lg flex justify-center">
                        <!-- new UI -->
                        <div class="w-1/3 items-center flex  flex-col rounded-xl p-5 overflow-hidden relative"
                            style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
                            <img src="https://kiranworkspace.com/demo/projects/code-snippets/card/profile-card/img/banner.jpg"
                                class="w-full h-28 absolute top-0 left-0 -z-[1] -z-[1]" alt="background profile" />
                            <div class="p-1 bg-white mt-10 rounded-full">
                                <img src="${dto.photo}" alt="avatar" class="w-28 h-28 rounded-full"
                                    style="box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;" />
                            </div>
                            <p class="text-2xl font-bold text-center w-full my-2 mb-4">
                                ${userSalary.employee_name}
                            </p>
                            <form class="position-relative w-full" action="DispatchServlet" method="POST">
                                <div class="mb-3">
                                    <label for="password" class="block mb-2 text-sm font-medium ">
                                        New Password</label>
                                    <input type="password"
                                        class=" border text-sm rounded-lg block w-full p-2.5  border-gray-600 placeholder-gray-400  ring-blue-500 focus:border-blue-500"
                                        id="password" name="password" placeholder="New Password">
                                </div>

                                <div class="mb-3">
                                    <label for="confPassword" class="block mb-2 text-sm font-medium ">
                                        Confirm Password</label>
                                    <input type="password"
                                        class=" border text-sm rounded-lg  block w-full p-2.5  border-gray-600 placeholder-gray-400 ring-blue-500 focus:border-blue-500"
                                        id="confPassword" name="confPassword" placeholder="Confirm Password">

                                </div>

                                <% if (request.getAttribute("message") !=null) { out.print("<p class=\" text-red-400\">"
                                    + request.getAttribute("message") + "</p>");
                                    }
                                    %>
                                    <div class="mb-4">
                                        <button
                                            class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2"
                                            type="submit" name="btnAction" value="newPassword">
                                            Confirm
                                        </button>
                                    </div>
                            </form>
                        </div>
                        <!-- UI -->

                    </div>
                </section>
                <%@include file="Layout/TailwindFooter.jsp" %>
        </body>


        </html>