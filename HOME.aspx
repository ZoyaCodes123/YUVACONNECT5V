<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HOME.aspx.cs" Inherits="YuvaConnect.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>; 
        * {
    font-family: poppins;
}
        body{
            background-color: rgba(0, 0, 0, 0.1)
        }
/* outernav */
.navbar {
    background-color: rgba(139, 0, 0, 0.8) !important;
    height: 80px;
    width: 100%;
    backdrop-filter:blur(5px) !important;
    -webkit-backdrop-filter: blur(5px) !important; 
}

.logo {
    height: 60px;
    width: 60px;
    margin-left: 20px;
    border-radius: 50%;
    border: 2px black solid;
    box-shadow: 0px 0px 10px 5px rgba(219, 214, 214, 0.25);
}
/* innernav */
.navbar-nav {
    width: 100%;
    display: flex;
    justify-content: flex-end;
    gap:20px;
    letter-spacing:1px;
}

.nav-link {
    color: #F5F5DC !important;
    font-weight: lighter !important;
    font-size: 23px; 
}

    .nav-link:hover {
        color: #F5F5DC !important;
        font-size: 24px; 
        box-shadow: #8B0000;
    }
     

/* main */

.main {
    height: 100%;
    width: 100vw;
    background-color: rgba(219, 214, 214, 0.25);
}

.video-container {
    position: relative;
    width: 100%;
    height: 100vh; /* Full viewport height */
    overflow: hidden;
    z-index: 1; /* Keep it behind other content */
    margin-top: -27px; /* Adjust for navbar gap if needed */
}
.video-container video {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    height: 100%;
    object-fit: cover; /* Ensures video fills the container while maintaining aspect ratio */
    z-index: 1;
    clip-path: inset(0 0 80px 0);
}
.main .video-container video {
    width: 100%;
    height: 100%;  
} 
 
    .services{
        height:500px;
        width:100%;
        background-color:yellow;
    }

    .services img{
        height:100px;
        width:100px;
    }

    .about_us {
        height: 300px;
        width: 80%;
        margin-left: 10vw;
        background-color: transparent;
        z-index: 10;
        position: relative;
        border-radius: 20px;
    }

    .about_us h1 {
        z-index: 9;
        color: #8B0000;
        text-align: center;
        font-size: 50px;
        margin-top: 20px;
        padding-top: 20px;
        text-decoration: underline;
    }

    .about_us p {
        text-align: center;
        color: #8B0000;
        font-size: large;
        margin-top: 30px;
        margin-left: 10px;
        margin-right: 10px;
    }
 

    .intro {
        height: 550px;
        width: 80%;
        margin-top: 50px;
        margin-left: 10vw; 
        z-index: 10;
        border-radius: 20px;
    }

    .intro h1 {
        color: #8B0000;
        text-align: center;
        margin-top: 20px;
        padding-top: 20px;
        text-decoration: underline;
    }
 
/* colleges */
    .colleges {
        height: 300px;
        width: 100%;  
        display: flex;
        flex-direction: row;
        justify-items: center;
        align-items: center; 
        flex-wrap: wrap;
        border: 1px solid transparent;
    }

    .colleges .college_heading h1 { 
        text-align: center;
        color: #8B0000;
        height: 70px;
        width: 100%; 
    }

    .colleges .college_logo {
        height: 130px;
        width: 80%;  
        mix-blend-mode: multiply;
        display: flex;
        flex-direction: row;
        justify-items: center;
        align-items: center;
        align-content: space-evenly;
        justify-content: space-evenly;
        flex-wrap: wrap;
    }

    .clg_logo {
        margin: 15px;
    }

    .clg_logo img {
        height: 130px;
        width: 130px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .slider{
        height:500px;
        width:100%;
        display: flex;
        flex-direction: row;
        justify-items: center;
        align-items: center;
        align-content: space-evenly;
        justify-content: space-evenly;
        flex-wrap: wrap;
        gap:50px;
    }

    .slider .item:hover{
            box-shadow: 0 0 20px 10px #e86262;
            transform: scale(1.05);
    }

        .ourServices h1 {
        text-align: center;
        color: #8B0000;
        height: 70px;
        width: 100%; 
        margin-top:40px;
        } 

    .ourServices .slider .item img{
        height:220px;
        width:220px;
        margin:15px;
        border-radius:20px;
    }
    .ourServices .slider .item{
        border-radius:20px;

    }
        .slider-track {
            display: flex;
            animation: scroll 20s linear infinite;
            width: calc(200%); /* Double the content width for seamless loop */
        }
         
    

        @keyframes scroll {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-50%);
            }
        }

/* footer */
    .card {
        margin-top:100px;
        background-color: #8B0000 !important;
    }

    footer .card {
        height: 250px !important;
        color: #F5F5DC !important;
        border-radius: 0;
    }

    </style>
 <div class="main"><br/>
 <div class="video-container">
    <video autoplay loop muted src="WELCOME TO YUVA CONNECT_20241008_115239_0001.mp4"></video>
 </div>
 <div class="about_us">
 <h1>About Us</h1>
 <p>
 <b>YuvaConnect is dedicated to serving over 30+ colleges 
based in Jodhpur, affiliated with the Jai Narain Vyas University 
(JNVU)</b>. <br>This platform is designed to foster connections 
between students and alumni, creating a supportive community 
focused on career development.
 YuvaConnect provides students with access to valuable 
advice and guidance from graduates who have navigated their 
industries. By leveraging alumni insights, students can gain 
direction and make informed decisions about their career paths. 
Additionally, alumni have the opportunity to connect with one 
another, sharing experiences and updates on their professional 
journeys.
 To further strengthen these connections, YuvaConnect 
organizes webinars and in-person events. These gatherings not only 
enhance networking opportunities but also promote personal growth 
and engagement within the community.
 If this is your first visit to YuvaConnect, we hope this 
introduction helps you understand how the platform works and how 
it can benefit you. For any questions or further information, 
please don’t hesitate to reach out to us via the email or contact 
number provided.
 </p>
 </div>
 <div class="colleges">
     <div class="college_heading">
        <h1>Over 30+ JNVU affiliated Colleges</h1>
     </div>
     <div class="college_logo">
        <div class="slider-track">
         <div class="clg_logo"><img src="HomeImages/c1.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c2.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c3.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c4.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c5.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c6.jpeg" alt=""></div>
         <div class="clg_logo"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAod0HwXuA_8wMyWnR35FDws_8mTqXgb-2CA&s" alt=""></div>
         <div class="clg_logo"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31Wgxcb2qE6ZJYnUTh5OjMAf0n6AapzCIcm2hYobnzpp263HGV7o3LuyDd7SN0SGIRKE&usqp=CAU" alt=""></div>
         <div class="clg_logo"><img src="https://somanicollege.co.in/osc/wp-content/uploads/2023/09/cropped-logo-1.png" alt=""></div>

         <div class="clg_logo"><img src="HomeImages/c1.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c2.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c3.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c4.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c5.jpeg" alt=""></div>
         <div class="clg_logo"><img src="HomeImages/c6.jpeg" alt=""></div>
         <div class="clg_logo"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAod0HwXuA_8wMyWnR35FDws_8mTqXgb-2CA&s" alt=""></div>
         <div class="clg_logo"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31Wgxcb2qE6ZJYnUTh5OjMAf0n6AapzCIcm2hYobnzpp263HGV7o3LuyDd7SN0SGIRKE&usqp=CAU" alt=""></div>
         <div class="clg_logo"><img src="https://somanicollege.co.in/osc/wp-content/uploads/2023/09/cropped-logo-1.png" alt=""></div>
        </div>
 </div> 
 </div>
 

<div class="ourServices"> 
    <h1>Our Services</h1>  
    <div class="slider">
            <div class="item"><img src="HomeImages/7.png" alt="Image 7"></div>
            <div class="item"><img src="HomeImages/8.png" alt="Image 7"></div> 
            <div class="item"><img src="HomeImages/9.png" alt="Image 7"></div>
            <div class="item"><img src="HomeImages/10.png" alt="Image 7"></div>
            <div class="item"><img src="HomeImages/11.png" alt="Image 7"></div>
            <div class="item"><img src="HomeImages/12.png" alt="Image 7"></div>
            <div class="item"><img src="HomeImages/13.png" alt="Image 7"></div>
            <div class="item"><img src="HomeImages/14.png" alt="Image 7"></div>
            
       </div>
</div>

<footer>
 <div class="card text-center">
 <br><br><br><br>
 <div class="card-header">Connect with your Alumni!</div>
 <div class="card-footer">Powered by Dream Team</div>
 </div>
</footer> 
</asp:Content>
