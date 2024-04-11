<%-- 
    Document   : admin
    Created on : 27-Nov-2023, 11:54:52
    Author     : ADMIN
--%>

<%@page import="sample.object.Order"%>
<%@page import="sample.object.Clothes"%>
<%@page import="java.util.List"%>
<%@page import="sample.object.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Page</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-color: #ddd;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 25%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #888;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            /* Style the buttons that are used to open the tab content */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }
            h2{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            h1{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .searchBar{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .table{
                margin-left: auto;
                margin-right: auto;
            }
            .logoutbtn{
                display: inline-block;
                padding: 10px 20px;
                color: white; /* White text color */
                text-decoration: none;
                cursor: pointer;
            }
            .logoutbtn:hover {
                background-color: #aaaaaa;
            }
        </style>
    </head>
    <body>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("searchUser");
            if (search == null) {
                search = "";
            }
            String searchClothes = request.getParameter("searchClothes");
            if (searchClothes == null) {
                searchClothes = "";
            }
            String searchOrder = request.getParameter("searchOrder");
            if (searchOrder == null) {
                searchOrder = "";
            }
        %>
        <h1>Welcome: <%=loginUser.getFullName()%></h1>
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'London')">Manage Users</button>
            <button class="tablinks" onclick="openCity(event, 'Paris')">Manage Clothes</button>
            <button class="tablinks" onclick="openCity(event, 'Tokyo')">Manage Orders</button>
            <a href="login.jsp" class="logoutbtn">Logout</a>
        </div>
        <div id="London" class="tabcontent">
            <h2>Manage Users</h2>
            <div class="searchBar">
                <form action ="MainController">
                    <input type ="text" placeholder="Search user by ID" name ="searchUser" value="<%=search%>" />
                    <button type ="submit" name ="action" value ="SearchUser">Search</button>
                </form>
                <button id="createUser" type="submit">Create new user</button>
            </div>
            <%
                List<User> listUser = (List<User>) request.getAttribute("LIST_USER");
                if (listUser != null) {
                    if (listUser.size() > 0) {
            %>
            </br>
            <div style="overflow-x:auto;">
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Password</th>
                            <th>Role ID</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (User u : listUser) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%= count++%></td>
                            <td><input type="text" name="userID" value="<%=u.getUserID()%>" readonly=""/></td>
                            <td><input type="text" name="fullName" value="<%=u.getFullName()%>" /></td>
                            <td><input type="text" name="password" value="<%=u.getPassword()%>" /></td>
                                <%
                                    if (u.getRoleID().equals("AD")) {
                                %>
                            <td><select name="roleID">
                                    <option value="AD">AD</option>
                                    <option value="US">US</option>
                                </select></td>
                                <%
                                } else {
                                %>
                            <td><select name="roleID">
                                    <option value="US">US</option>
                                    <option value="AD">AD</option>
                                </select></td>
                                <%
                                    }
                                %>
                            <td>
                                <input type="submit" name="action" value="Update"/>
                                <input type="hidden" name="userID" value="<%= u.getUserID()%>"/>
                                <input type="hidden" name="searchUser" value="<%= search%>"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Delete"/>
                                <input type="hidden" name="userID" value="<%= u.getUserID()%>"/>
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%
                    }
                }
            %>       
            <form action="MainController" method="POST">
                <div id="createUserModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Create new user</h2>
                        User ID: <input type="text" name="newUserID" value="user123" />
                        </br>Full Name: <input type="text" name="newFullName" value="Peppa" />
                        </br>Password: <input type="text" name="newPassword" value="1234" />
                        </br>Role ID: <select name="newRoleID">
                            <option value="US">US</option>
                            <option value="AD">AD</option>
                        </select>
                        </br><button type="submit" value="CreateUser" name="action">Create</button>
                    </div>
                </div>
            </form>
        </div>

        <div id="Paris" class="tabcontent">
            <h2>Manage Clothes</h2>
            <div class="searchBar">
                <form action ="MainController">
                    <input type ="text" placeholder="Search clothes by name" name ="searchClothes" value="<%=searchClothes%>" />
                    <button type ="submit" name ="action" value ="SearchClothes">Search</button>
                </form>
                <button id="createClothes" type="submit">Create new clothes</button>
            </div>
            <%
                List<Clothes> listClothes = (List<Clothes>) request.getAttribute("LIST_CLOTHES");
                if (listClothes != null) {
                    if (listClothes.size() > 0) {
            %>
            </br>
            <div style="overflow-x:auto;">
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (Clothes c : listClothes) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%= count++%></td>
                            <td><input type="text" name="id" value="<%=c.getId()%>" readonly=""/></td>
                            <td><input type="text" name="name" value="<%=c.getName()%>"/></td>
                            <td><img src="<%=c.getImage()%>" alt="Clothes Image" style="max-width: 100px; max-height: 100px;"></td>
                            <td><input type="text" name="description" value="<%=c.getDescription()%>"/></td>
                            <td><input type="number" name="price" value="<%=c.getPrice()%>"/></td>
                            <td><input type="number" name="quantity" value="<%=c.getQuantity()%>"/></td>
                            <td><input type="text" name="status" value="<%=c.isStatus()%>" readonly=""/></td>
                            <td>
                                <button type="submit" name="action" value="UpdateClothes">Update</button>
                                <input type="hidden" name="id" value="<%= c.getId()%>"/>
                                <input type="hidden" name="searchClothes" value="<%= searchClothes%>"/>
                            </td>
                            <td>
                                <button type="submit" name="action" value="DeleteClothes">Delete</button>
                                <input type="hidden" name="id" value="<%= c.getId()%>"/>
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%
                    }
                }
            %>
            <form action="MainController" method="POST">
                <div id="createClothesModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Create new clothes</h2>
                        ID: <input type="text" name="newID" value="5" />
                        </br>Name: <input type="text" name="newName" value="b" />
                        </br>Description: <input type="text" name="newDescription" value="c" />
                        </br>Price: <input type="number" name="newPrice" value="10" />
                        </br>Quantity: <input type="number" name="newQuantity" value="20" />
                        </br>Image: <input type="text" name="newImage" value="" />
                        </br><button type="submit" value="CreateClothes" name="action">Create</button>
                    </div>
                </div>
            </form>
        </div>

        <div id="Tokyo" class="tabcontent">
            <h2>Manage Order</h2>
            <div class="searchBar">
                <form action ="MainController">
                    <input type ="text" placeholder="Search order by userID" name ="searchOrder" value="<%=searchOrder%>" />
                    <button type ="submit" name ="action" value ="SearchOrder">Search</button>
                </form>
            </div>
            <%
                List<Order> listOrder = (List<Order>) request.getAttribute("LIST_ORDER");
                if (listOrder != null) {
                    if (listOrder.size() > 0) {
            %>
            </br>
            <div style="overflow-x:auto;">
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>User ID</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Total</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (Order o : listOrder) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%= count++%></td>
                            <td><input type="text" name="orderID" value="<%=o.getOrderID()%>" readonly=""/></td>
                            <td><input type="text" name="orderDate" value="<%=o.getOrderDate()%>"readonly=""/></td>
                            <td><input type="text" name="orderUserID" value="<%=o.getUserID()%>"readonly=""/></td>
                            <td><input type="text" name="orderPhone" value="<%=o.getPhone()%>"readonly=""/></td>
                            <td><input type="text" name="orderAddress" value="<%=o.getAddress()%>"readonly=""/></td>
                            <td><input type="number" name="orderTotal" value="<%=o.getTotal()%>"readonly=""/></td>
                            <td>
                                <button type="submit" name="action" value="DeleteOrder">Delete</button>
                                <input type="hidden" name="id" value="<%= o.getOrderID()%>"/>
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%
                    }
                }
            %>
        </div>
        <script>
            function openCity(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            // Get the modal
            var modal = document.getElementById("createUserModal");
            var modal2 = document.getElementById("createClothesModal");

            // Get the button that opens the modal
            var btn = document.getElementById("createUser");
            var btn2 = document.getElementById("createClothes");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }
            btn2.onclick = function () {
                modal2.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal || event.target == modal2) {
                    modal.style.display = "none";
                    modal2.style.display = "none";
                }
            }
        </script>
    </body>
</html>
