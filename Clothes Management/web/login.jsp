<%-- 
    Document   : login2
    Created on : 10-Dec-2023, 16:45:32
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');
        *{
            margin: 0;
            padding: 0;
            font-family: 'poppins',sans-serif;
        }
        section{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
            background: url('images/image2.jpg')no-repeat;
            background-position: center;
            background-size: cover;
        }
        .form-box{
            position: fixed;
            width: 400px;
            height: 570px;
            background: transparent;
            border: 2px solid rgba(255,255,255,0.5);
            border-radius: 20px;
            backdrop-filter: blur(15px);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        h2{
            font-size: 2em;
            color: #000;
            text-align: center;
        }
        .inputbox{
            position: relative;
            margin: 30px 0;
            width: 310px;
            border-bottom: 2px solid #fff;
        }
        .inputbox label{
            position: absolute;
            top: 50%;
            left: 5px;
            transform: translateY(-50%);
            color: #000;
            font-size: 1em;
            pointer-events: none;
            transition: .5s;
        }
        input:focus ~ label,
        input:valid ~ label{
            top: -5px;
        }
        .inputbox input {
            width: 100%;
            height: 50px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 1em;
            padding:0 35px 0 5px;
            color: #000;
        }
        .inputbox ion-icon{
            position: absolute;
            right: 8px;
            color: #000000;
            font-size: 1.2em;
            top: 20px;
        }
        .forget{
            margin: -15px 0 15px ;
            font-size: .9em;
            color: #fff;
            display: flex;
            justify-content: space-between;  
        }

        .forget label input{
            margin-right: 3px;
        }
        .forget label a{
            color: #000;
            text-decoration: none;
        }
        .forget label a:hover{
            text-decoration: underline;
        }
        button{
            width: 100%;
            height: 40px;
            border-radius: 40px;
            background: #fff;
            border: none;
            outline: none;
            cursor: pointer;
            font-size: 1em;
            font-weight: 600;
        }
        .register{
            font-size: .9em;
            color: #fff;
            text-align: center;
            margin: 25px 0 10px;
        }
        .register p a{
            text-decoration: none;
            color: #000;
            font-weight: 600;
        }
        .register p a:hover{
            text-decoration: underline;
        }
        .login{
            font-size: .9em;
            color: #fff;
            text-align: center;
            margin: 25px 0 10px;
        }
        .login p a{
            text-decoration: none;
            color: #000;
            font-weight: 600;
        }
        .login p a:hover{
            text-decoration: underline;
        }
        .register-form-value{
            display: none;
            position: fixed;
        }
        .registerBtn {
            background: none;
            border: none;
            color: #fff; /* Adjust the color as needed */
            font-weight: bold;
            cursor: pointer;
        }
        .loginBtn {
            background: none;
            border: none;
            color: #fff; /* Adjust the color as needed */
            font-weight: bold;
            cursor: pointer;
            vertical-align: middle;
        }
    </style>
    <body>
        <section>
            <div class="form-box" id="loginForm">
                <div class="login-form-value" id="loginModal">
                    <form action="MainController" method="POST">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="text" placeholder="" name="userID" value="" required/>
                            <label for="userID"><b>Email</b></label>
                        </div>
                        <div class = "inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" placeholder="" name="password" value="" required/>
                            <label for="password"><b>Password</b></label>
                        </div>
                        <div class="forget">
                            <label for=""><input type="checkbox">Remember Me</label>
                            <a href="#">Forget Password?</a>
                        </div>
                        <button type="submit" value="Login" name="action">Login</button>
                        <div class="register">
                            <p>Don't have an account? <button class="registerBtn" id="registerBtn">Register</button></p>
                        </div>
                    </form>
                </div>
                <div class="register-form-value" id="registerModal">
                    <form action="MainController" method="POST">
                        <h2>Register</h2>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="text" placeholder="" name="registerUserID" value="" required/>
                            <label for="registerUserID"><b>Email</b></label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="person-outline"></ion-icon>
                            <input type="text" placeholder="" name="registerFullName" value="" required/>
                            <label for="registerFullName"><b>Full Name</b></label>
                        </div>
                        <div class = "inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" placeholder="" name="registerPassword" value="" required/>
                            <label for="registerPassword"><b>Password</b></label>
                        </div>
                        <div class = "inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" placeholder="" name="confirmRegisterPassword" value="" required/>
                            <label for="confirmRegisterPassword"><b>Confirm Password</b></label>
                        </div>
                        ${requestScope.REGISTERMESSAGE}
                        <button type="submit" value="Register" name="action">Register</button>
                        <div class="login">
                            <p>Already have an account? <button class="loginBtn" id="loginBtn">Login</button></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
    <script>
        // Get the modal
        var registerModal = document.getElementById("registerModal");
        var loginModal = document.getElementById("loginModal");

        // Get the button that opens the modal
        var registerBtn = document.getElementById("registerBtn");
        var loginBtn = document.getElementById("loginBtn");

        loginBtn.onclick = function () {
            event.preventDefault();
            registerModal.style.display = "none";
            loginModal.style.display = "block";
        };

        // When the user clicks the button, open the modal 
        registerBtn.onclick = function () {
            event.preventDefault();
            loginModal.style.display = "none";
            registerModal.style.display = "block";
        };
    </script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</html>
