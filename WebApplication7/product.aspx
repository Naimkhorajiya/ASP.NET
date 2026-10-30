<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="WebApplication7.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Companies</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .company-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 30px;
        }

        .company-card {
            width: 300px;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            cursor: pointer;
        }

        .company-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .company-info {
            padding: 15px;
        }

        .company-name {
            font-size: 22px;
            font-weight: bold;
        }

        .company-owner {
            margin-top: 8px;
            color: gray;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="company-container">

            <asp:Repeater ID="rptCompany"
                runat="server"
                OnItemCommand="rptCompany_ItemCommand">

                <ItemTemplate>

                    <asp:LinkButton ID="LinkButton1"
                        runat="server"
                        CommandName="cmd_mid"
                        CommandArgument='<%# Eval("comp_id") %>'
                        Style="text-decoration:none; color:black;">

                        <div class="company-card">

                            <asp:Image ID="imgCompany"
                                runat="server"
                                ImageUrl='<%# "~/Images/CompanyImages/" + Eval("comp_cover_Img") %>'
                                CssClass="company-image" />

                            <div class="company-info">

                                <div class="company-name">
                                    <%# Eval("comp_name") %>
                                </div>

                                <div class="company-owner">
                                    Owner: <%# Eval("comp_owner_name") %>
                                </div>

                            </div>

                        </div>

                    </asp:LinkButton>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </form>

</body>
</html>--%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="WebApplication7.product" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Companies</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .company-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 30px;
        }

        .company-card {
            width: 300px;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            cursor: pointer;
        }

        .company-image {
            width: 300px;
            height: 180px;
            object-fit: cover;
        }

        .company-info {
            padding: 15px;
        }

        .company-name {
            font-size: 22px;
            font-weight: bold;
        }

        .company-owner {
            margin-top: 8px;
            color: gray;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="company-container">

            <asp:DataList ID="DataList1"
                runat="server"
                RepeatColumns="3"
                OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>

                    <asp:LinkButton ID="LinkButton1"
                        runat="server"
                        CommandName="cmd_mid"
                        CommandArgument='<%# Eval("comp_id") %>'
                        Style="text-decoration:none; color:black;">

                        <div class="company-card">

                            <asp:Image ID="imgCompany"
                                runat="server"
                                ImageUrl='<%# "~/Images/CompanyImages/" + Eval("comp_cover_Img") %>'
                                CssClass="company-image" />

                            <div class="company-info">

                                <div class="company-name">
                                    <%# Eval("comp_name") %>
                                </div>

                                <div class="company-owner">
                                    Owner: <%# Eval("comp_owner_name") %>
                                </div>

                            </div>

                        </div>

                    </asp:LinkButton>

                </ItemTemplate>

            </asp:DataList>

        </div>

    </form>
</body>
</html>