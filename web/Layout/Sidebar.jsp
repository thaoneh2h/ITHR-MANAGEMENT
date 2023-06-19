<%-- Document : sidebar Created on : Jun 3, 2023, 3:33:21 PM Author : trong --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="fixed top-0 z-50 w-full border-b bg-gray-800 border-gray-700">
    <div class="px-3 py-3 lg:px-5 lg:pl-3">
        <div class="flex items-center justify-between">
            <div class="flex items-center justify-start">
                <!-- Logo  -->
                <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar"
                        aria-controls="logo-sidebar" type="button"
                        class="inline-flex items-center p-2 text-sm rounded-lg sm:hidden focus:outline-none focus:ring-2 text-gray-400 hover:bg-gray-700 focus:ring-gray-600">
                    <span class="sr-only">Open sidebar</span>
                    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path clip-rule="evenodd" fill-rule="evenodd"
                              d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z">
                        </path>
                    </svg>
                </button>
                <a href="#" class="flex ml-2 md:mr-24">
                    <img src="https://flowbite.com/docs/images/logo.svg" class="h-8 mr-3" alt="FlowBite Logo" />
                    <span
                        class="self-center text-xl font-semibold sm:text-2xl whitespace-nowrap text-white">CounsinTech</span>
                </a>
            </div>
            <div class="flex items-center">
                <div class="flex items-center ml-3">
                    <!-- avatar -->
                    <div>
                        <button type="button"
                                class="flex text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-600"
                                aria-expanded="false" data-dropdown-toggle="dropdown-user">
                            <span class="sr-only">Open user menu</span>
                            <img class="w-8 h-8 rounded-full"
                                 src="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
                                 alt="user photo" />
                        </button>
                    </div>
                    <!-- user dropdown menu -->
                    <div class="z-50 hidden my-4 text-base list-none divide-y rounded shadow bg-gray-700 divide-gray-600"
                         id="dropdown-user">                   

                        <div class="px-4 py-3" role="none">
                            <p class="text-sm text-white" role="none">
                                <c:out value="${user.username}"></c:out>
                                </p>

                            </div>
                            <ul class="py-1" role="none">

                                <li>
                                    <a href="/HRManagement/DispatchServlet?btnAction=newPassword"
                                       class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-600 hover:text-white"
                                       role="menuitem">
                                        Change Password
                                    </a>
                                </li>

                                <!-- <li>
                                    <a href="#"
                                        class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 text-gray-300 hover:bg-gray-600 hover:text-white"
                                        role="menuitem">Settings</a>
                                </li>
                                <li>
                                    <a href="#"
                                        class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 text-gray-300 hover:bg-gray-600 hover:text-white"
                                        role="menuitem">Earnings</a>
                                </li> -->
                                <li>
                                <c:url var="logout" value="DispatchServlet">
                                    <c:param name="btnAction" value="Logout" />
                                </c:url>
                                </a>
                                <a href=" ${logout}"
                                   class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-600 hover:text-white"
                                   role="menuitem">Sign out</a>
                            </li>
                            <li class="nav-item ">
                                <a href="DispatchServlet?btnAction=UserInfo"
                                   class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                    <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                         aria-hidden="true">
                                        <path clip-rule="evenodd" fill-rule="evenodd"
                                              d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                                        </path>
                                        <path clip-rule="evenodd" fill-rule="evenodd"
                                              d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                                        </path>
                                    </svg>

                                    <span class="ml-3">User Info</span>
                                </a>
                            </li>


                            <c:if test="${user!=null}">  
                                <li class="nav-item">

                                </li>  
                            </c:if>


                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- sider -->
<aside id="logo-sidebar"
       class="fixed top-0 left-0 z-40 w-64 h-screen pt-20 transition-transform -translate-x-full border-r sm:translate-x-0 bg-gray-800 border-gray-700"
       aria-label="Sidebar">
    <div class="h-full px-3 pb-4 overflow-y-auto bg-gray-800">
        <!-- sider menu -->
        <ul class="space-y-2 font-medium">
            <li>
                <a href="/HRManagement/Dashboard.jsp"
                   class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                    <svg aria-hidden="true"
                         class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                    </svg>
                    <span class="ml-3">Dashboard</span>
                </a>
            </li>
            <!-- ROLE HR SD -->
            <c:if test="${user != null and user.roleName == 'HR_SD'}">               
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Staff"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path
                                d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                            </path>
                        </svg>
                        <span class="ml-3">Staff list</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowAccountList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
          
<svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path d="M4.5 6.375a4.125 4.125 0 118.25 0 4.125 4.125 0 01-8.25 0zM14.25 8.625a3.375 3.375 0 116.75 0 3.375 3.375 0 01-6.75 0zM1.5 19.125a7.125 7.125 0 0114.25 0v.003l-.001.119a.75.75 0 01-.363.63 13.067 13.067 0 01-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 01-.364-.63l-.001-.122zM17.25 19.128l-.001.144a2.25 2.25 0 01-.233.96 10.088 10.088 0 005.06-1.01.75.75 0 00.42-.643 4.875 4.875 0 00-6.957-4.611 8.586 8.586 0 011.71 5.157v.003z"></path>
</svg>
                        <span class="ml-3">Show Account List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowContractList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg  class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path clip-rule="evenodd" fill-rule="evenodd" d="M17.663 3.118c.225.015.45.032.673.05C19.876 3.298 21 4.604 21 6.109v9.642a3 3 0 01-3 3V16.5c0-5.922-4.576-10.775-10.384-11.217.324-1.132 1.3-2.01 2.548-2.114.224-.019.448-.036.673-.051A3 3 0 0113.5 1.5H15a3 3 0 012.663 1.618zM12 4.5A1.5 1.5 0 0113.5 3H15a1.5 1.5 0 011.5 1.5H12z"></path>
  <path d="M3 8.625c0-1.036.84-1.875 1.875-1.875h.375A3.75 3.75 0 019 10.5v1.875c0 1.036.84 1.875 1.875 1.875h1.875A3.75 3.75 0 0116.5 18v2.625c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 013 20.625v-12z"></path>
  <path d="M10.5 10.5a5.23 5.23 0 00-1.279-3.434 9.768 9.768 0 016.963 6.963 5.23 5.23 0 00-3.434-1.279h-1.875a.375.375 0 01-.375-.375V10.5z"></path>
</svg>
                        <span class="ml-3">Show Contract List</span>
                    </a>
                </li>    

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Timekeeping"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Timekeeping List</span>

                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowOvertimeList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Overtime List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Salary"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M1 4a1 1 0 011-1h16a1 1 0 011 1v8a1 1 0 01-1 1H2a1 1 0 01-1-1V4zm12 4a3 3 0 11-6 0 3 3 0 016 0zM4 9a1 1 0 100-2 1 1 0 000 2zm13-1a1 1 0 11-2 0 1 1 0 012 0zM1.75 14.5a.75.75 0 000 1.5c4.417 0 8.693.603 12.749 1.73 1.111.309 2.251-.512 2.251-1.696v-.784a.75.75 0 00-1.5 0v.784a.272.272 0 01-.35.25A49.043 49.043 0 001.75 14.5z">
                            </path>
                        </svg>
                        <span class="ml-3">Salary list</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=CreateApplication"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                       
<svg  class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path clip-rule="evenodd" fill-rule="evenodd" d="M5.625 1.5H9a3.75 3.75 0 013.75 3.75v1.875c0 1.036.84 1.875 1.875 1.875H16.5a3.75 3.75 0 013.75 3.75v7.875c0 1.035-.84 1.875-1.875 1.875H5.625a1.875 1.875 0 01-1.875-1.875V3.375c0-1.036.84-1.875 1.875-1.875zM12.75 12a.75.75 0 00-1.5 0v2.25H9a.75.75 0 000 1.5h2.25V18a.75.75 0 001.5 0v-2.25H15a.75.75 0 000-1.5h-2.25V12z"></path>
  <path d="M14.25 5.25a5.23 5.23 0 00-1.279-3.434 9.768 9.768 0 016.963 6.963A5.23 5.23 0 0016.5 7.5h-1.875a.375.375 0 01-.375-.375V5.25z"></path>
</svg>
                        <span class="ml-3">Create Application</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Day leave</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Report"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg  class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path clip-rule="evenodd" fill-rule="evenodd" d="M7.502 6h7.128A3.375 3.375 0 0118 9.375v9.375a3 3 0 003-3V6.108c0-1.505-1.125-2.811-2.664-2.94a48.972 48.972 0 00-.673-.05A3 3 0 0015 1.5h-1.5a3 3 0 00-2.663 1.618c-.225.015-.45.032-.673.05C8.662 3.295 7.554 4.542 7.502 6zM13.5 3A1.5 1.5 0 0012 4.5h4.5A1.5 1.5 0 0015 3h-1.5z"></path>
  <path clip-rule="evenodd" fill-rule="evenodd" d="M3 9.375C3 8.339 3.84 7.5 4.875 7.5h9.75c1.036 0 1.875.84 1.875 1.875v11.25c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 013 20.625V9.375zM6 12a.75.75 0 01.75-.75h.008a.75.75 0 01.75.75v.008a.75.75 0 01-.75.75H6.75a.75.75 0 01-.75-.75V12zm2.25 0a.75.75 0 01.75-.75h3.75a.75.75 0 010 1.5H9a.75.75 0 01-.75-.75zM6 15a.75.75 0 01.75-.75h.008a.75.75 0 01.75.75v.008a.75.75 0 01-.75.75H6.75a.75.75 0 01-.75-.75V15zm2.25 0a.75.75 0 01.75-.75h3.75a.75.75 0 010 1.5H9a.75.75 0 01-.75-.75zM6 18a.75.75 0 01.75-.75h.008a.75.75 0 01.75.75v.008a.75.75 0 01-.75.75H6.75a.75.75 0 01-.75-.75V18zm2.25 0a.75.75 0 01.75-.75h3.75a.75.75 0 010 1.5H9a.75.75 0 01-.75-.75z"></path>
</svg>

                        <span class="ml-3">Report</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Sent"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                       <svg  class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path clip-rule="evenodd" fill-rule="evenodd" d="M5.625 1.5H9a3.75 3.75 0 013.75 3.75v1.875c0 1.036.84 1.875 1.875 1.875H16.5a3.75 3.75 0 013.75 3.75v7.875c0 1.035-.84 1.875-1.875 1.875H5.625a1.875 1.875 0 01-1.875-1.875V3.375c0-1.036.84-1.875 1.875-1.875zm6.905 9.97a.75.75 0 00-1.06 0l-3 3a.75.75 0 101.06 1.06l1.72-1.72V18a.75.75 0 001.5 0v-4.19l1.72 1.72a.75.75 0 101.06-1.06l-3-3z"></path>
  <path d="M14.25 5.25a5.23 5.23 0 00-1.279-3.434 9.768 9.768 0 016.963 6.963A5.23 5.23 0 0016.5 7.5h-1.875a.375.375 0 01-.375-.375V5.25z"></path>
</svg>

                        <span class="ml-3">Sent</span>
                    </a>
                </li>                        

                <li class="nav-item ">
                    <a href="MainController?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg  class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <path d="M6.25 6.375a4.125 4.125 0 118.25 0 4.125 4.125 0 01-8.25 0zM3.25 19.125a7.125 7.125 0 0114.25 0v.003l-.001.119a.75.75 0 01-.363.63 13.067 13.067 0 01-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 01-.364-.63l-.001-.122zM19.75 7.5a.75.75 0 00-1.5 0v2.25H16a.75.75 0 000 1.5h2.25v2.25a.75.75 0 001.5 0v-2.25H22a.75.75 0 000-1.5h-2.25V7.5z"></path>
</svg>

                        <span class="ml-3">Applicant</span>
                    </a>
                </li>


<!-- END HR SD -->
            </c:if>





            <c:if test="${user != null and user.roleName == 'STAFF'}">
                <li class="nav-item">
                    <a href="Staff home page.jsp"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                        <svg aria-hidden="true"
                             class="w-6 h-6 transition duration-75 text-gray-400  group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                        </svg>
                        <span class="ml-3">Staff</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="CreateDayLeave.jsp"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                        <svg aria-hidden="true"
                             class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                        </svg>
                        <span class="ml-3">Create</span>
                    </a>
                </li>
            </c:if>


            <!--                    role HR_PM-->

            <c:if test="${user != null and user.roleName == 'HR_PM'}">

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Staff"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path
                                d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                            </path>
                        </svg>
                        <span class="ml-3">Staff list</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowAccountList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Account List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowContractList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Contract List</span>
                    </a>
                </li>    

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Timekeeping"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Timekeeping List</span>

                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowOvertimeList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Overtime List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Salary"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M1 4a1 1 0 011-1h16a1 1 0 011 1v8a1 1 0 01-1 1H2a1 1 0 01-1-1V4zm12 4a3 3 0 11-6 0 3 3 0 016 0zM4 9a1 1 0 100-2 1 1 0 000 2zm13-1a1 1 0 11-2 0 1 1 0 012 0zM1.75 14.5a.75.75 0 000 1.5c4.417 0 8.693.603 12.749 1.73 1.111.309 2.251-.512 2.251-1.696v-.784a.75.75 0 00-1.5 0v.784a.272.272 0 01-.35.25A49.043 49.043 0 001.75 14.5z">
                            </path>
                        </svg>
                        <span class="ml-3">Salary list</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=CreateApplication"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Create Applicant</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Day leave</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Report"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Report</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Sent"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Sent</span>
                    </a>
                </li>                        

                <li class="nav-item ">
                    <a href="MainController?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Applicant</span>
                    </a>
                </li>



            </c:if>

            <!--                    role HR_UI-->

            <c:if test="${user != null and user.roleName == 'HR_UI'}">
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Staff"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path
                                d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                            </path>
                        </svg>
                        <span class="ml-3">Staff list</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowAccountList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Account List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowContractList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M11.35 3.836c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m8.9-4.414c.376.023.75.05 1.124.08 1.131.094 1.976 1.057 1.976 2.192V16.5A2.25 2.25 0 0118 18.75h-2.25m-7.5-10.5H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V18.75m-7.5-10.5h6.375c.621 0 1.125.504 1.125 1.125v9.375m-8.25-3l1.5 1.5 3-3.75"></path>
                        </svg>
                        <span class="ml-3">Show Contract List</span>
                    </a>
                </li>    

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Timekeeping"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Timekeeping List</span>

                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowOvertimeList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Overtime List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Salary"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M1 4a1 1 0 011-1h16a1 1 0 011 1v8a1 1 0 01-1 1H2a1 1 0 01-1-1V4zm12 4a3 3 0 11-6 0 3 3 0 016 0zM4 9a1 1 0 100-2 1 1 0 000 2zm13-1a1 1 0 11-2 0 1 1 0 012 0zM1.75 14.5a.75.75 0 000 1.5c4.417 0 8.693.603 12.749 1.73 1.111.309 2.251-.512 2.251-1.696v-.784a.75.75 0 00-1.5 0v.784a.272.272 0 01-.35.25A49.043 49.043 0 001.75 14.5z">
                            </path>
                        </svg>
                        <span class="ml-3">Salary list</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=CreateApplication"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z"></path>
                        </svg>

                        <span class="ml-3">Create Application</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Day leave</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Report"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.375 19.5h17.25m-17.25 0a1.125 1.125 0 01-1.125-1.125M3.375 19.5h7.5c.621 0 1.125-.504 1.125-1.125m-9.75 0V5.625m0 12.75v-1.5c0-.621.504-1.125 1.125-1.125m18.375 2.625V5.625m0 12.75c0 .621-.504 1.125-1.125 1.125m1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125m0 3.75h-7.5A1.125 1.125 0 0112 18.375m9.75-12.75c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125m19.5 0v1.5c0 .621-.504 1.125-1.125 1.125M2.25 5.625v1.5c0 .621.504 1.125 1.125 1.125m0 0h17.25m-17.25 0h7.5c.621 0 1.125.504 1.125 1.125M3.375 8.25c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125m17.25-3.75h-7.5c-.621 0-1.125.504-1.125 1.125m8.625-1.125c.621 0 1.125.504 1.125 1.125v1.5c0 .621-.504 1.125-1.125 1.125m-17.25 0h7.5m-7.5 0c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125M12 10.875v-1.5m0 1.5c0 .621-.504 1.125-1.125 1.125M12 10.875c0 .621.504 1.125 1.125 1.125m-2.25 0c.621 0 1.125.504 1.125 1.125M13.125 12h7.5m-7.5 0c-.621 0-1.125.504-1.125 1.125M20.625 12c.621 0 1.125.504 1.125 1.125v1.5c0 .621-.504 1.125-1.125 1.125m-17.25 0h7.5M12 14.625v-1.5m0 1.5c0 .621-.504 1.125-1.125 1.125M12 14.625c0 .621.504 1.125 1.125 1.125m-2.25 0c.621 0 1.125.504 1.125 1.125m0 1.5v-1.5m0 0c0-.621.504-1.125 1.125-1.125m0 0h7.5"></path>
                        </svg>

                        <span class="ml-3">Report</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Sent"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"></path>
                        </svg>

                        <span class="ml-3">Sent</span>
                    </a>
                </li>                        

                <li class="nav-item ">
                    <a href="MainController?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zM4 19.235v-.11a6.375 6.375 0 0112.75 0v.109A12.318 12.318 0 0110.374 21c-2.331 0-4.512-.645-6.374-1.766z"></path>
                        </svg>

                        <span class="ml-3">Applicant</span>
                    </a>
                </li>


            </c:if>


            <!--role HR_SM-->

            <c:if test="${user != null and user.roleName == 'HR_SM'}">

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Staff"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path
                                d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                            </path>
                        </svg>
                        <span class="ml-3">Staff list</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowAccountList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Account List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowContractList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Contract List</span>
                    </a>
                </li>    

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Timekeeping"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Timekeeping List</span>

                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowOvertimeList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Overtime List</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Salary"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M1 4a1 1 0 011-1h16a1 1 0 011 1v8a1 1 0 01-1 1H2a1 1 0 01-1-1V4zm12 4a3 3 0 11-6 0 3 3 0 016 0zM4 9a1 1 0 100-2 1 1 0 000 2zm13-1a1 1 0 11-2 0 1 1 0 012 0zM1.75 14.5a.75.75 0 000 1.5c4.417 0 8.693.603 12.749 1.73 1.111.309 2.251-.512 2.251-1.696v-.784a.75.75 0 00-1.5 0v.784a.272.272 0 01-.35.25A49.043 49.043 0 001.75 14.5z">
                            </path>
                        </svg>
                        <span class="ml-3">Salary list</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=CreateApplication"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Create Applicant</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Day leave</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Report"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Report</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Sent"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Sent</span>
                    </a>
                </li>                        

                <li class="nav-item ">
                    <a href="MainController?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Applicant</span>
                    </a>
                </li>




            </c:if>

            <!--role STAFF-->

            <c:if test="${user != null and user.roleName == 'STAFF'}">
                <li class="nav-item">
                    <a href="Staff home page.jsp"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                        <svg aria-hidden="true"
                             class="w-6 h-6 transition duration-75 text-gray-400  group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                        </svg>
                        <span class="ml-3">Staff</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="CreateDayLeave.jsp"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                        <svg aria-hidden="true"
                             class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                        </svg>
                        <span class="ml-3">Create</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Sent"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Sent</span>
                    </a>
                </li>


            </c:if>

        </ul>

    </div>

</aside>