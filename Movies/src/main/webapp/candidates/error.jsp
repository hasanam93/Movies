<%-- 
    Document   : error
    Created on : Apr 16, 2014, 1:39:31 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/main.css">
        <title>Movies - Candidates Error</title>
    </head>
    <body>
        <header><h1>Welcome to movies</h1></header>
        <div class="content">
            <nav>
                <s:if test="#session.role=='candidate'">
                   menu of candidates<br>
                you are welcome <strong><s:property value="#session.userName"/></strong>
                    <ul>
                        <li><s:a href="../index.jsp">Return to index</s:a></li>
                        <li><s:url id="viewURL" action="viewProfile" namespace="/profiles">
                                <s:param name="id" value="%{#session.id}"></s:param>
                            </s:url>
                            <s:a href="%{viewURL}">View Profile</s:a></li>
                        <li><s:url id="viewURL" action="viewCandidate" namespace="/candidates">
                                <s:param name="id" value="%{#session.id}"></s:param>
                            </s:url>
                            <s:a href="%{viewURL}">View Candidate</s:a></li>
                        <li><a href="<s:url action='LogOutAction' namespace="/"/>">Sign Off</a></li>
                    </ul>
                </s:if>
                <s:elseif test="#session.role=='admin'">
                    <ul>
                        <li><s:a href="../index.jsp">Return to index</s:a></li>
                        <li><a href="<s:url action='listCandidate' namespace="/candidates"/>">List Candidates</a></li>
                       
                    </ul>
                </s:elseif>
                <s:elseif test="#session.role=='company'">
                   business menu<br>
                  you are welcome <strong><s:property value="#session.userName"/></strong>
                    <ul>
                        <li><s:a href="../index.jsp">Return to index</s:a></li>
                                                <li><a href="<s:url action='LogOutAction' namespace="/"/>">Cerrar Sesión</a></li>
                    </ul>

                </s:elseif>
                <s:else>
                    <s:a href="../index.jsp">Return to index</s:a>
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
      
    </footer>
    </body>
</html>
