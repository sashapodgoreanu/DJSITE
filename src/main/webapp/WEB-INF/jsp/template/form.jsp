<%-- 
    Document   : form
    Created on : 31-mag-2015, 23.35.35
    Author     : SashaAlexandru
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()" var="isAuthenticated" />
<s:url value ="/logout" var="logout" scope="application"/>

<c:choose>
    <c:when test="${param.type == 'biglogin'}">
        <div class="panel panel-default">
            <div class="panel-body">
                <c:choose>
                    <c:when test="${!isAuthenticated}">
                        
                        <!-- I will send to Spring security username and password to authenticate -->
                        
                        <form id="login-form" class="form-horizontal" action='${login}' method="POST">
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" name  ="email" class="form-control" id="inputEmail" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">Login</label>
                                <div class="col-sm-10">
                                    <input id = "username" name = "username" class="form-control" placeholder="Login">
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
                            <div class="text-divider"><em></em><span></span></div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <div class=" col-sm-5 col-sm-offset-1">
                                        <button type="submit" class="btn btn-default">Google(TODO)</button>
                                    </div>
                                    <div class="col-sm-5 col-sm-offset-1">
                                        <button type="submit" class="btn btn-default">Dropbox(TODO)</button>
                                    </div>
                                </div>
                            </div>
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
    <c:when test="${param.type == 'smalllogin' && isAuthenticated && userDetails != null}">
        <span>
            <img src="${userDetails.image.url}" alt="..." class="img-circle">
        </span>
        <span>
            <div class="dropdown" style="display : inline;">
                <a id="dropUserDetails" data-target="#" href="#" class="dropdown-toggle no-hover" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                    ${userDetails.emails[0].value}
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropUserDetails">
                    <li role="presentation"><a href="${logout}">Logout</a></li>
                    <li role="presentation"><a href="#">Settings</a></li>
                    <li role="presentation"><a href="#">Another Action</a></li>
                    <li role="presentation"><a href="#">ETC</a></li>
                </ul>
            </div>      
        </span>
    </c:when>
</c:choose>
<a href="${logout}">Logout</a>
