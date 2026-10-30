<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="WebApplication7.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>My Food Cart</title>

</head>

<body>

    <form id="form1" runat="server">

        <div>

            <center>

                <h1>My Food Cart</h1>

                <p>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </p>

                <p>
                    <a href="showproducts.aspx">
                        &larr; Continue Shopping
                    </a>
                </p>


                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="Prod_Id"
                    OnRowCommand="GridView1_RowCommand"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating">

                    <Columns>


                        <asp:TemplateField HeaderText="Product_Id">

                            <ItemTemplate>

                                <asp:Label
                                    ID="Label6"
                                    runat="server"
                                    Text='<%# Eval("Prod_Id") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Food_Image">

                            <ItemTemplate>

                                <asp:Image
                                    ID="Image1"
                                    runat="server"
                                    ImageUrl='<%# "~/Images/ProductImages/" + Eval("Prod_Img") %>'
                                    Width="100px"
                                    Height="80px"
                                    style="border-radius:6px; object-fit:cover;" />

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Food_Name">

                            <ItemTemplate>

                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# Eval("Prod_Name") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Price">

                            <ItemTemplate>

                                <asp:Label
                                    ID="Label3"
                                    runat="server"
                                    Text='<%# "Rs. " + Eval("Prod_Price") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Quantity">


                            <EditItemTemplate>

                                <asp:DropDownList
                                    ID="DropDownList1"
                                    runat="server">

                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>

                                </asp:DropDownList>

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Label
                                    ID="Label4"
                                    runat="server"
                                    Text='<%# Eval("Quentity") %>'>
                                </asp:Label>

                            </ItemTemplate>


                        </asp:TemplateField>



                        <asp:CommandField
                            HeaderText="Change Quantity"
                            ShowEditButton="True" />



                        <asp:TemplateField HeaderText="Remove">

                            <ItemTemplate>

                                <asp:LinkButton
                                    ID="btnRemove"
                                    runat="server"
                                    CommandName="cmd_remove"
                                    CommandArgument='<%# Eval("Prod_Id") %>'>

                                    Remove

                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>


                    </Columns>

                </asp:GridView>


                <br />
                <br />

                <asp:Label
                    ID="grand_total"
                    runat="server">
                </asp:Label>

            </center>

        </div>

    </form>

</body>
</html>--%>



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="WebApplication7.cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Food Cart</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 90%;
            margin: auto;
            background-color: white;
            padding: 20px;
        }

        h2 {
            text-align: center;
        }

        .total {
            font-size: 22px;
            font-weight: bold;
            color: green;
        }

        .btn {
            padding: 8px 15px;
            margin-top: 15px;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <h2>My Food Cart</h2>

            <p>
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </p>

            <p>
                <a href="product.aspx">Continue Shopping</a>
            </p>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Prod_Id"
                OnRowCommand="GridView1_RowCommand"
                OnRowEditing="GridView1_RowEditing"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating"
                CellPadding="10"
                Width="100%"
                GridLines="Both">

                <Columns>

                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server"
                                Text='<%# Eval("Prod_Id") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Food Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl='<%# Eval("Prod_Img", "~/Images/ProductImages/{0}") %>'
                                Width="100px"
                                Height="80px"
                                Style="border-radius: 6px; object-fit: cover;" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Food Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server"
                                Text='<%# Eval("Prod_Name") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server"
                                Text='<%# "Rs. " + Eval("Prod_Price") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">

                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server"
                                Text='<%# Eval("Qty") %>'>
                            </asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlQty" runat="server"
                                SelectedValue='<%# Bind("Qty") %>'>

                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>

                            </asp:DropDownList>
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:CommandField
                        HeaderText="Change Quantity"
                        ShowEditButton="True" />

                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnRemove" runat="server"
                                Text="Remove"
                                CommandName="cmd_remove"
                                CommandArgument='<%# Eval("Prod_Id") %>'
                                OnClientClick="return confirm('Remove this product?');">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            <br />

            <asp:Label ID="grand_total" runat="server"
                CssClass="total">
            </asp:Label>
            <br />
            <br />

            <asp:Button ID="btnCheckout" runat="server"
                Text="Checkout"
                CssClass="btn"
                OnClick="btnCheckout_Click" />
            
   <%--     <asp:Button ID="Button1" runat="server"
    Text="Checkout"
    CssClass="btn"
    OnClick="btnCheckout_Click" />--%>
        </div>








    </form>
</body>
</html>
