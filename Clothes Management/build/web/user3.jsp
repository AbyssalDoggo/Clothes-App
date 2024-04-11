<%-- 
    Document   : user
    Created on : 27-Nov-2023, 19:14:59
    Author     : ADMIN
--%>

<%@page import="sample.object.Cart"%>
<%@page import="java.util.List"%>
<%@page import="sample.object.Clothes"%>
<%@page import="sample.object.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>User Page</title>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 300px;
                margin: auto;
                text-align: center;
                font-family: arial;
            }

            .price {
                color: grey;
                font-size: 22px;
            }

            .card button {
                border: none;
                outline: 0;
                padding: 12px;
                color: white;
                background-color: #000;
                text-align: center;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
            }

            .card button:hover {
                opacity: 0.7;
            }
            .topnav {
                overflow: hidden;
                background-color: #333;
            }

            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            /* Create a right-aligned (split) link inside the navigation bar */
            .topnav a.split {
                float: right;
                background-color: #04AA6D;
                color: white;
            }

            /* Add an active class to highlight the current page */
            .topnav a.active {
                background-color: #04AA6D;
                color: white;
            }

        </style>
    </head>
    <body>
        <div class="topnav">
            <a class="active" href="#home">Home</a>
            <a href="#news">News</a>
            <a href="#contact">Contact</a>
            <a href="login.jsp" class="split">Logout</a>
        </div>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !("US".equals(loginUser.getRoleID()))) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>  
        <form action ="MainController" method="POST">
            <input type ="text" placeholder="Search clothes" name ="search" value="<%=search%>" />
            <input type ="submit" name ="action" value ="Search" />
        </form>
        <%
            List<Clothes> listClo = (List<Clothes>) request.getAttribute("LIST_CLOTHES");
            if (listClo != null) {
                if (listClo.size() > 0) {
        %>
        </br>
        <%
            String msg = null;
            int addQuantity = 3;
            for (Clothes c : listClo) {
                if (c.getPrice() == 0) {
                    c.setStatus(false);
                }
                if (c.isStatus()) {
                    msg = "Quantity: " + c.getQuantity();
                } else {
                    msg = "Out of stock!";
                }
        %>
        <div class="card">
            <form action="MainController" method="POST"> 
                <h1><%=c.getName()%></h1>
                <p class="price"><%=c.getPrice()%>$</p>
                <p><%=c.getDescription()%></p>
                <p><%=msg%></p>
                <input type="number" name="clothes" value="<%=addQuantity%>" min="0" step="1" max="<%=c.getQuantity()%>"/>
                <input type="hidden" name="clothes" value="<%=c.getId()%>"/>
                <input type="hidden" name="clothes" value="<%=c.getName()%>"/>
                <input type="hidden" name="clothes" value="<%=c.getDescription()%>"/>
                <input type="hidden" name="clothes" value="<%=c.getPrice()%>"/>
                <input type="hidden" name="clothes" value="<%=c.getQuantity()%>"/>
                <p><button id="addCart" type="submit" name="action" value="AddCart">Add to cart</button></p>
            </form>
        </div>
        <%
                    }
                }
            }
        %>
        <form action="MainController" method="POST">
            <button type="submit" name="action" value="CheckCart">Check cart</button>
        </form>
    </body>
</html>
