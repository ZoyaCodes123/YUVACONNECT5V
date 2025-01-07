<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ADMIN.aspx.cs" Inherits="YuvaConnect.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <link href="StyleSheet2.css" rel="stylesheet" />
        
        <div class="container">
    <h1>ADMIN</h1>
    <p>Meet our Admins</p>
    <div class="alumni-members">
        <asp:Repeater ID="Repeater1" runat="server">
             <ItemTemplate>
                <div class="member">
                    <!-- Use ASP.NET Image control for ImageUrl -->
                    <asp:Image ID="IMAGE_URL" runat="server" ImageUrl='<%# Eval("IMAGE_URL") %>' AlternateText='<%# Eval("name") %>' Width="100px" Height="100px" /><br />
                    
                    <!-- Display ID using Label control -->
                    <asp:Label ID="ADMIN_ID" runat="server" Text='<%# "ID: " + Eval("ADMIN_ID") %>'></asp:Label><br />
                    
                    <!-- Display Name using Label control -->
                    <asp:Label ID="NAME" runat="server" Text='<%# Eval("NAME") %>'></asp:Label><br />
                    
                    <!-- Display Profession using Label control -->
                    <asp:Label ID="CLG_NAME" runat="server" Text='<%# Eval("CLG_NAME") %>'></asp:Label><br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <br />
        <br />
        <br />
        <br />

    </div>
</div>
</asp:Content>
