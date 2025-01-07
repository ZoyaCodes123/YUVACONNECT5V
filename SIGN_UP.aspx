<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SIGN_UP.aspx.cs" Inherits="YuvaConnect.SIGN_UP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
        * {
    font-family: poppins;
    color:#a80303
}
        body{
            background-color: rgba(0, 0, 0, 0.1)
        }
          h1{

              text-align:center;
              margin-top:20px;
          }
        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 50px;
            margin: 50px; 
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .button-box1 , .button-box2{
            height: 300px;
            width: 300px; 
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .button-box1 img{
            height: 300px;
            width: 300px;
            border-radius: 20px;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            border : 1px solid #a80303;
        }
        .button-box2 img{
            height: 300px;
            width: 300px;
            border-radius: 20px;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            border : 1px solid #a80303;

        }
         

        .button-box1:hover {
            box-shadow: 0 0 20px 10px #a80303;
            transform: scale(1.05);
        }
        
        .button-box2:hover {
            box-shadow: 0 0 20px 10px #a80303;
            transform: scale(1.05);
        }
    </style>

    <h1>SignUp As : </h1> 
    <div class="button-container"> 
        <a href="STUDENT_SIGNUP.aspx">
        <div class="button-box1">
            <img src="19.png" />
        </div> 
        </a> 
        <a href="ALUMNI_SIGNUP.aspx">
        <div class="button-box2">
            <img src="18.png" />
        </div> 
        </a>
    </div>
</asp:Content>