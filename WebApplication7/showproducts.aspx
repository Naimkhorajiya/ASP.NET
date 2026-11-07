


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showproducts.aspx.cs" Inherits="WebApplication7.showproducts" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
            margin: 0;
        }

        .header {
            background-color: #222;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 90%;
            margin: 20px auto;
        }

        .product {
            background-color: white;
            width: 250px;
            padding: 15px;
            text-align: center;
            border-radius: 8px;
            margin: 10px;
        }

        .product img {
            width: 200px;
            height: 160px;
            object-fit: contain;
        }

        .btn {
            padding: 8px 12px;
            margin: 5px;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>Our Menu</h1>
        </div>

        <div class="container">

            <asp:Button ID="btnAddProduct" runat="server"
                Text="Add Product"
                CssClass="btn"
                OnClick="btnAddProduct_Click" />

            <asp:Button ID="btnViewCart" runat="server"
                Text="View Cart"
                CssClass="btn"
                OnClick="btnViewCart_Click" />

            <br /><br />

            <asp:DataList ID="DataList1" runat="server"
                RepeatColumns="3"
                RepeatDirection="Horizontal"
                CellPadding="10"
                OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>

                    <div class="product">

                        <asp:Image ID="Image1" runat="server"
                            ImageUrl='<%# Eval("Prod_Img", "~/Images/ProductImages/{0}") %>' />

                        <h3>
                            <asp:Label ID="lblName" runat="server"
                                Text='<%# Eval("Prod_Name") %>' />
                        </h3>

                        <p>
                            Price: ₹
                            <asp:Label ID="lblPrice" runat="server"
                                Text='<%# Eval("Prod_Price") %>' />
                        </p>

                        <p>
                            <asp:Label ID="lblDesc" runat="server"
                                Text='<%# Eval("Prod_Desc") %>' />
                        </p>

                        <asp:Button ID="btnDetails" runat="server"
                            Text="View Details"
                            CssClass="btn"
                            CommandName="cmd_view"
                            CommandArgument='<%# Eval("Prod_Id") %>' />

                        <asp:Button ID="btnCart" runat="server"
                            Text="Add To Cart"
                            CssClass="btn"
                            CommandName="cmd_cart"
                            CommandArgument='<%# Eval("Prod_Id") %>' />

                    </div>

                </ItemTemplate>

            </asp:DataList>

        </div>

    </form>
</body>
</html>
