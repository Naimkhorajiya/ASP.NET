<%-- <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="company.aspx.cs" Inherits="WebApplication7.company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #080808, #151515, #080808);
            min-height: 100vh;
            color: white;
        }

        form {
            min-height: 100vh;
        }

        .company-container {
            width: 620px;
            margin: 50px auto;
            padding: 40px 45px;
            background: #161616;
            border: 1px solid #292929;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
        }

        .company-title {
            text-align: center;
            font-size: 34px;
            font-weight: bold;
            color: #ffffff;
            margin-bottom: 8px;
        }

        .company-title:after {
            content: "";
            display: block;
            width: 55px;
            height: 3px;
            background: #e63946;
            margin: 12px auto 30px;
            border-radius: 10px;
        }

        .add-product {
            display: block;
            width: 150px;
            text-align: center;
            margin: 0 auto 32px;
            padding: 12px 20px;
            background: #e63946;
            color: #ffffff;
            text-decoration: none;
            border-radius: 25px;
            font-size: 14px;
            font-weight: bold;
            transition: 0.3s;
            box-shadow: 0 6px 18px rgba(230, 57, 70, 0.25);
        }

        .add-product:hover {
            background: #ff4b5c;
            transform: translateY(-2px);
            box-shadow: 0 8px 22px rgba(230, 57, 70, 0.35);
        }

        .label {
            display: block;
            color: #eeeeee;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .input {
            width: 100%;
            height: 46px;
            padding: 0 14px;
            margin-bottom: 20px;
            background: #222222;
            color: #ffffff;
            border: 1px solid #383838;
            border-radius: 9px;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }

        .input:hover {
            border-color: #555555;
        }

        .input:focus {
            border-color: #e63946;
            background: #252525;
            box-shadow: 0 0 0 3px rgba(230, 57, 70, 0.10);
        }

        textarea.input {
            height: 105px;
            padding: 12px 14px;
            resize: vertical;
        }

        .file-input {
            width: 100%;
            padding: 11px;
            margin-bottom: 25px;
            background: #222222;
            color: #cccccc;
            border: 1px solid #383838;
            border-radius: 9px;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            height: 50px;
            background: #ffffff;
            color: #111111;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            background: #e63946;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(230, 57, 70, 0.25);
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ffffff;
            font-size: 14px;
        }

        @media (max-width: 700px) {
            .company-container {
                width: calc(100% - 30px);
                margin: 25px auto;
                padding: 30px 25px;
            }

            .company-title {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="company-container">

            <div class="company-title">
                Company
            </div>

            <asp:HyperLink ID="lnkAddProduct" runat="server" NavigateUrl="~/product.aspx" Text="Add Product" CssClass="add-product"></asp:HyperLink>
            <asp:Label ID="Label1" runat="server" Text="" CssClass="label"></asp:Label>
            <asp:Label ID="lblCompanyName" runat="server" Text="Company Name" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtCompanyName" runat="server" OnTextChanged="txtCompanyName_TextChanged" CssClass="input"></asp:TextBox>
            <asp:Label ID="lblOwnerName" runat="server" Text="Company Owner Name" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtOwnerName" runat="server" CssClass="input"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" Text="Company Email" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
            <asp:Label ID="lblAddress" runat="server" Text="Company Address" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="input"></asp:TextBox>
            <asp:Label ID="lblCoverImg" runat="server" Text="Company Cover Image" CssClass="label"></asp:Label>
            <asp:FileUpload ID="fuCoverImg" runat="server" CssClass="file-input" />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        </div>

    </form>
</body>
</html>--%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="company.aspx.cs" Inherits="WebApplication7.company" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #080808, #151515, #080808);
            min-height: 100vh;
            color: white;
        }

        form { min-height: 100vh; }

        .company-container {
            width: 620px;
            margin: 50px auto;
            padding: 40px 45px;
            background: #161616;
            border: 1px solid #292929;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
        }

        .company-title {
            text-align: center;
            font-size: 34px;
            font-weight: bold;
            color: #ffffff;
            margin-bottom: 8px;
        }

        .company-title:after {
            content: "";
            display: block;
            width: 55px;
            height: 3px;
            background: #e63946;
            margin: 12px auto 30px;
            border-radius: 10px;
        }

        .add-product {
            display: block;
            width: 150px;
            text-align: center;
            margin: 0 auto 32px;
            padding: 12px 20px;
            background: #e63946;
            color: #ffffff;
            text-decoration: none;
            border-radius: 25px;
            font-size: 14px;
            font-weight: bold;
        }

        .label {
            display: block;
            color: #eeeeee;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .input {
            width: 100%;
            height: 46px;
            padding: 0 14px;
            margin-bottom: 20px;
            background: #222222;
            color: #ffffff;
            border: 1px solid #383838;
            border-radius: 9px;
            font-size: 14px;
        }

        textarea.input {
            height: 105px;
            padding: 12px 14px;
            resize: vertical;
        }

        .file-input {
            width: 100%;
            padding: 11px;
            margin-bottom: 25px;
            background: #222222;
            color: #cccccc;
            border: 1px solid #383838;
            border-radius: 9px;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            height: 50px;
            background: #ffffff;
            color: #111111;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ffffff;
            font-size: 14px;
        }

        @media (max-width: 700px) {
            .company-container {
                width: calc(100% - 30px);
                margin: 25px auto;
                padding: 30px 25px;
            }

            .company-title { font-size: 28px; }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="company-container">

            <div class="company-title">Company</div>

            <asp:HyperLink ID="lnkAddProduct" runat="server"
                NavigateUrl="~/product.aspx"
                Text="Add Product"
                CssClass="add-product"></asp:HyperLink>

            <asp:Label ID="Label1" runat="server" CssClass="label"></asp:Label>

            <asp:Label ID="lblCompanyName" runat="server"
                Text="Company Name" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtCompanyName" runat="server"
                CssClass="input"></asp:TextBox>

            <asp:Label ID="lblOwnerName" runat="server"
                Text="Company Owner Name" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtOwnerName" runat="server"
                CssClass="input"></asp:TextBox>

            <asp:Label ID="lblEmail" runat="server"
                Text="Company Email" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"
                CssClass="input"></asp:TextBox>

            <asp:Label ID="lblAddress" runat="server"
                Text="Company Address" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server"
                TextMode="MultiLine" CssClass="input"></asp:TextBox>

            <asp:Label ID="lblCoverImg" runat="server"
                Text="Company Cover Image" CssClass="label"></asp:Label>
            <asp:FileUpload ID="fuCoverImg" runat="server"
                CssClass="file-input" />

            <asp:Button ID="btnSubmit" runat="server"
                Text="Submit" OnClick="btnSubmit_Click"
                CssClass="btn" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message"></asp:Label>

        </div>
    </form>
</body>
</html>