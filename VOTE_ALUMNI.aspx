<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="VOTE_ALUMNI.aspx.cs" Inherits="YuvaConnect.VOTE_ALUMNI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        .instructions {
            margin-bottom: 20px;
            font-size: 16px;
            color: #555555;
            line-height: 1.6;
        }
        .confirmation {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .confirmation input {
            margin-right: 10px;
        }
        .btn-participate {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-participate:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .btn-check-results {
            display: block;
            margin: 20px auto;
            padding: 15px 30px;
            font-size: 18px;
            font-weight: bold;
            color: #ffffff;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
        }
        .btn-check-results:hover {
            background-color: #218838;
        }
    </style>
    <div class="container">
        <h1>Participate in Elections</h1>
        <div class="instructions">
            <p>Welcome to the election participation portal! Please read the following instructions carefully:</p>
            <ul>
                <li>You must confirm your willingness to participate by checking the confirmation box below.</li>
                <li>Ensure you are eligible to participate as per the guidelines provided by the election committee.</li>
                <li>Click the "Participate" button after confirming your agreement to proceed.</li>
            </ul>
        </div>
        <div class="confirmation">
            <asp:CheckBox ID="chkConfirm" runat="server" AutoPostBack="true" OnCheckedChanged="chkConfirm_CheckedChanged" />
            <label for="chkConfirm">Check this box to confirm your participation.</label>
        </div>
        <asp:Button ID="btnParticipate" runat="server" Text="Participate" CssClass="btn-participate" Enabled="false" OnClick="btnParticipate_Click" />
    </div>
    <asp:Button ID="btnCheckResults" runat="server" Text="Check Results" CssClass="btn-check-results" />
</asp:Content>

