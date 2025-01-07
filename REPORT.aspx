<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="REPORT.aspx.cs" Inherits="YuvaConnect.REPORT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <EmptyDataTemplate>
    <div style="width:80vw; text-align: center; margin-left: 190px; padding: 20px; border: 2px dashed #ac2424; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <h3 style="color: #ac2424; font-family: 'Arial', sans-serif; font-weight: bold; margin-bottom: 10px;">
           REPORT A USER :
        </h3>
        <p style="color: #555; font-size: 16px; font-family: 'Arial', sans-serif;">
           If someone is attempting to invade your privacy, you can report them by sending an email to: YuvaConnectMailer@gmail.com
        </p>
        <img src="https://cdn-icons-png.flaticon.com/512/6555/6555235.png" alt="No Data" style="width: 100px; margin-top: 10px;" />
    </div>
</EmptyDataTemplate>
</asp:Content>
