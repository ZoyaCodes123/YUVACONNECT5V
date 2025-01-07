<%@ Page Title="Add New Event" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="NEW_EVENT.aspx.cs" Inherits="YuvaConnect.NEW_EVENT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 20px auto;
            font-family: Arial, sans-serif;
            max-width: 800px;
        }

        h1 {
            text-align: center;
            color: #801717;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            gap: 15px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-left:70px;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-group {
            flex: 1;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-control[type="date"],
        .form-control[type="time"] {
            padding: 6px;
        }

        .image-upload {
            text-align: center;
        }

        .img-preview {
            height: 100px;
            width: 100px;
            border-radius: 50%;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .file-upload {
            margin: 10px auto;
            width: 80%;
        }

        .btn-upload,
        .btn-submit {
            background-color: #801717;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-upload:hover,
        .btn-submit:hover {
            background-color: #a02020;
        } 
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>ADD NEW EVENT</h1>
    <div class="form-container">
        <div class="image-upload">
              <asp:Image ID="Image1" runat="server" CssClass="img-preview" AlternateText="No preview" ImageUrl="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" />
              <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" />
              <asp:Button ID="btnUpload" runat="server" Text="Save" CssClass="btn-upload" OnClick="btnsave_Click"/> 
              <div class="lbl_div">
                <asp:Label ID="lblmessage" runat="server" Text="Select a File to Upload." CssClass="lbl"/>
              </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="TextBox1">Event Name:</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="TextBox2">Stream:</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="TextBox3">Branch:</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="TextBox4">Location:</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="TextBox6">Start Date:</label>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="TextBox7">End Date:</label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="TextBox8">Start Time:</label>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="TextBox9">End Time:</label>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>

            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="TextBox12">Organiser Name:</label>
                <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="TextBox14">Type:</label>
                <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="TextBox13">Registration Form Link:</label>
                <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" TextMode="Url"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="TextBox5">Info:</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>

            </div>
        </div>

        <asp:Button ID="AddEvent" runat="server" Text="Add Event" CssClass="btn-submit" OnClick="AddEvent_Click" />
    </div>
</asp:Content>
