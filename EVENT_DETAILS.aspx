<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EVENT_DETAILS.aspx.cs" Inherits="YuvaConnect.EVENT_DETAILS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100vw;
            height: 100vh;
            margin: 0px;
        }

        .event-detail-box {
            position: relative;
            display: flex;
            width: 60vw; /* 60% of the body width */
            height: 70vh; /* 60% of the body height */
            max-width: 900px; /* Maximum width to avoid overflow */
            max-height: 600px; /* Maximum height to avoid overflow */
            box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px; /* Optional, rounded corners */
            overflow: hidden; /* Hide any overflow */
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            justify-items: center;
            margin-top: 20px;
            margin-left: 170px;
            margin-right: 20px;
        }

            .event-detail-box img {
                position: absolute;
                left: 10%;
                top: 25%;
                height: 43%;
                width: 30%;
            }

        .left-design-panel {
            position: absolute;
            height: 100%;
            width: 20%;
            background-color: firebrick;
            left: 0px;
        }

        .text-details {
            position: absolute;
            right: 0px;
            height: 100%;
            width: 56%;
            padding: 10px;
        }

        .stream-style {
            border: 2px solid firebrick;
            padding: 2px;
            margin-top: 20px;
            border-radius: 5px 5px;
            color: firebrick;
            background-color: #efa3a4;
        }

        .branch-style {
            border: 2px solid #ba6161;
            padding: 2px;
            margin-top: 10px;
            border-radius: 5px 5px;
            color: #ba6161;
            background-color: #ecc0c1;
        }
            .BackBtn{
            margin-left:160px;
            margin-top: 20px;
            width:100px;
}
    </style>
                <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" CssClass="BackBtn"/>

    <div class="event-detail-box">
        <div class="left-design-panel"></div>
        <asp:Image ID="event_img" runat="server" ImageUrl="~/event-promotion.jpg" />
        <div class="text-details">
            <asp:Label ID="lblevent" runat="server" Text="Event: " Font-Size="Large"></asp:Label><br />
            <asp:Label ID="lblevent_name" runat="server" Font-Size="Larger"></asp:Label><br />
            <asp:Label ID="lblstream" runat="server" CssClass="stream-style" Font-Size="Small"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblbranch" runat="server" Font-Size="Small" CssClass="branch-style"></asp:Label><br />
            <br />
            Description:<br />
            <asp:Label ID="lblinfo" runat="server" Text="info"></asp:Label><br />
            <br />
            Start Day:&nbsp;
               
            <asp:Label ID="lblstart_day" runat="server" Text="Start Day"></asp:Label><br />
            End Day:&nbsp;
               
            <asp:Label ID="lblend_day" runat="server" Text="End Day"></asp:Label><br />
            <br />
            Timing:<br />
            From &nbsp;<asp:Label ID="lblstart_time" runat="server" Text="Start Time"></asp:Label>&nbsp; To &nbsp;<asp:Label ID="lblend_time" runat="server" Text="End Time"></asp:Label>
            <br />
            <br />
            Venue:&nbsp;<asp:Label ID="lblvenue" runat="server" Text="Venue"></asp:Label>
            <br />
            Registration Link:&nbsp;<a><asp:Label ID="lbllink" runat="server" Text="Link"></asp:Label></a>
        </div>
    </div> 
</asp:Content>
