<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="YuvaConnect.LOGIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       *{
            font-family: Arial, sans-serif;

       } 
       body{
           background-color:rgba(0, 0, 0, 0.1)
       }
       #dynamicHeading{
           margin-top:-20px;
       }
       .card{
           height:100px;
           width:300px;
       }
       .card img{
           background-color:#fff !important;
           border:1px solid #9f0a0a !important;
           height:97px;
       }
        .main {
            background-color:#fff !important;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgb(128, 128, 128);
            margin-top:20px;
            margin-left:450px;
            height:500px;
            width: 450px;
            display: flex;
            flex-direction:column;
            justify-content: space-evenly;
            align-items: center;
        }

        .main h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .btn{
            margin-left:25px !important;
            background-color:transparent !important;
            color:antiquewhite;
            border: 1px solid antiquewhite !important;
            margin:10px;
            cursor: pointer;
        }  

        .btn:hover {
            background: #d41c1c !important;
        }

        .input-group {
            margin: 10px 0;
            text-align: left;
        }

        .label-container{
            width:200px; 
            margin-bottom:10px;
        }
        .label-container label{
            font:25px !important;

        }

        .input-container{
            width:400px;
        }

        .login-btn {
            background: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        .login-btn:hover {
            background: #218838;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>  
   

        <!-- MultiView Control -->
        <asp:MultiView ID="MultiView1" runat="server">

<asp:View ID="View1" runat="server">
     <div class="main">
     <!-- Dynamic Heading -->
     <h1 id="H1" runat="server">Login Page</h1>
     <h3 id="dynamicHeading" runat="server">Select a role</h3>

     <!-- Role Buttons -->
     <div class="role-buttons" id="role">
         <div class="card mb-3" style="max-width: 540px;">
             <div class="row g-0">
                 <div class="col-md-4">
                     <img src="https://cdn.iconscout.com/icon/free/png-256/free-graduating-student-icon-download-in-svg-png-gif-file-formats--female-education-study-school-back-to-pack-icons-2042096.png" class="img-fluid rounded-start" alt="...">
                 </div>
                 <div class="col-md-8">
                     <div class="card-body">
                         <asp:Button ID="btnStudent" runat="server" Text="Student" CssClass="btn btn-primary active" OnClick="btnStudent_Click" />
                     </div>
                 </div>
             </div>
         </div>
         
         <div class="card mb-3" style="max-width: 540px;">
             <div class="row g-0">
                 <div class="col-md-4">
                     <img src="https://cdn-icons-png.flaticon.com/512/4537/4537019.png" class="img-fluid rounded-start" alt="...">
                 </div>
                 <div class="col-md-8">
                     <div class="card-body">
                         <asp:Button ID="btnAlumni" runat="server" Text="Alumni" CssClass="btn btn-primary active" OnClick="btnAlumni_Click" />
                     </div>
                 </div>
             </div>
         </div>

         <div class="card mb-3" style="max-width: 540px;">
             <div class="row g-0">
                 <div class="col-md-4">
                     <img src="https://cdn-icons-png.flaticon.com/512/1071/1071942.png" class="img-fluid rounded-start" alt="...">
                 </div>
                 <div class="col-md-8">
                     <div class="card-body">
                         <asp:Button ID="btnAdmin" runat="server" Text="Admin" CssClass="btn btn-primary active" OnClick="btnAdmin_Click" />
                     </div>
                 </div>
             </div>
         </div>
     </div>
         </div>
</asp:View>           
            <!-- Student Login -->
<asp:View ID="ViewStudent" runat="server">
     <div class="main">
     <h1 id="H2" runat="server">Login Page</h1>
     <h3 id="H3" runat="server">Welcome Student!</h3>
    <div class="input-group">
        <div class="label-container">
            <label for="txtStudentUsername">Username</label>
        </div>
        <div class="input-container">
            <asp:TextBox ID="txtStudentUsername" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="input-group">
        <div class="label-container">
            <label for="txtStudentPassword">Password</label>
        </div>
        <div class="input-container">
            <asp:TextBox ID="txtStudentPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>
    </div>
    <asp:Button ID="btnStudentLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnStudentLogin_Click" />
    <asp:Label ID="lblStudentError" runat="server" CssClass="error"></asp:Label>
    </div> 
</asp:View>

<!-- Alumni Login -->
<asp:View ID="ViewAlumni" runat="server">
     <div class="main">
     <h1 id="H4" runat="server">Login Page</h1>
     <h3 id="H5" runat="server">Welcome Alumni</h3>
    <div class="input-group">
        <div class="label-container">
            <label for="txtAlumniUsername">Username</label>
        </div>
        <div class="input-container">
            <asp:TextBox ID="txtAlumniUsername" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="input-group">
        <div class="label-container">
            <label for="txtAlumniPassword">Password</label>
        </div>
        <div class="input-container">
            <asp:TextBox ID="txtAlumniPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>
    </div>
    <asp:Button ID="btnAlumniLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnAlumniLogin_Click" />
    <asp:Label ID="lblAlumniError" runat="server" CssClass="error"></asp:Label>
    </div> 
</asp:View>

<!-- Admin Login -->
<asp:View ID="ViewAdmin" runat="server">
     <div class="main">
     <h1 id="H6" runat="server">Login Page</h1>
     <h3 id="H7" runat="server">Welcome Admin!</h3>
    <div class="input-group">
        <div class="label-container">
            <label for="txtAdminEmail">Email</label>
        </div>
        <div class="input-container">
            <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="input-group">
        <div class="label-container">
            <label for="txtAdminPassword">Password</label>
        </div>
        <div class="input-container">
            <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>
    </div>
    <asp:Button ID="btnAdminLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnAdminLogin_Click" />
    <asp:Label ID="lblAdminError" runat="server" CssClass="error"></asp:Label>
    </div> 
</asp:View>

        </asp:MultiView>
</asp:Content>
