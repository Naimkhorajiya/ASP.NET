 
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderdetails.aspx.cs" Inherits="WebApplication7.orderdetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Details</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            padding: 20px;
        }

        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 25px;
        }

        h2 {
            text-align: center;
        }

        .txt {
            width: 95%;
            padding: 10px;
            margin: 8px 0;
        }

        .btn {
            padding: 10px 20px;
            margin-top: 15px;
            cursor: pointer;
        }

        .total {
            font-size: 22px;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Order Details</h2>

            <p>Order No:
                <asp:Label ID="lblOrderId" runat="server"></asp:Label>
            </p>

            <p>Order Date:
                <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
            </p>

            <h3>Customer Details</h3>

            Customer Name:
            <asp:TextBox ID="txtName" runat="server" CssClass="txt"></asp:TextBox>

            Email:
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txt"
                TextMode="Email"></asp:TextBox>

            Mobile:
            <asp:TextBox ID="txtMobile" runat="server" CssClass="txt"></asp:TextBox>

            Shipping Address:
            <asp:TextBox ID="txtAddress" runat="server" CssClass="txt"
                TextMode="MultiLine" Rows="3"></asp:TextBox>

            <h3>Ordered Products</h3>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False" Width="100%" CellPadding="8">
                <Columns>
                    <asp:BoundField DataField="Prod_Name" HeaderText="Product Name" />
                    <asp:BoundField DataField="Prod_Price" HeaderText="Price" />
                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>

            <br />

            <asp:Label ID="lblTotal" runat="server" CssClass="total"></asp:Label>

            <h3>Payment Method</h3>

            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value="Cash on Delivery">Cash on Delivery</asp:ListItem>
                <asp:ListItem Value="UPI">UPI</asp:ListItem>
            </asp:RadioButtonList>

            <asp:Button ID="btnPlaceOrder" runat="server"
                Text="Place Order" CssClass="btn"
                OnClick="btnPlaceOrder_Click" />

            <br /><br />

            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
