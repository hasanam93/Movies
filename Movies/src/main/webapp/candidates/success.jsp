<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>movies</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css">
    </head>
    <body>
    <header><h1>welcome to movies</h1></header>
    <div class="content">
        <nav>
            <s:if test="#session.role=='candidate'">
               menu of candidates<br>
              you are welcome <strong><s:property value="#session.userName"/></strong>
                <ul>
                    <li><s:a href="../index.jsp">Return to index</s:a></li>
                  
                    <li><s:url id="viewURL" action="viewCandidate" namespace="/candidates">
                            <s:param name="id" value="%{#session.id}"></s:param>
                        </s:url>
                        <s:a href="%{viewURL}">view candidate</s:a></li>
                    <li><s:url id="viewURL" action="listCandidateInscription" namespace="/inscriptions">
                            <s:param name="id" value="%{#session.id}"></s:param>
                        </s:url>
                        <s:a href="%{viewURL}">view applications</s:a></li>
                    <li><a href="<s:url action='LogOutAction' namespace="/"/>">logut</a></li>
                </ul>
            </s:if>
            <s:elseif test="#session.role=='admin'">
                <ul>
                    <li><s:a href="../index.jsp">return to index</s:a></li>
                    <li><a href="<s:url action='listCandidate' namespace="/candidates"/>">list candidates</a></li>
                   
                </ul>
            </s:elseif>
            <s:elseif test="#session.role=='company'">
               business menu<br>
              you are welcome <strong><s:property value="#session.userName"/></strong>
                <ul>
                    <li><s:a href="../index.jsp">return to index</s:a></li>
                   
                    
                   
                       
                    <li><a href="<s:url action='LogOutAction'/>">LogOut</a></li>
                </ul>

            </s:elseif>
            <s:else>
                <s:a href="../index.jsp">Volver a index</s:a>
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
