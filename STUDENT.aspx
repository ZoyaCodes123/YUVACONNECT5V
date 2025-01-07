<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="STUDENT.aspx.cs" Inherits="YuvaConnect.STUDENT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <title>Student Profiles</title>
    <style>
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

    </style>  
    <h1  style="text-align:center">STUDENT PROFILES</h1>
<div class="search-container"  style="text-align: center;">
<asp:DropDownList ID="ddlStreams" runat="server" CssClass="ddlStreams">
    <asp:ListItem Text="Select Stream" Value="" />
    <asp:ListItem Text="Engineering" Value="Engineering" />
    <asp:ListItem Text="Science" Value="Science" />
    <asp:ListItem Text="Commerce" Value="Commerce" />
    <asp:ListItem Text="Arts" Value="Arts" />
    <asp:ListItem Text="Management" Value="Management" />
    <asp:ListItem Text="Law" Value="Law" />
    <asp:ListItem Text="Medical" Value="Medical" />
    <asp:ListItem Text="Pharmacy" Value="Pharmacy" />
    <asp:ListItem Text="Architecture" Value="Architecture" />
    <asp:ListItem Text="Education" Value="Education" />
    <asp:ListItem Text="Agriculture" Value="Agriculture" />
    <asp:ListItem Text="Vocational Studies" Value="Vocational Studies" />
    <asp:ListItem Text="Performing Arts" Value="Performing Arts" />
</asp:DropDownList>

<asp:DropDownList ID="ddlBranches" runat="server" CssClass="ddlBranches">
    <asp:ListItem Text="Select Branch" Value="" />
    <asp:ListItem Text="Computer Science" Value="Computer Science" />
    <asp:ListItem Text="Information Technology" Value="Information Technology" />
    <asp:ListItem Text="Electronics and Communication" Value="Electronics and Communication" />
    <asp:ListItem Text="Mechanical Engineering" Value="Mechanical Engineering" />
    <asp:ListItem Text="Civil Engineering" Value="Civil Engineering" />
    <asp:ListItem Text="Electrical Engineering" Value="Electrical Engineering" />
    <asp:ListItem Text="Chemical Engineering" Value="Chemical Engineering" />
    <asp:ListItem Text="Biotechnology" Value="Biotechnology" />
    <asp:ListItem Text="Aeronautical Engineering" Value="Aeronautical Engineering" />
    <asp:ListItem Text="Physics" Value="Physics" />
    <asp:ListItem Text="Chemistry" Value="Chemistry" />
    <asp:ListItem Text="Mathematics" Value="Mathematics" />
    <asp:ListItem Text="Zoology" Value="Zoology" />
    <asp:ListItem Text="Botany" Value="Botany" />
    <asp:ListItem Text="Biochemistry" Value="Biochemistry" />
    <asp:ListItem Text="Microbiology" Value="Microbiology" />
    <asp:ListItem Text="Accounting" Value="Accounting" />
    <asp:ListItem Text="Finance" Value="Finance" />
    <asp:ListItem Text="Marketing" Value="Marketing" />
    <asp:ListItem Text="Human Resources" Value="Human Resources" />
    <asp:ListItem Text="English" Value="English" />
    <asp:ListItem Text="History" Value="History" />
    <asp:ListItem Text="Psychology" Value="Psychology" />
    <asp:ListItem Text="Sociology" Value="Sociology" />
    <asp:ListItem Text="Political Science" Value="Political Science" />
    <asp:ListItem Text="MBBS" Value="MBBS" />
    <asp:ListItem Text="BDS" Value="BDS" />
    <asp:ListItem Text="Nursing" Value="Nursing" />
    <asp:ListItem Text="Physiotherapy" Value="Physiotherapy" />
    <asp:ListItem Text="Law" Value="Law" />
    <asp:ListItem Text="Pharmacy" Value="Pharmacy" />
    <asp:ListItem Text="Architecture" Value="Architecture" />
</asp:DropDownList>
     <asp:TextBox ID="searcgSkill" runat="server" Placeholder="Enter Skill to search"></asp:TextBox> 
     <asp:TextBox ID="searchInput" runat="server" Placeholder="Enter name to search"></asp:TextBox> 
     <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
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
                            <p>Branch: <%# Eval("BRANCH") %></p>
                            <p>Stream: <%# Eval("STREAM") %></p>
                        </div>
                        <div class="skills-container">
                           <%# Eval("SKILL1") != null && Eval("SKILL1").ToString() != "" ? 
                            string.Join(" ", Eval("SKILL1").ToString().Split(',').Select(skill => $"<span class='skill'>{skill.Trim()}</span>")) : "" %> 
                         </div>
                        <asp:LinkButton CommandName="Select" CommandArgument='<%# Eval("STUDENT_ID") %>' runat="server" CssClass="view-profile">
                            View Profile
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div> 

    </asp:Content>