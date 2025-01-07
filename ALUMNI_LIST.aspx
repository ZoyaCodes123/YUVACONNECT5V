 <%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ALUMNI_LIST.aspx.cs" Inherits="YuvaConnect.ALUMNI_LIST" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-left:600px">ALUMNI DATA</h1>
   <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid" 
    HeaderStyle-CssClass="grid-header" RowStyle-CssClass="grid-row" 
    AlternatingRowStyle-CssClass="grid-alt-row" AutoGenerateColumns="false" 
    Width="100%" BorderStyle="Solid" BorderWidth="1px" CellPadding="10">
    
    <Columns>
        <asp:TemplateField HeaderText="Picture">
            <ItemTemplate>
                <asp:Image ID="ProfileImage" runat="server" ImageUrl='<%# Eval("IMAGE_URL") %>' Height="50px" Width="50px" BorderStyle="Solid" BorderWidth="1px" />
            </ItemTemplate>
        </asp:TemplateField>
         <asp:BoundField DataField="ENROLLMENT_NUMBER" HeaderText="ENROLL_NO." />
         <asp:BoundField DataField="ALUMNI_ID" HeaderText="ID" />
         <asp:BoundField DataField="NAME" HeaderText="Name" />
         <asp:BoundField DataField="LASTNAME" HeaderText="Surname" />
         <asp:BoundField DataField="USERNAME" HeaderText="Username" />
         <asp:BoundField DataField="PASSWORD" HeaderText="Password" />
         <asp:BoundField DataField="STREAM" HeaderText="Stream" />
         <asp:BoundField DataField="BRANCH" HeaderText="Branch" />
         <asp:BoundField DataField="BATCH_YEAR" HeaderText="Start_Yr" />
         <asp:BoundField DataField="COMPANY" HeaderText="Company" />
         <asp:BoundField DataField="EMAIL_ID" HeaderText="Email" />
         <asp:BoundField DataField="LINKEDIN_LINK" HeaderText="LinkedIn" />
         <asp:BoundField DataField="SKILL1" HeaderText="Skill1" />
         <asp:BoundField DataField="SKILL2" HeaderText="Skill2" />
         <asp:BoundField DataField="SKILL3" HeaderText="Skill3" />
    </Columns>
</asp:GridView>

<style>
    .styled-grid {
        margin-left:170px;
        border-collapse: collapse; 
        font-size: 18px; 
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }

    .styled-grid th {
        background-color: #ef3f3f;
        color: white;
        text-align: center;
        padding: 12px 15px;
    }

    .styled-grid td {
        width:500px !important; 
        color: #333;
    }

    .styled-grid tr{
        height:10px;
    }
    .styled-grid tr:nth-child(even) {
        background-color: #f3f3f3;
    }

    .styled-grid tr:hover {
        background-color: #ddd;
    }

    .grid-header {
        font-weight: bold;
        background: #4CAF50;
        color: white;
    }

    .grid-row {
        width:500px !important; 
        background: #ffffff;
        height:10px;
    }

    .grid-alt-row {
        width:500px !important;  
        background: #f9f9f9;
    }
</style>

</asp:Content>