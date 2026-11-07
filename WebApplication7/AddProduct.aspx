<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplication7.AddProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product</title>

    <style>
        body {
            background-color: #111;
            color: white;
            font-family: Arial;
        }

        .box {
            width: 450px;
            margin: 50px auto;
            padding: 30px;
            background-color: #222;
            border-radius: 10px;
        }

        h1 {
            text-align: center;
        }

        .input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #e63946;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="box">

            <h1>Add Menu</h1>

            <asp:DropDownList ID="ddlCompany"
                runat="server"
                CssClass="input">
            </asp:DropDownList>

            <asp:TextBox ID="txtProductName"
                runat="server"
                CssClass="input"
                placeholder="Product Name">
            </asp:TextBox>

            <asp:TextBox ID="txtPrice"
                runat="server"
                CssClass="input"
                placeholder="Price">
            </asp:TextBox>

            <asp:TextBox ID="txtDesc"
                runat="server"
                CssClass="input"
                TextMode="MultiLine"
                placeholder="Description">
            </asp:TextBox>

            <asp:FileUpload ID="fuProductImg"
                runat="server"
                CssClass="input" />

            <asp:Button ID="btnSubmit"
                runat="server"
                Text="Add Product"
                CssClass="btn"
                OnClick="btnSubmit_Click" />

            <br /><br />

            <asp:Label ID="lblMessage"
                runat="server">
            </asp:Label>

        </div>

    </form>
</body>
</html>
