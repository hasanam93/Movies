<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>movies</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css">
    </head>
    <body>
    <header><h1>welcome to movies!</h1></header>
    <div class="content">
        <nav><s:if test="#session.role=='candidate'">
             menu of candidates<br>
            you are welcome <strong><s:property value="#session.userName"/></strong>
                <ul>
                    <li><s:a href="../index.jsp">return to index</s:a></li>
                    <li><s:url id="viewURL" action="viewProfile" namespace="/profiles">
                            <s:param name="id" value="%{#session.id}"></s:param>
                        </s:url>
                        
                       
                    <li><a href="<s:url action='LogOutAction' namespace="/"/>">log out</a></li>
                </ul>
            </s:if>
            <s:elseif test="#session.role=='admin'">
                <ul>
                    <li><a href="<s:url action='listCandidate' namespace="/candidates"/>">list candidates</a></li>
                   
                </ul>
            </s:elseif>
          
            <s:else>
                <s:a href="../index.jsp">return to index</s:a>
            </s:else>
        </nav>
        <main>
            <h1><s:property value="flashMessage"/></h1>
            <h1>list candidate info</h1>
            <table>
                <tr>
                    <th>UserName</th>
                    <th>Email</th>
                    <th>created</th>
                    <th>modified</th>
                    <th>last access</th>
                    <th>actions</th>
                </tr>
                <tr><s:push value="model">
                        <td><s:property value="userName" /></td>
                        <td><s:property value="email" /></td>
                        <td><s:date name="created" format="dd/MM/yyyy"/></td>
                        <td><s:date name="modified" format="dd/MM/yyyy"/></td>
                        <td><s:date name="lastLogin" format="dd/MM/yyyy/ 'a las' hh:mm:ss a"/></td>
                        <td>
                            <s:url id="editURL" action="editCandidate">
                                <s:param name="id" value="%{id}"></s:param>
                            </s:url>
                            <s:a href="%{editURL}">Edit</s:a>
                            <s:url id="deleteURL" action="deleteCandidate">
                                <s:param name="id" value="%{id}"></s:param>
                            </s:url>
                            <s:a href="%{deleteURL}">delete</s:a>
                            </td>
                    </s:push>
                </tr>
            </table>
         
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
