﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ALUMNI_REQ.aspx.cs" Inherits="YuvaConnect.ALUMNI_REQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-left:430px; margin-top:20px; margin-bottom:30px;">NEW ALUMNI REQUEST DATA</h1>
   <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid" 
    HeaderStyle-CssClass="grid-header" RowStyle-CssClass="grid-row" 
    AlternatingRowStyle-CssClass="grid-alt-row" AutoGenerateColumns="false" 
    Width="100%" BorderStyle="Solid" BorderWidth="1px" CellPadding="10">
    
    <EmptyDataTemplate>
    <div style="width:80vw; text-align: center; margin: 20px; padding: 20px; border: 2px dashed #ac2424; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <h3 style="color: #ac2424; font-family: 'Arial', sans-serif; font-weight: bold; margin-bottom: 10px;">
            No Alumni Requests Found
        </h3>
        <p style="color: #555; font-size: 16px; font-family: 'Arial', sans-serif;">
            There are currently no pending alumni requests to display. Please check back later.
        </p>
        <img src="https://cdn-icons-png.flaticon.com/512/7466/7466139.png" alt="No Data" style="width: 100px; margin-top: 10px;" />
    </div>
</EmptyDataTemplate>

    <Columns>
         <asp:TemplateField HeaderText="Accept">
             <ItemTemplate>
         <asp:Button ID="AcceptButton" runat="server" Text="ACCEPT" 
             CommandName="Accept" CommandArgument='<%# Eval("ALUMNI_ID") %>' 
             CssClass="accept-button" OnClick="AcceptButton_Click" />
         <br /> 
             </ItemTemplate>
         </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete">
        <ItemTemplate>
        <asp:Button ID="DeleteButton" runat="server" Text="DELETE" 
            CommandName="Delete" CommandArgument='<%# Eval("ALUMNI_ID") %>' 
            CssClass="delete-button" OnClick="DeleteButton_Click" />
        <br />
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Picture">
             <ItemTemplate>
                 <asp:Image ID="ProfileImage" runat="server" ImageUrl='<%# Eval("IMAGE_URL") %>' Height="50px" Width="50px" BorderStyle="Solid" BorderWidth="1px" />
             </ItemTemplate>
         </asp:TemplateField>
         <asp:BoundField DataField="ALUMNI_ID" HeaderText="ID" />
         <asp:BoundField DataField="NAME" HeaderText="Name" />
         <asp:BoundField DataField="LASTNAME" HeaderText="Surname" />
         <asp:BoundField DataField="USERNAME" HeaderText="Username" />
         <asp:BoundField DataField="PASSWORD" HeaderText="Password" />
         <asp:BoundField DataField="STREAM" HeaderText="Stream" />
         <asp:BoundField DataField="BRANCH" HeaderText="Branch" />
         <asp:BoundField DataField="BATCH_YEAR" HeaderText="Start_Yr" />
         <asp:BoundField DataField="COMPANY" HeaderText="Company" />
         <asp:BoundField DataField="LOCATION" HeaderText="Location" />
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
        min-width: 600px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }

    .styled-grid th {
        background-color: #ac2424;
        color: white;
        text-align: center;
        padding: 12px 15px;
    }

    .styled-grid td {
        padding: 12px 15px;
        color: #333;
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
        background: #ffffff;
    }

    .grid-alt-row {
        background: #f9f9f9;
    }
    .accept-button{
        color:forestgreen !important;
        border: 1px solid green !important;
    }
    .accept-button:hover{
        background-color:forestgreen !important;
        color:white !important;
        border: 1px solid green !important;
    }
    .accept-button{
        color:forestgreen !important;
        border: 1px solid green !important;
    }
        
    .accept-button:hover {
            background-color: forestgreen !important;
            color: white !important;
            border: 1px solid green !important;
     }

    .delete-button{
        color:red !important;
        border: 1px solid red !important;
    }
    .delete-button:hover{
        background-color:red !important;
        color:white !important;
        border: 1px solid red !important;
</style>
</asp:Content>