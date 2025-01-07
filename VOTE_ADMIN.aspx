<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="VOTE_ADMIN.aspx.cs" Inherits="YuvaConnect.VOTE_ADMIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Main container */
        .content-container {
            max-width: 1200px;
            margin: 20px 0px 0px 160px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Candidate card styling */
        .candidate-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            margin: 20px 0;
            padding: 15px;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .candidate-info {
            text-align: left;
        }

        .candidate-info h3 {
            margin: 0 0 10px;
            font-size: 1.4rem;
            color: #333;
        }

        .candidate-info p {
            margin: 5px 0;
            font-size: 1rem;
            color: #555;
        }

        /* Buttons for Repeater */
        .candidate-actions {
            text-align: right;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }

        .btn-accept {
            background-color: #28a745;
            color: #ffffff;
        }

        .btn-accept:hover {
            background-color: #218838;
        }

        .btn-reject {
            background-color: #dc3545;
            color: #ffffff;
        }

        .btn-reject:hover {
            background-color: #c82333;
        }

        /* Action buttons at the bottom */
        .action-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 20px;
        }

        .action-buttons .btn-action {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px 30px;
            font-size: 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .action-buttons .btn-action:hover {
            background-color: #0056b3;
        }
    </style>

    <div class="content-container">
        <h1>Candidate Approval Portal</h1>
        <asp:Repeater ID="RepeaterCandidates" runat="server" OnItemCommand="RepeaterCandidates_ItemCommand">
            <ItemTemplate>
                <div class="candidate-card">
                    <div class="candidate-info">
                        <h3><%# Eval("NAME") %> <%# Eval("LASTNAME") %></h3>
                        <p>Stream: <%# Eval("STREAM") %></p>
                        <p>Branch: <%# Eval("BRANCH") %></p>
                        <p>Batch Year: <%# Eval("BATCH_YEAR") %></p>
                        <p>Status: <%# Eval("Status") %></p>
                    </div>
                    <div class="candidate-actions"><asp:Button CommandName="Reject" CommandArgument='<%# Eval("CAND_ID") %>' CssClass="btn btn-reject" Text="Reject" runat="server" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
         
        <div class="action-buttons">
            <asp:Button ID="btnToggleElection" CssClass="btn-action" Text="ELECTIONS (Toggle)" OnClick="btnToggleElection_Click" runat="server" />
            <asp:Button ID="btnResultsToggle" CssClass="btn-action" Text="RESULTS (Toggle)" OnClick="btnResultsToggle_Click" runat="server" />
            <asp:Button ID="btnViewResults" CssClass="btn-action" Text="View Result" OnClick="btnViewResults_Click" runat="server" />
       </div>
    </div>
</asp:Content>


