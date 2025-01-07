<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="COLLEGE_REGISTRATION.aspx.cs" Inherits="YuvaConnect.COLLEGE_REGISTRATION" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 

    <style>
        * {
            font-family: Arial, sans-serif;
            background-size: cover;
        }

        body {
            margin: 0px;
            padding: 0px;
            background-color: rgba(0, 0, 0, 0.1) !important;
        }

        .clg-regis-box {
            display: inline-block;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            background: #fff;
            padding: 20px;
            width: 800px;
            height: 500px;
        }

        .clg-content {
            width: 720px;
            height: 330px;
        }

        .clg-details {
            display: inline-block;
            width: 60%;
            padding-top: 20px;
        }

            .clg-details label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

        .clg-img-box {
            display: inline-block;
            text-align: center;
            width: 38%;
            height: 73%;
            padding-top: 20px;
            vertical-align: top;
            margin-left:10px;
        }

            .clg-img-box img {
                border-radius: 50%;
                border: 1px solid #ccc;
                width: 100px;
                height: 100px;
            }

        .admin-content {
            width: 720px;
            height: 330px;
        }

        .admin-details {
            display: inline-block;
            width: 60%;
            padding-top: 20px;
        }

            .admin-details label {
                font-weight: bold;
                margin-bottom: 5px;
            }

        .admin-img-box {
            display: inline-block;
            text-align: center;
            width: 38%;
            padding-top: 20px;
            vertical-align: top;
        }

            .admin-img-box img {
                border-radius: 50%;
                border: 1px solid #ccc;
                height: 100px;
                width: 100px;
            }

        .wizard-header {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            margin-top: 10px;
            letter-spacing: 2px;
        }

        .wizard-container {
            width: 70%;
            margin: 0px auto;
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .wizard-step {
            height: 300px;
            width: 900px;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .wizard-navigation {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-color: #f8f9fa; /* Light gray background */
            border-bottom: 1px solid #ddd; /* Subtle bottom border */
            list-style: none; /* Remove bullets */
            margin: 0;
        }

            .wizard-navigation .wizard-step {
                height: 50px; /* Set consistent button height */
                line-height: 50px; /* Align text vertically */
                font-size: 16px; /* Larger text for readability */
                font-weight: 500;
                color: #fff; /* Neutral text color for inactive steps */
                text-align: center;
                text-decoration: none; /* Remove underline for links */
                border: 1px solid transparent; /* Base border for hover effect */
                border-radius: 5px 5px 0 0; /* Rounded top corners for classic tab effect */
                background-color: transparent; /* Transparent inactive background */
                cursor: pointer;
                margin: 0;
            }

                .wizard-navigation .wizard-step:hover {
                    background-color: #e9ecef; /* Light hover effect */
                    border-color: #ddd; /* Slightly visible border on hover */
                }

                .wizard-navigation .wizard-step a {
                    color: #801717;
                    text-decoration: none;
                    width: 100%;
                }

                .wizard-navigation .wizard-step.active {
                    color: #fff; /* White text for active step */
                    background-color: #e9ecef; /* Highlighted active background */
                    border-color: #801717; /* Border matches background */
                    font-weight: bold;
                    border-bottom: none; /* Seamless connection with content below */
                }


        .btns {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #801717;
            color: white;
            border: none;
            cursor: pointer;
        }

            .btns:hover {
                background-color: #a02020;
            }

        .btn-upload {
            background-color: #801717;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }

            .btn-upload:hover {
                background-color: #a02020;
            }

        .file-upload {
            height: 40px;
            width: 200px;
            margin-bottom: 15px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-row {
            width: 100%;
            display: flex;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
        }

        .form-control {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="wizard-header">COLLEGE REGISTRATION</h1>
    <div style="display: flex; justify-content: center; align-items: center;">
        <div class="clg-regis-box">
            <div class="wizard-navigation">
                <asp:Repeater ID="WizardStepsRepeater" runat="server" OnItemCommand="WizardStepsRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class='wizard-step <%# ((Wizard1.ActiveStepIndex == Container.ItemIndex) ? "active" : "") %>'>
                            <asp:LinkButton ID="LK" CommandName="GoToStep" CommandArgument='<%# Container.ItemIndex %>' runat="server">
                    <%# Container.DataItem %>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:Wizard ID="Wizard1" runat="server" Height="370px" Width="550px" ActiveStepIndex="0" FinishCompleteButtonText="Submit" DisplaySideBar="False" OnActiveStepChanged="Wizard1_ActiveStepChanged" OnFinishButtonClick="Wizard1_FinishButtonClick1">
                <NavigationButtonStyle CssClass="btns" />
                <WizardSteps>
                    <asp:WizardStep runat="server" Title="College Details">
                        <div class="clg-content">
                            <div class="clg-details">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="txtclgname">College Name:</label>
                                        <asp:TextBox ID="txtclgname" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtclgname" ErrorMessage="College Name is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div> 
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="txtclg_web">Website:</label>
                                        <asp:TextBox ID="txtclg_web" runat="server" TextMode="Url" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtclg_web" ErrorMessage="Website URL Name is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="txtclg_address">Address:</label>
                                        <asp:TextBox ID="txtclg_address" runat="server" CssClass="form-control" TextMode="MultiLine" Height="45px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtclg_address" ErrorMessage="Address is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="clg-img-box">
                                <asp:Image ID="Image1" runat="server" AlternateText="Add College Photo" BackColor="#FFC6C6" ImageUrl="https://cdn.pixabay.com/photo/2017/11/10/04/47/image-2935360_1280.png" />
                                <br />
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" />
                                <br />
                                <asp:Button ID="btnupload" runat="server" OnClick="btnupload_Click" Text="Upload" CssClass="btn-upload" />
                                <br />
                                <br />
                                <asp:Label ID="lblimg_message1" runat="server" Text="College logo to be uploaded here."></asp:Label>
                            </div>
                        </div>
                    </asp:WizardStep>

                    <asp:WizardStep runat="server" Title="Admin Details">
                        <div class="admin-content">
                            <div style="text-align:center; margin-top:5px;">
                                <asp:Label ID="lblmessage" runat="server"></asp:Label>
                            </div>
                            <div class="admin-details">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="txtadm_name">Full Name:</label><br />
                                        <asp:TextBox ID="txtadm_name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtadm_name" ErrorMessage="Full Name of Adminn is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="txtadm_email">Email Address:</label><br />
                                        <asp:TextBox ID="txtadm_email" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtadm_email" ErrorMessage="Email of Adminn is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtadm_email" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Invalid email format." CssClass="error"></asp:RegularExpressionValidator>

                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="txtadm_pass">Password:</label><br />
                                        <asp:TextBox ID="txtadm_pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtadm_pass" ErrorMessage="Password is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtadm_pass" ValidationExpression="^.{5,8}$" ErrorMessage="Password must be at least 8 characters long." CssClass="error" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <div style="margin: 8px 0px;">
                                            <asp:CheckBox ID="checkadm_pass" runat="server" AutoPostBack="True" Text="Show Password" OnCheckedChanged="checkadm_pass_CheckedChanged" />
                                        </div>
                                    </div>
                                </div>

                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </div>

                            <div class="admin-img-box">
                                <asp:Image ID="adm_profile" runat="server" ImageUrl="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" />
                                <br />
                                <br />
                                <asp:FileUpload ID="FileUpload2" runat="server" CssClass="file-upload" />
                                <br />
                                <asp:Button ID="btnadm_img" runat="server" Text="Upload" OnClick="btnadm_img_Click" CssClass="btn-upload" />
                                <br />
                                <br />
                                <asp:Label ID="lblimg_message2" runat="server" Text="Select a profile to be uploaded."></asp:Label>
                            </div>

                        </div>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
            <br />
            <br />
            <br />

            <br />
        </div>
    </div>
</asp:Content> 
