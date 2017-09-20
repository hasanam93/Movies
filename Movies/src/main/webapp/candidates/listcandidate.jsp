<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>movies</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css">
    </head>
    <body>
        <s:a href="../index.jsp">Return to index</s:a>
        <h1><s:property value="flashMessage"/></h1>
        <h1>List Candidates</h1>
        <table>
            <tr>
                <th>UserName</th>
                <th>Email</th>
                <th>created</th>
                <th>modified</th>
                <th>see</th>
                <th>edit</th>
                <th>remove</th>
            </tr>
            <s:iterator value="listCandidate" status="candidateStatus">
                <tr>
                    <td><s:property value="userName" /></td>
                    <td><s:property value="email" /></td>
                    <td><s:date name="created" format="dd/MM/yyyy"/></td>
                    <td><s:date name="modified" format="dd/MM/yyyy"/></td>
                    <td>
                        <s:url id="viewURL" action="viewCandidate">
                            <s:param name="id" value="%{id}"></s:param>
                        </s:url>
                        <s:a href="%{viewURL}">see</s:a>
                        </td>
                        <td>
                        <s:url id="editURL" action="editCandidate">
                            <s:param name="id" value="%{id}"></s:param>
                        </s:url>
                        <s:a href="%{editURL}">Edit</s:a>
                        </td>
                        <td>
                        <s:url id="deleteURL" action="deleteCandidate">
                            <s:param name="id" value="%{id}"></s:param>
                        </s:url>
                        <s:a href="%{deleteURL}">remove</s:a>
                        </td>
                    </tr>
            </s:iterator>
        </table>
    </body>
</html>
