<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="VOTE_RESULT.aspx.cs" Inherits="YuvaConnect.VOTE_RESULT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container {
    width: 60%;
    margin: 50px auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 8px;
}
    </style>
    <div class="container">
    <center><h2>Election Results</h2></center>
    <!-- Admin View -->
    <asp:Panel ID="pnlAdminView" runat="server" Visible="false">
        <h3>Detailed Results</h3>
        <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="false" CssClass="table" GridLines="None">
            <Columns>
                <asp:BoundField DataField="CandidateName" HeaderText="Candidate" SortExpression="CandidateName" />
                <asp:BoundField DataField="VoteCount" HeaderText="Votes" SortExpression="VoteCount" />
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <!-- Student View -->
    <asp:Panel ID="pnlStudentView" runat="server" Visible="false">
        <asp:Label ID="lblWinner" runat="server" CssClass="winner-label"></asp:Label>
        <p>Thank you for participating in the election!</p>
    </asp:Panel>
        </div>
</asp:Content>
