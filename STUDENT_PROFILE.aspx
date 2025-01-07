<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="STUDENT_PROFILE.aspx.cs" Inherits="YuvaConnect.STUDENT_PROFILE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        .background{
            display:flex;
            justify-content:center;
        }
        .detail-container{
            display:inline-block;
            width:800px;
            height:800px;
            box-shadow:3px 3px 15px;
            margin-left:120px;
            padding:20px;
        }
        .image-block{
            display:inline-block;
            width: 212px;
            height: 164px;
            padding:20px;
            justify-content:center;
            vertical-align:top;
        }
        .alumni-details{
            display:inline-block;
            width: 347px;
            height: 208px;
            padding:20px;
        }
        .image-block img{
            border-radius:50%;
            vertical-align:top;
            
        }
        .about-block{
            display:block;
            width:598px;
            background-color:rgb(239, 235, 235);
            padding:20px;
            border-radius:20px;
        }
        
    .BackBtn{
        margin-left:160px;
        margin-top: 20px;
        width:100px;
    }
    </style>  
            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" CssClass="BackBtn"/>

        <div class="background">
            <div class="detail-container">
                <div class="image-block">
                &nbsp;<asp:Image ID="profile_img" runat="server" Height="131px" ImageUrl="~/STUDENT/IMG10.JPG" Width="131px" />
                <br />
                <br />
                </div>
                <div class="alumni-details">Username:
                    <asp:Label ID="lbluname" runat="server" Text="Label"></asp:Label>
                    <br />
                    Name:
                    <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
                    <br />
                    Email:
                    <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label>
                    <br />
                    College:
                    <asp:Label ID="lblclg" runat="server" Text="Label"></asp:Label>
                    <br />
                    Stream:
                    <asp:Label ID="lblstream" runat="server" Text="Label"></asp:Label>
&nbsp;
                    <br />
                    Branch:
                    <asp:Label ID="lblbranch" runat="server" Text="Label"></asp:Label>
&nbsp;<br />
                    Start Year: <asp:Label ID="lblstart_year" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;
                    <br />
                    Graduation:
                    <asp:Label ID="lblend_year" runat="server" Text="Label"></asp:Label>
&nbsp;
                    <br />
                    Skill:
                    <asp:Label ID="lblskill1" runat="server" Text="Label"></asp:Label>,
                    <asp:Label ID="lblskill2" runat="server" Text="Label"></asp:Label>,
                    <asp:Label ID="lblskill3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" Width="29px" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0bGEl9v47XieEtHyj0TqTr1tOXJmib-KHtw&s" AlternateText="LinkedIn" />
                    &nbsp;&nbsp;&nbsp;
                    <a href="https://www.linkedin.com/in/rojalin-pradhan-7b1495270/">View LinkedIn Profile</a><br />
                    <br />
                    <br />
                </div>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <div class="about-block">
                    <asp:Label ID="lblabout" runat="server" Text="About" Font-Italic="True"></asp:Label>
                </div>
            </div>
            
        </div>  

</asp:Content>
