

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header position-fixed w-100 ">
    <div class=" navbar navbar-expand-lg nav-light ">
        <div class="container-fluid">
            <div class="navbar-brand ms-5"><a href="Home page.jsp">
                    <img width="60" alt="logo" class="logo" src="assets/logo.png"></a></div>
            <ul class="nav p-2 justify-content-end gap-2">                          
                <c:if test="${user != null and user.roleName == 'HR_SD'}">
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Staff">Staff list</a>
                    </li>      
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=CreateApplication">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Pending">Day Leave</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Sent">Sent</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=UserInfo">User info</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Report">Report</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="MainController?btnAction=Pending">Applicant</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=ShowAccountList">Show Account
                            List</a>
                    </li>
                </c:if>
                <c:if test="${user != null and user.roleName == 'HR_PM'}">
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Staff">Staff list</a>
                    </li>      
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=CreateApplication">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Pending">Day Leave</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Sent">Sent</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=UserInfo">User info</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Report">Report</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="MainController?btnAction=Pending">Applicant</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=ShowAccountList">Show Account
                            List</a>
                    </li>
                </c:if>
                <c:if test="${user != null and user.roleName == 'HR_UI'}">
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Staff">Staff list</a>
                    </li>      
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=CreateApplication">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Pending">Day Leave</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Sent">Sent</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=UserInfo">User info</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Report">Report</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="MainController?btnAction=Pending">Applicant</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=ShowAccountList">Show Account
                            List</a>
                    </li>
                </c:if>
                <c:if test="${user != null and user.roleName == 'HR_SM'}">
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Staff">Staff list</a>
                    </li>      
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=CreateApplication">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Pending">Day Leave</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Sent">Sent</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=UserInfo">User info</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=Report">Report</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="MainController?btnAction=Pending">Applicant</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="DispatchServlet?btnAction=ShowAccountList">Show Account
                            List</a>
                    </li>
                </c:if>

                <c:if test="${user != null and user.roleName == 'STAFF'}">
                    <li class="nav-item">
                        <a class="nav-link p-2" href="Staff home page.jsp" />
                        Staff
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-2" href="CreateDayLeave.jsp">Create</a>
                    </li>
                </c:if>

                <c:if test="${user == null}">
                    <!--Neu user chua login-->
                    <li class="nav-item">
                        <a href="Login page.jsp">
                            <button class="btn btn-primary">
                                Login
                            </button>
                        </a>
                    </li>
                </c:if>
                <c:if test="${user!=null}">
                    <li class="nav-item">
                        <c:url var="logout" value="DispatchServlet">
                            <c:param name="btnAction" value="Logout" />
                        </c:url>
                        <a class="btn btn-danger" href="${logout}">
                            Logout
                        </a>
                    </li>

                </c:if>

            </ul>
        </div>
    </div>
</div>
