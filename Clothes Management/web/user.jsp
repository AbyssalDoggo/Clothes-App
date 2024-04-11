<%-- 
    Document   : user2
    Created on : 13-Dec-2023, 19:09:21
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="sample.object.Clothes"%>
<%@page import="sample.object.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>User Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .w3-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
            .custom-card {
                box-shadow: none;
                border: none;
            }
            .image-container {
                width: 100%; /* Set the desired width */
                height: 100%; /* Set the desired height */
                overflow: hidden;
            }

            .image-container img {
                width: 100%; /* Make the image fill the container */
                height: auto; /* Maintain the aspect ratio */
            }
        </style>
    </head>
    <body class="w3-content w3-sand" style="max-width:1200px">
        <nav class="w3-sidebar w3-bar-block w3-collapse w3-top w3-sand" style="z-index:3;width:250px" id="mySidebar">
            <div class="w3-container w3-display-container w3-padding-16 w3-sand">
                <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
                <h3 class="w3-wide"><b>MUCHALA</b></h3>
            </div>
            <div class="w3-padding-64 w3-large w3-text-grey w3-sand" style="font-weight:bold">
                <a href="#" class="w3-bar-item w3-button">Shirts</a>
                <a href="#" class="w3-bar-item w3-button">Dresses</a>
                <a href="#" class="w3-bar-item w3-button">Jackets</a>
                <a href="#" class="w3-bar-item w3-button">Shoes</a>
            </div>
            <a href="#footer" class="w3-bar-item w3-button w3-padding w3-sand">Contact</a> 
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding w3-sand" onclick="document.getElementById('newsletter').style.display = 'block'">Newsletter</a>
            <a href="login.jsp" class="w3-bar-item w3-button w3-padding w3-sand">Logout</a> 
        </nav>

        <!-- Top menu on small screens -->
        <header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
            <div class="w3-bar-item w3-padding-24 w3-wide">MUCHALA</div>
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
        </header>

        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:250px">

            <!-- Push down content on small screens -->
            <div class="w3-hide-large" style="margin-top:83px"></div>

            <!-- Top header -->
            <header class="w3-container w3-xlarge">
                <p class="w3-left">Clothes</p>
                <p class="w3-right">
                    <a class="fa fa-shopping-cart w3-margin-right" href="cart.jsp"></a>
                </p>
            </header>

            <!-- Image header -->
            <div class="w3-display-container w3-container">
                <img src="https://images.unsplash.com/photo-1558769132-cb1aea458c5e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Jeans" style="width:100%">
                <div class="w3-display-topleft w3-text-white" style="padding:24px 48px">
                    <h1 class="w3-jumbo w3-hide-small">New arrivals</h1>
                    <h1 class="w3-hide-large w3-hide-medium">New arrivals</h1>
                    <h1 class="w3-hide-small">COLLECTION 2023</h1>
                    <p><a href="#jeans" class="w3-button w3-black w3-padding-large w3-large">SHOP NOW</a></p>
                </div>
            </div>
            <div class="w3-container w3-text-grey" id="jeans">
                <p>8 items</p>
            </div>
            <!-- Product grid -->
            <%
                List<Clothes> listClo = (List<Clothes>) request.getAttribute("LIST_CLOTHESW");
                if (listClo != null) {
                    if (listClo.size() > 0) {
            %>
            </br>
            <div class="w3-row w3-grayscale">
                <%
                    int addQuantity = 1;
                    for (Clothes c : listClo) {
                        if (c.getPrice() == 0) {
                            c.setStatus(false);
                        }
                %>
                <form action="MainController" method="POST"> 
                    <div class="w3-col l3 s6">
                        <div class="w3-card custom-card">
                            <div class="w3-container">
                                <div class="w3-display-container">
                                    <div class="image-container">
                                        <img src="<%=c.getImage()%>" alt="Clothes Image" style="width:100%;max-width:400px;max-height: 160px">
                                    </div>
                                    <div class="w3-display-middle w3-display-hover">
                                        <button class="w3-button w3-black" name="action" value="AddCart">Add to cart<i class="fa fa-shopping-cart"></i></button>
                                    </div>
                                </div>
                                <%
                                    if (c.isStatus()) {
                                %>
                                <p><%=c.getName()%><br><b>$<%=c.getPrice()%></b></p>
                                    <%
                                    } else {
                                    %>
                                <p class=""><b>Out of stock!</b></p>
                                <%
                                    }
                                %>
                                <input type="hidden" name="clothes" value="<%=addQuantity%>"/>
                                <input type="hidden" name="clothes" value="<%=c.getId()%>"/>
                                <input type="hidden" name="clothes" value="<%=c.getName()%>"/>
                                <input type="hidden" name="clothes" value="<%=c.getDescription()%>"/>
                                <input type="hidden" name="clothes" value="<%=c.getPrice()%>"/>
                                <input type="hidden" name="clothes" value="<%=c.getQuantity()%>"/>
                                <input type="hidden" name="clothes" value="<%=c.getImage()%>"/>
                            </div>
                        </div>
                    </div>
                </form>
                <%
                            }
                        }
                    }
                %>
            </div>

            <!-- Footer -->
            <footer class="w3-padding-64 w3-pale-yellow w3-small w3-center" id="footer">
                <div class="w3-row-padding w3-margin-left">
                    <div class="w3-col s4">
                        <h4>Contact</h4>
                        <p>Questions? Go ahead.</p>
                        <form action="/action_page.php" target="_blank">
                            <p><input class="w3-input w3-border" type="text" placeholder="Name" name="Name" required></p>
                            <p><input class="w3-input w3-border" type="text" placeholder="Email" name="Email" required></p>
                            <p><input class="w3-input w3-border" type="text" placeholder="Subject" name="Subject" required></p>
                            <p><input class="w3-input w3-border" type="text" placeholder="Message" name="Message" required></p>
                            <button type="submit" class="w3-button w3-block w3-black">Send</button>
                        </form>
                    </div>

                    <div class="w3-col s4">
                        <h4>About</h4>
                        <p><a href="#">About us</a></p>
                        <p><a href="#">Payment</a></p>
                        <p><a href="#">Return</a></p>
                    </div>

                    <div class="w3-col s4 w3-justify">
                        <h4>Store</h4>
                        <p><i class="fa fa-fw fa-map-marker"></i>Phan Tran Minh Tri</p>
                        <p><i class="fa fa-fw fa-phone"></i> 0907560789</p>
                        <p><i class="fa fa-fw fa-envelope"></i> Sirisz2003@gmail.com</p>
                        <br>
                        <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
                        <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
                        <i class="fa fa-snapchat w3-hover-opacity w3-large"></i>
                        <i class="fa fa-pinterest-p w3-hover-opacity w3-large"></i>
                        <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
                        <i class="fa fa-linkedin w3-hover-opacity w3-large"></i>
                    </div>
                </div>
            </footer>

            <div class="w3-black w3-center w3-padding-24">Powered by Netbean</div>

            <!-- End page content -->
        </div>

        <!-- Newsletter Modal -->
        <div id="newsletter" class="w3-modal">
            <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
                <div class="w3-container w3-white w3-center">
                    <i onclick="document.getElementById('newsletter').style.display = 'none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
                    <h2 class="w3-wide">NEWSLETTER</h2>
                    <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
                    <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
                    <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display = 'none'">Subscribe</button>
                </div>
            </div>
        </div>

        <script>
            // Accordion 
            function myAccFunc() {
                var x = document.getElementById("demoAcc");
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                }
            }

            // Click on the "Jeans" link on page load to open the accordion for demo purposes
            document.getElementById("myBtn").click();


            // Open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }
        </script>

    </body>
</html>
