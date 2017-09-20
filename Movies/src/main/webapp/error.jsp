<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>movies - Error Login</title>
    </head>
    <header><h1>Welcome to Movies!</h1></header>
    <div class="content">
        <nav>
            <s:if test="#session.role=='candidate'">
                menu of candidates<br>
               you are welcome<strong><s:property value="#session.userName"/></strong>
                <ul>
                    <li><s:url id="viewURL" action="viewProfile" namespace="/profiles">
                            <s:param name="id" value="%{#session.id}"></s:param>
                        </s:url>
                        <s:a href="%{viewURL}">View profile</s:a></li>
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
          
                </ul>
            </s:elseif>
           
            <s:else>
                <s:a href="index.jsp">
Return to index</s:a>
            </s:else>
        </nav>
        <main>
            <h1><s:property value="flashMessage"/></h1>
        </main>
    </div>
    <footer>
      All rights reserved (CC)
        <br>
        
Contact the bharani
        <br>
        Mapa Web
    </footer>
</html>
