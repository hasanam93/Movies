<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<html>
    <head>
        <title>Movies</title>
        <sj:head jqueryui="true"/>
        <s:head/>

        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
    <header><h1>Welcome to movies world!</h1></header>
    <div class="content">
    <nav>
        <s:if test="#session.role=='candidate'">
            Candidate menu<br>
    you are welcome <strong><s:property value="#session.userName"/></strong>
            <ul>
            
                <li><s:url id="viewURL" action="viewCandidate" namespace="/candidates">
                        <s:param name="id" value="%{#session.id}"></s:param>
                    </s:url>
                    <s:a href="%{viewURL}">View candidate</s:a></li>
                
                <li><a href="<s:url action='LogOutAction' namespace="/"/>">Sign off</a></li>
            </ul>
        </s:if>
        <s:elseif test="#session.role=='admin'">
            <ul>
                <li><a href="<s:url action='listCandidate' namespace="/candidates"/>">List Candidates</a></li>
                <li><a href="<s:url action='listCompany' namespace="/companies"/>">List companies</a></li>
            </ul>
        </s:elseif>
        <s:elseif test="#session.role=='company'">
           business menu<br>
            you are welcome <strong><s:property value="#session.userName"/></strong>
            <ul>
                <li><s:url id="viewURL" action="viewCompany" namespace="/companies">
                        <s:param name="id" value="%{#session.id}"></s:param>
                    </s:url><s:a href="%{viewURL}">View company</s:a></li>
                <li><a href="<s:url action='addJob' namespace="/jobs"/>">Add job</a></li>
                <li><s:url id="viewURL" action="jobs/listJob">
                        <s:param name="id" value="%{#session.id}"></s:param>
                    </s:url>
                    <s:a href="%{viewURL}">See published work</s:a></li>
                <li><a href="<s:url action='LogOutAction' namespace="/"/>">Sign off</a></li>
            </ul>

        </s:elseif>
        <s:else>
            <span>Welcome movies world</span>
            <br>
            <span>In order to qualify for <strong>select and enjoy </strong> have to  <a href="<s:url action='addCandidate' namespace="/candidate"/>">Regíster first</a></span>
        </s:else>
    </nav>
    <main>
        <h1><s:property value="flashMessage"/></h1>
        <s:if test="#session.role=='company'">
            <s:form action="searchProfile" namespace="/search">
                <s:textfield id="searchForm" name="searchField" label="search profiles"/>
                <s:submit value="Buscar"/>
            </s:form>
        </s:if>
        <s:elseif test="#session.role=='candidate'">
            <div class="search">
            <s:form action="searchJob" namespace="/search">
                <s:textfield id="searchForm" name="searchField" label="search offers" javascriptTooltip="write here" required="true"></s:textfield>
                <s:submit value="search" />
            </s:form>
            <a href="<s:url action='avancedSearchJob' namespace="/search"/>">Advanced search</a>
            </div>
        </s:elseif>
        <s:else>
            <div class="loggin">
              
Login User
                <a href="<s:url action='addCandidate' namespace="/candidates"/>">Sign Up Candidate</a>
                <s:form id="login"  action="LogInActionCandidate" namespace="/" class="com.movies.controller.LoginAction" method="POST">
                    <s:textfield name="userName"  label="Username" required="true"/>
                    <s:password id="candidatePassWord" name="candidatePassWord" type="password" label="password" required="true"/>
                    <s:submit value="submit"/>
                </s:form>
            </div>
            
         
        </s:else>
        
        
    </main>
    </div>
    <footer>
     
All rights reserved (CC)
        <br>
        
Contact the Bharani
        <br>
 
    </footer>
</body>
</html>