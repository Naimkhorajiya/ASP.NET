<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="WebApplication7.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <style>
        .reg-container {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-top: 40px;
            flex-wrap: wrap;
            padding-bottom: 50px;
        }

        .form-box {
            background: white;
            padding: 30px 35px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            width: 380px;
        }

            .form-box h2 {
                text-align: center;
                margin-bottom: 25px;
                font-weight: 600;
            }

        .form-group {
            margin-bottom: 16px;
        }

            .form-group label {
                display: block;
                margin-bottom: 6px;
                font-weight: 600;
                font-size: 14px;
            }

            .form-group input {
                width: 100%;
                padding: 11px 14px;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-sizing: border-box;
                font-size: 14px;
            }

        .btn-register {
            width: 100%;
            padding: 13px;
            background: #e63946;
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.3s;
        }

            .btn-register:hover {
                background: #c1121f;
            }

        .grid-box {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            min-width: 420px;
        }

            .grid-box h3 {
                margin-bottom: 15px;
            }
    </style>

    <div class="reg-container">

        <!-- Registration Form -->
        <div class="form-box">
            <h2>Registration</h2>

            <div class="form-group">
                <label>Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Full Name" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />

            <br />
            <br />

                 <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-register" OnClientClick="btnRegister_Click='login.aspx'; return false;" />

            <br />
            <br />

            <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
        </div>
            <!-- GridView -->
            <div class="grid-box">
                <h3>Registered Users</h3>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                    BorderStyle="Solid" BorderWidth="1" CellPadding="10"
                    HeaderStyle-BackColor="#e63946" HeaderStyle-ForeColor="White"
                    Width="100%">

                    <Columns>

                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />

                        <asp:BoundField DataField="Email" HeaderText="Email" />

                        <asp:BoundField DataField="Password" HeaderText="Password" />

                    </Columns>

                </asp:GridView>

            </div>

        </div>
</asp:Content>
