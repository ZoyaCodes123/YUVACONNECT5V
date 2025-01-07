<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="VOTE_STUD.aspx.cs" Inherits="YuvaConnect.VOTE_STUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .container {
        width: 60%;
        margin: 50px auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        border-radius: 8px;
    }
    .not-declared-message {
        font-size: 18px;
        text-align: center;
        margin-top: 20px;
    }
        .section {
            margin-bottom: 20px;
        }
        .section h2 {
            color: #444;
            font-size: 20px;
            margin-bottom: 10px;
        }
        .section p {
            font-size: 16px;
            color: #555;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-transform: uppercase;
            font-size: 16px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .flashcards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .flashcard img{
            height:100px;
            width:100px;
        }
    </style>

    <div class="container">
        <div class="section">
            <h2>Welcome to the Alumni Election Portal</h2>
            <p>
                Participating in alumni elections helps strengthen the connection between students and alumni.
                Cast your vote wisely to select a candidate who can bring valuable opportunities to the university.
            </p>
        </div>

        <div class="section">
            <h2>How to Vote?</h2>
            <ul>
                <li>Review the candidates below.</li>
                <li>Click "Vote" for the candidate of your choice.</li>
                <li>Each student can vote only once. Ensure your decision aligns with the university's voting guidelines.</li>
            </ul>
        </div>

        <div class="button-container">
            <asp:Button ID="btnCheckElections" runat="server" CssClass="btn-primary" Text="Check Elections" onClick="btnCheckElections_Click" />
            <asp:Button ID="btnCheckResults" runat="server" CssClass="btn-primary" Text="Check Results" OnClick="btnCheckResults_Click" />
        </div>

        <div class="section">
            <div class="flashcards-container">
                <asp:Repeater ID="rptCandidates" runat="server" Visible="false">
    <ItemTemplate>
        <div class="flashcard">
            <img src='<%# Eval("IMAGE_URL") %>' alt="Candidate Image" />
            <div class="flashcard-content">
                <h3><%# Eval("NAME") %></h3>
                <p><strong>Company:</strong> <%# Eval("COMPANY") %></p>
                <p><strong>Email:</strong> <%# Eval("EMAIL_ID") %></p>
            </div>
           <asp:Button ID="btnVote" runat="server" CssClass="vote-button" Text="Vote"
    CommandArgument='<%# Eval("CAND_ID") %>' OnCommand="btnVote_Command" />
        </div>
    </ItemTemplate>
</asp:Repeater>
            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="fade-message" Visible="false"></asp:Label>
    </div>
</asp:Content>
