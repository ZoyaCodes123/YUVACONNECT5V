<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UPDATE_ADM.aspx.cs" Inherits="YuvaConnect.UPDATE_ADM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
body {
    margin-top:40px;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
    color: #333;
}
 
/* Main Content */
.main-content {
    margin-left: 170px;
    padding: 20px;
}

.main-content .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}
 

.main-content .user-profile {
    display: flex;
    align-items: center;
}

.main-content .user-profile .profile-pic {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-right:30px;
}

.main-content .user-profile span { 
    margin: 0;
    font-size: 30px;
    color: #8B0000;
}

/* Profile Section */
.profile-section {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.profile-card {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 80%;
}

.profile-card h3 {
    margin-top: 0;
    margin-bottom: 20px;
    color: #8B0000;
}

.profile-details label {
    width:200px;
    margin-bottom: 5px;
    font-weight: bold;
}

.profile-details .form-input {
    width: 70%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    background-color: #f9f9f9;
}

.profile-details .form-input:disabled {
    background-color: #f0f0f0;
    color: #aaa;
}

.profile-card .btn-primary {
    display: inline-block;
    background-color: #8B0000;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    margin-right: 10px;
    transition: background-color 0.3s;
    margin-left:200px;
}

.profile-card .btn-primary:hover {
    background-color: #ff0000;
}

.profile-card .message {
    margin-top: 10px;
    font-size: 14px;
    color: green;
}

/* Responsive Design */
@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }

    .main-content {
        margin-left: 200px;
        padding: 15px;
    }

    .profile-card {
        width: 90%;
    }
}

@media (max-width: 480px) {
    .sidebar {
        width: 150px;
    }

    .main-content {
        margin-left: 150px;
        padding: 10px;
    }

    .sidebar ul li a {
        font-size: 14px;
    }
}
 
         .image_area {
    display: inline-block;
    width:369px;
    height: 455px;
    top:0px;
}
     </style>
      
        <!-- Main Content Section -->
        <div class="main-content">

            <div class="profile-section">
                <div class="profile-card">
                    <h3>User Information</h3>
                    <div class="profile-details">
                        <label> Name:</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input"></asp:TextBox>
                        <label>College Name:</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input"></asp:TextBox>
                        <label>Email:</label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input"></asp:TextBox> 
                        <label>Password:</label>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox> 

                    </div>
                    <asp:Button ID="Button2" runat="server" Text="Edit Profile" CssClass="btn-primary" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="Update Profile" CssClass="btn-primary" OnClick="Button3_Click" />
                    <asp:Label ID="Label13" runat="server" CssClass="message"></asp:Label>
                </div>
            </div>
        </div>


</asp:Content>
