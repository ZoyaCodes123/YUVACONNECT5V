<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ALUMNI_SIGNUP.aspx.cs" Inherits="YuvaConnect.ALUMNI_SIGNUP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
* {
  font-family: Arial, sans-serif;
  background-size: cover;
}

.wizard-container {
  width: 70%;
  margin: 0px auto;
  background: #fff;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.wizard-header { 
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align:center;
    margin-top:10px;
    letter-spacing:2px;
} 
 
.wizard-step { 
    height:300px;
    width:900px;
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

.form-section { 
    height:300px;
    width:500px;
}

.form-row1 {  
  width:650px;
  display: flex;
  gap: 20px;
  margin-bottom: 15px;
}

.form-row {  
  width:900px;
  display: flex;
  gap: 20px;
  margin-bottom: 15px;
}

.form-group {
  flex: 1;
}

.form-group label {
  font-weight: bold;
  margin-bottom: 5px;
  display: block;
}

.form-control { 
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}


.image-upload { 
  width: 200px; 
  text-align: center;
}

.img-preview {
  height: 100px;
  width: 100px;
  border-radius: 50%;
  border: 1px solid #ccc;
  margin-bottom: 15px; 
}

.file-upload {
  height:25px;
  width:200px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius:5px;
}

.btn-upload {
  background-color: #801717;
  color: white;
  padding:5px 10px;
  border: none; 
  cursor: pointer;
}

.btn-upload:hover {
  background-color: #a02020;
}

.lbl_div{
    margin-top:10px;
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

.wizard-navigation {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align:center;
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
    margin:0;
}

.wizard-navigation .wizard-step:hover {
    background-color: #e9ecef; /* Light hover effect */
    border-color: #ddd; /* Slightly visible border on hover */
}
.wizard-navigation .wizard-step a{
    color:#801717;
    text-decoration:none;
    width:100%;
}
.wizard-navigation .wizard-step.active {
    color: #fff; /* White text for active step */
    background-color: #e9ecef; /* Highlighted active background */
    border-color: #801717; /* Border matches background */
    font-weight: bold;
    border-bottom: none; /* Seamless connection with content below */
} 

.wizard-navigation .wizard-step.disabled {
    color: #fff; /* Disabled text color */
    cursor: not-allowed; /* Indicate it's unclickable */
    pointer-events: none; /* Prevent interaction */
} 

.step-content {
    margin-top: 20px; 
}
#collegeName{
    width: 200px;
}

 </style>
 
    <h1 class="wizard-header">ALUMNI REGISTRATION</h1> 
    <div class="wizard-container">  
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


   <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false" OnActiveStepChanged="Wizard1_ActiveStepChanged" OnFinishButtonClick="Wizard1_FinishButtonClick">  
    <NavigationButtonStyle CssClass="btns" />
       <WizardSteps>
 <asp:WizardStep ID="Step1" Title="Personal Details" runat="server">
    <div class="wizard-step">
    <div class="form-section">
      <div class="form-row1">
        <div class="form-group">
          <label for="txtFirstName">First Name:</label>
          <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
          <label for="txtLastName">Last Name:</label>
          <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
      </div>
      <div class="form-row1">
        <div class="form-group">
          <label for="txtUsername">Username:</label>
          <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
          <label for="txtEmail">Email:</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Invalid email format." CssClass="error"></asp:RegularExpressionValidator>

        </div>
      </div>
        <div class="form-row1">
    <div class="form-group">
      <label for="txtPassword">Password:</label>
      <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ValidationExpression="^.{5,8}$" ErrorMessage="Password must be at least 8 characters long." CssClass="error" ForeColor="Red"></asp:RegularExpressionValidator>
                    
    </div>
  </div>
      <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Show password" />
</div>
    <div class="image-upload">
      <asp:Image ID="Image1" runat="server" CssClass="img-preview" AlternateText="No preview" ImageUrl="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" />
      <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload"/>
      <asp:Button ID="btnUpload" runat="server" Text="Save" CssClass="btn-upload" OnClick="btnsave_Click"/> 
      <div class="lbl_div">
      <asp:Label ID="lblmessage" runat="server" Text="Select a File to Upload." CssClass="lbl"/>
      </div>
    </div>
  </div> 
</asp:WizardStep>
                 
 <asp:WizardStep ID="Step2" Title="Academic Details" runat="server">
  <div class="wizard-step">
    <div class="form-section">
      <div class="form-row">
        <div class="form-group">
          <label for="txtStream">Stream:</label>
          <asp:TextBox ID="txtStream" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvStream" runat="server" ControlToValidate="txtStream" ErrorMessage="Stream is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
          <label for="txtBranch">Branch:</label>
          <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="txtBranch" ErrorMessage="Branch is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
                    
        </div>
      </div>
      <div class="form-row">
        <div class="form-group">
          <label for="txtBatchYear">Batch Year:</label>
          <asp:TextBox ID="txtBatchYear" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtBatchYear" ErrorMessage="Year of Graduation is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RangeValidator ID="rvYear" runat="server" ControlToValidate="txtBatchYear" MinimumValue="1900" MaximumValue="2100" Type="Integer" ErrorMessage="Enter a valid year." CssClass="error" ForeColor="Red"></asp:RangeValidator>

        </div>
        <div class="form-group">
            <label for="txtBatchYear">Enrollment Number:</label>
            <asp:TextBox ID="txtEnroll" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEnroll" runat="server" ControlToValidate="txtEnroll" ErrorMessage="Enrollment No. Required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEnroll" runat="server" ControlToValidate="txtEnroll" ValidationExpression="^.{1,10}$" ErrorMessage="Should be Less than 10" CssClass="error" ForeColor="Red"></asp:RegularExpressionValidator>

        </div>
      </div>
      <div class="form-row"> 
        <div class="form-group">
          <label for="txtCollege">College:</label> 
            <asp:DropDownList ID="collegeName" runat="server" CssClass="form-control">
            <asp:ListItem Text="Select Location" Value="" />
            <asp:ListItem Text="AISHWARYA COLLEGE OF EDUCATION" Value="AISHWARYA COLLEGE OF EDUCATION" />
            <asp:ListItem Text="LUCKY INSTITUTE OF PROFESSIONAL STUDIES" Value="LUCKY INSTITUTE OF PROFESSIONAL STUDIES" />
            <asp:ListItem Text="MAHILA PG MAHAVIDHYALAYA" Value="MAHILA PG MAHAVIDHYALAYA" />
            <asp:ListItem Text="GD MEMORIAL COLLEGE" Value="GD MEMORIAL COLLEGE" />
            <asp:ListItem Text="BM LAW COLLEGE" Value="BM LAW COLLEGE" /> 
            <asp:ListItem Text="CHOPASNI TEACHERS TRAINING COLLEGE" Value="CHOPASNI TEACHERS TRAINING COLLEGE" />
</asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ControlToValidate="collegeName" InitialValue=""  ErrorMessage="Please select a college." ForeColor="Red"/>
        </div>
      </div>
    </div>
  </div>
</asp:WizardStep>
 
<asp:WizardStep ID="Step3" Title="Professional Details" runat="server">
  <div class="wizard-step">
    <div class="form-section">
      <div class="form-row">
        <div class="form-group">
          <label for="txtCompany">Company Name:</label>
          <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompany" ErrorMessage="Branch is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
          <label for="txtDesignation">Designation:</label>
          <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesignation" ErrorMessage="Branch is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>
           
        </div>
      </div>
      <div class="form-row">
        <div class="form-group">
          <label for="txtLocation">Location:</label>
<asp:DropDownList ID="location" runat="server" CssClass="form-control">
    <asp:ListItem Text="Select Location" Value="" />
    <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
    <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
    <asp:ListItem Text="Assam" Value="Assam" />
    <asp:ListItem Text="Bihar" Value="Bihar" />
    <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
    <asp:ListItem Text="Goa" Value="Goa" />
    <asp:ListItem Text="Gujarat" Value="Gujarat" />
    <asp:ListItem Text="Haryana" Value="Haryana" />
    <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
    <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
    <asp:ListItem Text="Karnataka" Value="Karnataka" />
    <asp:ListItem Text="Kerala" Value="Kerala" />
    <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
    <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
    <asp:ListItem Text="Manipur" Value="Manipur" />
    <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
    <asp:ListItem Text="Mizoram" Value="Mizoram" />
    <asp:ListItem Text="Nagaland" Value="Nagaland" />
    <asp:ListItem Text="Odisha" Value="Odisha" />
    <asp:ListItem Text="Punjab" Value="Punjab" />
    <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
    <asp:ListItem Text="Sikkim" Value="Sikkim" />
    <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
    <asp:ListItem Text="Telangana" Value="Telangana" />
    <asp:ListItem Text="Tripura" Value="Tripura" />
    <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
    <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
    <asp:ListItem Text="West Bengal" Value="West Bengal" />
    <asp:ListItem Text="Andaman and Nicobar Islands" Value="Andaman and Nicobar Islands" />
    <asp:ListItem Text="Chandigarh" Value="Chandigarh" />
    <asp:ListItem Text="Dadra and Nagar Haveli and Daman and Diu" Value="Dadra and Nagar Haveli and Daman and Diu" />
    <asp:ListItem Text="Delhi" Value="Delhi" />
    <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
    <asp:ListItem Text="Ladakh" Value="Ladakh" />
    <asp:ListItem Text="Lakshadweep" Value="Lakshadweep" />
    <asp:ListItem Text="Puducherry" Value="Puducherry" />
</asp:DropDownList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="location" InitialValue=""  ErrorMessage="Please select your current location." ForeColor="Red"/>
        
        </div>  
      </div>
    </div>
  </div>
</asp:WizardStep>

<asp:WizardStep ID="Step4" Title="Skills" runat="server">
  <div class="wizard-step">
    <div class="form-section">
      <div class="form-row">
        <div class="form-group">
          <label for="txtSkill1">Skill 1:</label>
          <asp:TextBox ID="txtSkill1" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
          <label for="txtSkill2">Skill 2:</label>
          <asp:TextBox ID="txtSkill2" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group">
          <label for="txtSkill3">Skill 3:</label>
          <asp:TextBox ID="txtSkill3" runat="server" CssClass="form-control"></asp:TextBox>
        </div> 
        <div class="form-group">
          <label for="txtLinkedIn">LinkedIn URL:</label>
          <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLinkedIn" ErrorMessage="Branch is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
      </div>
      <div class="form-row">
        <div class="form-group">
          <label for="txtAbout">About:</label>
          <asp:TextBox ID="txtAbout" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAbout" ErrorMessage="Branch is required." CssClass="error" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
      </div>
    </div>
  </div>
</asp:WizardStep>

                 
<asp:WizardStep ID="Step5" Title="Done" runat="server">
  <div class="wizard-step">
    <div class="form-section">
        <div class="form-group">
            <div class="wizard-step-title">
                <h5>Thank you for Registering!</h5>
            </div>
            <hr />
            <p>Note : Your Registration Request as been forwarded to your College Admin, We'll let you know once your request gets approved</p>
            <p>The Confirmation Mail will be sent to Email ID that your specified for Registration</p>
        </div>
      </div>
    </div> 
</asp:WizardStep>

</WizardSteps>
</asp:Wizard> 
        </div>
</asp:Content>
