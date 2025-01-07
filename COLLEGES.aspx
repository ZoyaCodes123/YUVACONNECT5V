<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="COLLEGES.aspx.cs" Inherits="YuvaConnect.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        * {
    margin: 0;
    padding: 0;
}

html {
    height: 100%;
}

body {
    background-color: #8B0000;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    margin: 0;
    width: 100%;
    text-align: center;
    background: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
    height: 490px;
}

h1 {
    text-align: center;
}

.alumni-members {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    gap: 20px;
    margin-top: 45px;
}

.member {
    padding:10px;
    width: 100px;
    height: 330px;
    flex: 1 1 20%;
    text-align: center;
    border: 1px solid #ddd;
    background-color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

    .member img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2.5px solid #ddd;
        margin-bottom: 15px;
    }

    </style> 
           
           <div style="text-align: center; margin-top: 20px;">
           <!-- TextBox for Name Search -->
           <asp:TextBox ID="txtSearch" runat="server" Width="200px" Placeholder="Search by Name" CssClass="textBoxStyle"></asp:TextBox>
           <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
       </div>

        <div class="container">
    <h1>College</h1>
    <p>College list</p>
    <div class="alumni-members">
        <asp:Repeater ID="Repeater1" runat="server">
             <ItemTemplate>
                <div class="member">
                    <!-- Use ASP.NET Image control for ImageUrl -->
                    <asp:Image ID="IMAGE_URL" runat="server" ImageUrl='<%# Eval("IMAGE_URL") %>' AlternateText='<%# Eval("CLG_NAME") %>' Width="100px" Height="100px" /><br />
                    
                    <!-- Display ID using Label control -->
                    <asp:Label ID="CLG_ID" runat="server" Text='<%# "ID: " + Eval("CLG_ID") %>'></asp:Label><br />
                    
                    <!-- Display Name using Label control -->
                    <asp:Label ID="CLG_NAME" runat="server" Text='<%# Eval("CLG_NAME") %>'></asp:Label><br />
                    
                    <!-- Display Profession using Label control -->
                    <asp:Label ID="ADDRESS" runat="server" Text='<%# Eval("ADDRESS") %>'></asp:Label><br />
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
