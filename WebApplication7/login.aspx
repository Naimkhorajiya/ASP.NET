<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication7.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #0b0b0b;
            min-height: 100vh;
        }

        .login-box {
            width: 380px;
            margin: 120px auto;
            background: #171717;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.7);
            border: 1px solid #292929;
        }

        h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 30px;
            color: #ffffff;
            font-size: 32px;
            font-weight: bold;
        }

        .input {
            width: 100%;
            height: 48px;
            padding: 0 15px;
            margin-bottom: 18px;
            background-color: #222222;
            color: #ffffff;
            border: 1px solid #3a3a3a;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }

        .input::placeholder {
            color: #888888;
        }

        .input:focus {
            border-color: #ffffff;
            background-color: #252525;
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.08);
        }

        .btn {
            width: 100%;
            height: 48px;
            padding: 10px;
            background-color: #ffffff;
            color: #000000;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
            transition: 0.3s;
            margin-top: 5px;
        }

        .btn:hover {
            background-color: #d9d9d9;
            transform: translateY(-1px);
        }

        .error {
            color: #ff5555;
            display: block;
            text-align: center;
            margin-top: 18px;
            font-size: 14px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="login-box">

            <h2>Login</h2>

            <asp:TextBox 
                ID="txtEmail" 
                runat="server"
                CssClass="input"
                placeholder="Enter Email">
            </asp:TextBox>

            <asp:TextBox 
                ID="txtPassword" 
                runat="server"
                CssClass="input"
                TextMode="Password"
                placeholder="Enter Password">
            </asp:TextBox>

            <asp:Button 
                ID="btnLogin" 
                runat="server"
                Text="Login"
                CssClass="btn"
                OnClick="btnLogin_Click" />

            <asp:Label 
                ID="lblMsg"
                runat="server"
                CssClass="error">
            </asp:Label>

        </div>

    </form>

</body>
</html>
