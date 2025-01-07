<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ALUMNI.aspx.cs" Inherits="YuvaConnect.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    h1{
       text-align: center; 
       font-size: 2.5rem; 
       color: #333;
       margin-bottom: 20px;
       margin-top:20px;
    }
        .profile-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); 
    gap: 20px;
    justify-items: center; 
    margin-top: 20px;
    margin-left:170px;
    margin-right:20px;
}


.profile-card {
    background-color: #ffffff;
    border: 2px solid #f28b82;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    padding: 20px;
    align-items: center;
    transition: transform 0.3s, box-shadow 0.3s;
    width: 100%; 
    box-sizing: border-box;
}

    .profile-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    }

/* Image container */
.image-container {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    border: 2px solid #f28b82;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 15px;
}

    .image-container img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

/* Profile details */
.profile-details h2 {
    margin: 10px 0;
    font-size: 22px;
    font-weight: bold;
    color: #333;
    text-align: center;
}

.profile-details p {
    margin: 5px 0;
    font-size: 14px;
    color: #555;
}

/* Skills container */
.skills-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    justify-content: center;
    margin-bottom: 15px;
}

    .skills-container .skill {
        display: inline-block;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
        margin: 5px;
        text-transform: capitalize;
        border: 3px solid #f28b82;
    }

    /* Additional button styles */
    .skills-container .skill-button {
        background-color: #f28b82;
        color: white;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
        text-transform: capitalize;
        border: 3px solid #f28b82;
        transition: transform 0.3s ease, background-color 0.3s ease;
    }

        .skills-container .skill-button:hover {
            background-color: #d16b5d;
            transform: translateY(-3px);
        }
    .skills-container .skill-button {
        background-color: #f28b82;
        color: white;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
        text-transform: capitalize;
        border: 3px solid #f28b82;
        transition: transform 0.3s ease, background-color 0.3s ease;
    }

        .skills-container .skill-button:hover {
            background-color: #d16b5d;
            transform: translateY(-3px);
        }

/* LinkedIn button styling */
.view-profile {
    display: inline-block;
    background-color: #E63946; /* LinkedIn blue */
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s, transform 0.3s ease-in-out;
}

    view-profile:hover {
        background-color: #005582; /* Darker blue for hover */
        transform: translateY(-3px); /* Lift effect on hover */
    }

    .view-profile:focus {
        outline: none;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.7); /* Focus effect */
    }

    .search-container {
    width: 100%; 
    display: flex;
    justify-content: center;
    justify-items: center;
    margin-top: 30px;
    margin-left:70px;
}

.search-wrapper {
    position: relative;
    width: 100%; 
}

.search-container .ddlDesignation{ 
    width:200px;
    height:32px;
}

#searchInput {
    width: 100%;
    padding: 8px 5px 8px 15px; 
    border-radius: 25px;
    border: 1px solid #ccc;
    font-size: 1rem;
}

.search-icon {
    position: absolute;
    top: 50%; 
    right: 5px; 
    transform: translateY(-50%);
    color: #333;
    font-size: 1.2rem;
} 
    </style>  
     <h1>ALUMNI PROFILES</h1>

<div class="search-container"  style="text-align: center;">
        <div class="search-wrapper"> 

        <asp:DropDownList ID="location" runat="server" CssClass="location">
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
    <asp:ListItem Text="India" Value="India" />
</asp:DropDownList>

<asp:DropDownList ID="ddlDesignation" runat="server" CssClass="ddlDesignation">
    <asp:ListItem Text="Select Designation" Value="" />
    <asp:ListItem Text="Software Engineer" Value="Software Engineer" />
    <asp:ListItem Text="Product Manager" Value="Product Manager" />
    <asp:ListItem Text="Investment Banker" Value="Investment Banker" />
    <asp:ListItem Text="Corporate Lawyer" Value="Corporate Lawyer" />
    <asp:ListItem Text="Economist" Value="Economist" />
    <asp:ListItem Text="Banker" Value="Banker" />
    <asp:ListItem Text="Data Scientist" Value="Data Scientist" />
    <asp:ListItem Text="Business Analyst" Value="Business Analyst" />
    <asp:ListItem Text="Mechanical Engineer" Value="Mechanical Engineer" />
    <asp:ListItem Text="Electrical Engineer" Value="Electrical Engineer" />
    <asp:ListItem Text="Civil Engineer" Value="Civil Engineer" />
    <asp:ListItem Text="Entrepreneur" Value="Entrepreneur" />
    <asp:ListItem Text="Doctor" Value="Doctor" />
    <asp:ListItem Text="Research Scientist" Value="Research Scientist" />
    <asp:ListItem Text="Digital Marketer" Value="Digital Marketer" />
    <asp:ListItem Text="Accountant" Value="Accountant" />
</asp:DropDownList>

     
            <asp:TextBox ID="searchInput" runat="server" Placeholder="Enter name to search"></asp:TextBox>
            <asp:TextBox ID="searchInput2" runat="server" Placeholder="Enter Company to search"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
</div>
        <div class="profile-container">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="profile-card">
                        <div class="image-container">
                            <img src='<%# Eval("IMAGE_URL") %>' alt="Profile Picture" />
                        </div>
                        <div class="profile-details">
                            <h2><%# Eval("NAME") %></h2>
                            <p><b>COMPANY: </b><%# Eval("COMPANY") %></p>
                            <p><b>DESIGNATION: </b><%# Eval("DESIGNATION") %></p>
                            <p><b>Location: </b><%# Eval("LOCATION") %></p>
                        </div>
                        <div class="skills-container">
                            <%# Eval("SKILL1") != null && Eval("SKILL1").ToString() != "" ? 
                                string.Join(" ", Eval("SKILL1").ToString().Split(',').Select(skill => $"<span class='skill'>{skill.Trim()}</span>")) : "" %> 
                        </div>
                        <asp:LinkButton CommandName="Select" CommandArgument='<%# Eval("ALUMNI_ID") %>' runat="server" CssClass="view-profile">
                            View Profile
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div> 

</asp:Content>
