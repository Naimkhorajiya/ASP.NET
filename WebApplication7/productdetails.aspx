```aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productdetails.aspx.cs" Inherits="WebApplication7.productdetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .main {
            width: 80%;
            margin: 30px auto;
        }

        .product {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
        }

        .product img {
            width: 300px;
            height: 250px;
            object-fit: contain;
        }

        .name {
            font-size: 28px;
            font-weight: bold;
        }

        .price {
            font-size: 22px;
            color: green;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="main">
            <div class="product">

                <asp:DataList ID="DataList1" runat="server" Width="100%">
                    <ItemTemplate>

                        <asp:Image
                            ID="Image1"
                            runat="server"
                            ImageUrl='<%# Eval("Prod_Img", "~/Images/ProductImages/{0}") %>'
                            AlternateText="Product Image" />

                        <br /><br />

                        <asp:Label
                            ID="Label1"
                            runat="server"
                            CssClass="name"
                            Text='<%# Eval("Prod_Name") %>' />

                        <br /><br />

                        <asp:Label
                            ID="Label2"
                            runat="server"
                            CssClass="price"
                            Text='<%# "Price: ₹" + Eval("Prod_Price") %>' />

                        <br /><br />

                        <b>Description:</b>
                        <asp:Label
                            ID="Label3"
                            runat="server"
                            Text='<%# Eval("Prod_Desc") %>' />

                        <br /><br />

                        <asp:Button
                            ID="btnBack"
                            runat="server"
                            Text="Back to Products"
                            PostBackUrl="javascript:history.back();" />

                    </ItemTemplate>
                </asp:DataList>

            </div>
        </div>

    </form>
</body>
</html>