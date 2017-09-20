<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <s:head/>
        <link rel="stylesheet" type="text/css" href="../css/main.css">
        <title>Add candidate</title>
    </head>
    <body>
    <header><h1>Welcome to Movies</h1></header>
    <div class="content">
        <nav>
            <s:a href="../index.jsp">Return to index</s:a>
            </nav>
            <main>
                <h1>Register candidate</h1>
                <h1><s:property value="flashMessage"/></h1>
            <s:form action="addCandidate" class="com.movies.controller.CandidateAction">
                <s:textfield name="userName"  label="username" />
                <s:textfield name="passWord" type="password" label="password" />
                <s:textfield name="passWordConf" type="password" label="repeat password" />
                <s:textfield name="email" label="Email" />
                <s:submit label="submit" />
            </s:form>
        </main>
    </div>
    <footer>
      All rights reserved (CC)
        <br>
        
Contact the bharani
        <br>
        Mapa Web
    </footer>
</body>
</html>