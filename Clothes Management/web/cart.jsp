<%-- 
    Document   : cart
    Created on : 12-Dec-2023, 18:24:39
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="sample.object.Clothes"%>
<%@page import="sample.object.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Cart Page</title>
        <style>
            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
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
                width: 80%;
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
            body {
                font-family: Arial;
                font-size: 17px;
                padding: 8px;
            }

            * {
                box-sizing: border-box;
            }

            .row {
                display: -ms-flexbox; /* IE10 */
                display: flex;
                -ms-flex-wrap: wrap; /* IE10 */
                flex-wrap: wrap;
                margin: 0 -16px;
            }

            .col-25 {
                -ms-flex: 25%; /* IE10 */
                flex: 25%;
            }

            .col-50 {
                -ms-flex: 50%; /* IE10 */
                flex: 50%;
            }

            .col-75 {
                -ms-flex: 75%; /* IE10 */
                flex: 75%;
            }

            .col-25,
            .col-50,
            .col-75 {
                padding: 0 16px;
            }

            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }

            input[type=text] {
                width: 100%;
                margin-bottom: 20px;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            label {
                margin-bottom: 10px;
                display: block;
            }

            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
            }

            .btn {
                background-color: #04AA6D;
                color: white;
                padding: 12px;
                margin: 10px 0;
                border: none;
                width: 100%;
                border-radius: 3px;
                cursor: pointer;
                font-size: 17px;
            }

            .btn:hover {
                background-color: #45a049;
            }

            a {
                color: #2196F3;
            }

            hr {
                border: 1px solid lightgrey;
            }

            span.price {
                float: right;
                color: grey;
            }
            h1{
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body class="w3-content w3-sand" style="max-width:1200px">
        <h1>CART</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getCart().size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Edit</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    int total = 0;
                    for (Clothes clo : cart.getCart().values()) {
                        total += clo.getPrice() * clo.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                <input type="hidden" name="cartID" value="<%=clo.getId()%>"/>
                <td><input type="text" name="a" value="<%=clo.getName()%>" readonly="" class="w3-sand"/> </td>
                <td><img src="<%=clo.getImage()%>" alt="Clothes Image" style="max-width: 100px; max-height: 100px;"></td>
                <td><input type="text" name="a" value="<%=clo.getDescription()%>" readonly="" class="w3-sand"/> </td>
                <td><input type="text" name="a" value="<%=clo.getPrice()%>" readonly="" class="w3-sand"/> </td>
                <td><input type="number" name="cartQuantity" value="<%=clo.getQuantity()%>" class="w3-sand"/> </td>
                <td><%=clo.getPrice() * clo.getQuantity()%>$</td>
                <td>
                    <button type="submit"  name="action" value="EditCart">Edit</button>
                </td>
                <td>
                    <button type="submit"  name="action" value="RemoveCart">Remove</button>
                </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h1>Total: <%= total%>$</h1>
    <%
        }
    %>
    </br><button type="submit" id="checkOut" class="w3-btn w3-round-xxlarge w3-black w3-margin">Checkout</button>
    <form action="MainController" method="POST">
        </br><button type="submit" name="action" value="ReturnUser" class="w3-btn w3-round-xxlarge w3-black w3-margin-left">Add more</button>
    </form>
    <div id="checkOutModal" class="modal w3-sand">
        <div class="modal-content w3-sand">
            <span class="close">&times;</span>
            <h2>Checkout</h2>
            <div class="row">
                <div class="col-75">
                    <div class="container w3-sand">
                        <div class="row">
                            <div class="col-50">
                                <form action="MainController" method="POST">
                                    <%
                                        int total3 = 0;
                                        Cart cart3 = (Cart) session.getAttribute("CART");
                                        if (cart3 != null && cart3.getCart().size() > 0) {
                                            for (Clothes clo3 : cart.getCart().values()) {
                                                total3 += clo3.getPrice() * clo3.getQuantity();
                                    %>
                                    <input type="hidden" name="checkOutClothesName" value="<%=clo3.getName()%>" readonly=""/>
                                    <input type="hidden" name="checkOutClothesQuantity" value="<%=clo3.getQuantity()%>" readonly=""/>
                                    <input type="hidden" name="checkOutClothesPrice" value="<%=clo3.getPrice()%>" readonly=""/>
                                    <%
                                        }
                                    %>
                                    <h3>Billing Address</h3>
                                    <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                    <input type="text" id="fname" name="checkOutName" placeholder="" value="" required="">
                                    <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                    <input type="text" id="email" name="checkOutUserID" placeholder="" value="" required="">
                                    <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                    <input type="text" id="adr" name="checkOutAddress" placeholder="" value="" required="">
                                    <input type="hidden" name="checkOutID" placeholder="" value="6">
                                    </div>
                                    <div class="col-50">
                                        <h3>Payment</h3>
                                        <label for="fname">Accepted Cards</label>
                                        <div class="icon-container">
                                            <i class="fa fa-cc-visa" style="color:navy;"></i>
                                            <i class="fa fa-cc-amex" style="color:blue;"></i>
                                            <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                            <i class="fa fa-cc-discover" style="color:orange;"></i>
                                        </div>
                                        <label for="cname">Phone number</label>
                                        <input type="text" id="cname" name="checkOutNumber" placeholder="" value="" required="">
                                        <label for="ccnum">Order date</label>
                                        <input type="text" id="ccnum" name="checkOutDate" placeholder="YYYY-MM-DD" value="" required="">
                                    </div>
                            </div>          
                            <input type="hidden" name="checkOutTotal" value="<%=total3%>"/>
                            <button type="submit" value="CheckOut" class="btn w3-black" name="action">Continue to checkout</button>
                        </div>
                    </div>
                    </form>
                    <%
                        }
                        Cart cart2 = (Cart) session.getAttribute("CART");
                        if (cart2 != null && cart2.getCart().size() > 0) {
                    %>
                    <div class="col-25">
                        <div class="container w3-sand">
                            <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>                        
                            <table border="1">
                                <thead>              
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int total2 = 0;
                                        for (Clothes clo2 : cart2.getCart().values()) {
                                            total2 += clo2.getPrice() * clo2.getQuantity();
                                    %>
                                    <tr>
                                        <td><input type="text" name="a" value="<%=clo2.getName()%>" readonly="" class="w3-sand"/> </td>
                                        <td><input type="text" name="a" value="<%=clo2.getQuantity()%>" readonly="" class="w3-sand"/> </td>
                                <input type="hidden" name="a" value="<%=clo2.getPrice()%>" readonly=""/>
                                <td><input type="text" name="a" value="<%=clo2.getQuantity() * clo2.getPrice()%>" readonly="" class="w3-sand"/> </td>
                                </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                            <p>Total <span class="price" style="color:black"><b><%=total2%>$</b></span></p>
                            <input type="hidden" name="a" value="<%=total2%>"/>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // Get the modal
            var modal = document.getElementById("checkOutModal");

            // Get the button that opens the modal
            var btn = document.getElementById("checkOut");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                event.preventDefault();
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                event.preventDefault();
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
</body>
</html>
