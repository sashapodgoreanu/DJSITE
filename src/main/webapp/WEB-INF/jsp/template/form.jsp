<%-- 
    Document   : form
    Created on : 31-mag-2015, 23.35.35
    Author     : SashaAlexandru
--%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAuthenticated()" var="isAuthenticated" />


<c:choose>
    <c:when test="${param.type == 'biglogin'}">
        <div class="panel panel-default">
            <div class="panel-body">
                <c:choose>
                    <c:when test="${!isAuthenticated}">
                        <form id="login-form" class="form-horizontal" action='${login}' method="POST">
                            <input id = "username" type="hidden" name = "username" class="form-control" placeholder="Pick a username">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" name  ="email" class="form-control" id="inputEmail" placeholder="Log in">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input id="password" type="password" name ="password" class="form-control"  placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class=" col-sm-5">
                                        <button type="submit" class="btn btn-default">Login</button>
                                    </div>
                                    <div class="col-sm-5">
                                        <button type="submit" class="btn btn-default">Sign up</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <span id="signinButton">
                                    <span
                                        approval_prompt="auto"
                                        access_type="online "
                                        class="g-signin"
                                        data-callback="signinCallback"
                                        data-clientid="630129138206-mpttf2fj47g6milr9hlf6sfm8gijitue.apps.googleusercontent.com"
                                        data-cookiepolicy="single_host_origin"
                                        data-requestvisibleactions="http://schemas.google.com/AddActivity"
                                        data-scope="https://www.googleapis.com/auth/plus.login 
                                        https://www.googleapis.com/auth/userinfo.email">
                                    </span>
                                </span>
                            </div>
                            <input type ="hidden" name ="useraction"  val ="0">
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form action='${logout}' method="GET">
                            <div>
                                <button type="submit" class="btn btn-default">logout app</button>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:when>
    <c:when test="${param.type == 'smalllogin'}">
        <!-- TODO -->
    </c:when>
    <c:otherwise>is not authenticated</c:otherwise>
</c:choose>
