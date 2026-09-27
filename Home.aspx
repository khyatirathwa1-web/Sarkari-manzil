<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sarkari Manzil</title>

    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-42BV31K6VJ"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'G-42BV31K6VJ');
    </script>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0a2240;
            color: white;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px;
            height: 60px;
        }

        .menu-btn {
            font-size: 35px;
            cursor: pointer;
            margin-left: 10px;
        }

        .sidebar {
            width: 0px;
            overflow: hidden;
            background: #e8f0ff;
            position: fixed;
            top: 60px;
            left: 0;
            height: calc(100vh - 60px);
            transition: 0.3s;
            z-index: 900;
        }

            .sidebar.show {
                width: 250px;
            }

        .sidebar-btn {
            display: block;
            padding: 15px 20px;
            font-size: 18px;
            width: 100%;
            text-align: left;
            background: #ffffff;
            border-bottom: 1px solid #ccc;
            cursor: pointer;
            color: #333;
            text-decoration: none;
        }

            .sidebar-btn:hover {
                background: #f0f0f0;
                color: #000;
            }

        .title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
        }

        .btn-box {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            margin-bottom: 12px; /* 🔥 gap control */
        }


        .main-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
        }

        .main-btn {
            background: white;
            color: black;
            border-radius: 10px;
            padding: 10px;
            font-size: 20px;
            border-bottom: 6px solid #f393c2;
            cursor: pointer;
            text-align: center;
            font-weight: bold;
        }

        .top-buttons {
            display: flex;
        }

        .top-button {
            background: linear-gradient(45deg, red, orange);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            margin-bottom: 15px;
        }

            /* 🔥 MAIN MAGIC LINE */
            .top-button:last-child {
                margin-left: auto;
            }

        .image-container {
            position: relative;
            width: 100%;
        }

            .image-container img {
                width: 100%;
                border-radius: 12px;
            }

        .overlay-buttons {
            position: absolute;
            top: 42%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            cursor: pointer;
        }



        .row {
            width: 100%;
            margin: 20px auto;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }



        .sidebar-btn.active {
            background-color: #ff0080; /* active button background */
            color: white; /* text color */
            font-weight: bold;
        }



        .contact-btn {
            background: linear-gradient(45deg, #ff0080, #ff8c00);
            color: white !important;
            font-weight: bold;
            border-radius: 50px !important;
            padding: 12px 20px !important;
            border: none;
            animation: glow 1.5s infinite alternate;
            box-shadow: 0 5px 15px rgba(255, 0, 90, 0.6);
            transform: scale(1.05);
        }

        @keyframes glow {
            0% {
                box-shadow: 0 5px 15px rgba(255, 0, 90, 0.4);
            }

            100% {
                box-shadow: 0 5px 25px rgba(255, 0, 90, 0.9);
            }
        }

        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 50%;
            background: rgba(0,0,0,0.6);
            display: none;
            justify-content: center;
            align-items: center;
        }



        .popup-box {
            background: white;
            padding: 50px;
            border-radius: 8px;
            width: 300px;
            text-align: center;
        }


        .close-btn {
            background: #444;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 15px;
        }

        .contact-number {
            font-size: 26px;
            font-weight: bold;
            margin: 12px 0;
            color: #ffe600;
        }

        .close-btn {
            background: red;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
        }

        .breaking {
            display: inline-block;
            font-weight: bold;
            font-size: 20px;
            color: white;
            border: 2px solid red;
            padding: 10px 20px;
            cursor: pointer;
            text-align: center;
        }

        .emoji {
            display: inline-block;
            animation: emojiColor 1s linear infinite;
        }

        @keyframes emojiColor {
            0% {
                filter: hue-rotate(0deg);
            }

            100% {
                filter: hue-rotate(360deg);
            }
        }

        .latest-news-box {
            width: 60%;
            max-width: 800px;
            margin: 10px auto; /* 🔥 gap fix */
            border-radius: 14px;
            overflow: hidden;
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.35);
        }

        .top-button:last-child {
            margin-right: right;
        }


        /* top dark header */
        .news-header {
            background: #0b2d4a;
            padding: 12px;
            font-weight: bold;
            text-align: center;
            letter-spacing: 1px;
        }

        /* transparent inner area */
        .news-body {
            height: 120px; /* 👈 visible area */
            overflow: hidden; /* 👈 scrollbar hide */
            padding: 100px;
            position: relative;
        }


        /* each update */
        .news-item {
            background: rgba(255,255,255,0.75);
            border-radius: 10px;
            padding: 10px 10px;
            margin-bottom: 10px;
            text-align: center;
            min-height: 50px;
            width: 100%;
            /* 👈 yahan control karo */
        }

        /* short description */
        .news-text {
            color: #222;
            font-size: 14px;
            margin-bottom: 6px;
        }

        /* link under description */
        .news-link {
            font-size: 13px;
            color: #0056ff;
            font-weight: bold;
            text-decoration: none;
        }

            .news-link:hover {
                text-decoration: underline;
            }

        .news-scroll {
            display: flex;
            flex-direction: column;
            animation: scrollUp 10s linear infinite;
        }

        @keyframes scrollUp {
            0% {
                transform: translateY(100%);
            }

            100% {
                transform: translateY(-100%);
            }
        }

        /* hover par pause (optional but pro) */
        .news-body:hover .news-scroll {
            animation-play-state: paused;
        }




        .social-box {
            width: 70%;
            margin: 20px auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            font-weight: bold;
        }



        .social-btn:hover {
            background: white;
            transform: scale(1.05);
        }



        .social-btn {
            background: rgba(255,255,255,0.8);
            padding: 10px 18px;
            border-radius: 10px;
            text-align: center;
            width: 220px;
            cursor: pointer;
            transition: 0.3s;
            color: black;
            font-size: 18px;
            display: flex;
            justify-content: center;
            margin: 6px 0;
            text-decoration: none;
            font-weight: bold;
        }

        .mid-btn-box {
            width: 90%;
            margin: 20px auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .mid-btn {
            background: rgba(255,255,255,0.9); /* 🔥 white bg */
            color: black;
            padding: 12px;
            border-radius: 12px;
            text-align: center;
            font-weight: bold; /* 🔥 bold text */
            font-size: 19px;
            cursor: pointer;
            transition: 0.3s;
            border-bottom: 4px solid #ff7eb3; /* same style */
        }

            .mid-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 15px rgba(0,0,0,0.3);
            }

        .highlight-btn {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 30px;
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
            margin: 0;
        }

        .calc-btn {
            background: rgba(255,255,255,0.9);
            color: black;
            padding: 12px 20px;
            border-radius: 30px;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
            border-bottom: 4px solid #ff7eb3;
            transition: 0.3s;
            display: inline-block;
            margin: 0;
        }

            .calc-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 12px rgba(0,0,0,0.3);
            }

        #loader {
            position: fixed;
            width: 100%;
            height: 100%;
            background: #0a2240;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 5px solid #ccc;
            border-top: 5px solid #ff7eb3;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }



        /* 📱 MOBILE RESPONSIVE (DESKTOP SAME LOOK) */
        @media (max-width: 768px) {

            body {
                padding: 5px;
            }

            .header {
                height: 50px;
                padding: 8px;
            }


            .sidebar {
                width: 0px;
            }

                .sidebar a {
                    padding: 12px 15px !important;
                    font-size: 15px !important;
                }

            .menu-btn {
                font-size: 20px !important;
            }

            .title {
                font-size: 22px;
            }

            /* 🔥 SAME 3 COLUMN BUT SMALL */
            .btn-box {
                grid-template-columns: repeat(3, 1fr);
                gap: 8px;
            }

            .main-btn {
                font-size: 13px;
                padding: 6px;
                border-bottom: 4px solid #f393c2;
            }

            /* 🔥 top buttons same but tight */
            .top-button {
                padding: 6px 10px;
                font-size: 12px;
            }


            /* 🔥 SOCIAL BUTTONS SAME LINE */
            .social-box {
                grid-template-columns: repeat(4, 1fr);
                gap: 6px;
            }

            .social-btn {
                width: 90%;
                font-size: 11px;
                padding: 6px;
            }

            /* 🔥 MID BUTTON SAME 3 */
            .mid-btn-box {
                grid-template-columns: repeat(3, 1fr);
                gap: 8px;
            }

            .mid-btn {
                font-size: 12px;
                padding: 4px;
            }

            /* 🔥 IMAGE AREA FIX */
            .overlay-buttons {
                top: 48%;
                width: 95%;
            }

            /* 🔥 ROW GAP */
            .row {
                gap: 10px;
            }

            /* 🔥 POPUP SMALL */
            .popup-box {
                width: 90%;
                padding: 20px;
            }

            .contact-number {
                font-size: 13px;
            }

            /* 🔥 CONTACT BTN */
            .contact-btn {
                padding: 4px 8px !important;
                font-size: 13px;
            }

            /* 🔥 CALC BTN */
            .calc-btn {
                font-size: 13px;
                padding: 4px 8px;
            }

            .latest-news-box {
                width: 92% !important;
                max-width: 320px !important;
                margin: 20px auto !important;
                border-radius: 14px !important;
                overflow: hidden;
            }

            .news-header {
                padding: 8px !important;
                font-size: 12px !important;
                text-align: center;
            }

            .news-body {
                height: 90px !important;
                padding: 8px !important; /*8 */
                overflow: hidden !important;
            }

            .news-item {
                padding: 1px !important; /*6*/
                min-height: 40px !important; /*40*/
            }

            .news-text {
                font-size: 10px !important;
                margin: 0 !important;
            }

            .news-link {
                font-size: 10px !important;
            }



            .footer-container {
                flex-direction: column;
                text-align: center;
            }

            .footer-box {
                width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <div id="loader">
        <div class="spinner"></div>
    </div>
    <script>
        window.onload = function () {
            document.getElementById("loader").style.display = "none";
        };
    </script>

    <form id="form1" runat="server">

        <div class="header">
            <div class="menu-btn" onclick="toggleSidebar()">☰</div>
        </div>

        <asp:Panel ID="sidebar" runat="server" CssClass="sidebar">
            <a class="sidebar-btn" href="Home.aspx">Home🏠</a>
            <a class="sidebar-btn" href="Disclaimer.aspx">Disclaimer⚠️</a>
            <a class="sidebar-btn" href="Support.aspx">Support🛠️</a>
            <a class="sidebar-btn" href="Contact.aspx">Contact📩</a>
            <a class="sidebar-btn" href="About.aspx">Aboutℹ️</a>
            <a class="sidebar-btn" href="PrivacyPolicy.aspx">PrivacyPolicy</a>
        </asp:Panel>

        <div style="text-align: center; font-size: 50px; font-weight: bold; margin-top: 0">
            સરકારી મંઝિલ
        </div>

        <link rel="manifest" href="/manifest.json">
        <meta name="theme-color" content="#0a2240" />

        <div class="top-buttons">

            <a href="LatestNews.aspx" class="top-button">
                <span class="emoji">🚨</span> Latest News
            </a>

            <a href="LatestJobs.aspx" class="top-button">📄 Latest Jobs
            </a>

        </div>




        <div class="btn-box">
            <div class="main-btn" onclick="location.href='10pass.aspx?cat=10th'">10 Pass</div>
            <div class="main-btn" onclick="location.href='12Pass.aspx?cat=12th'">12 Pass</div>
            <div class="main-btn" onclick="location.href='Graduate.aspx?cat=Graduate'">Graduate 🎓</div>
            <div class="main-btn" onclick="location.href='ITIDepl.aspx?cat=ITI'">ITI/Dipl</div>
            <div class="main-btn" onclick="location.href='CallLater.aspx'">Call later</div>
            <div class="main-btn" onclick="location.href='Result.aspx'">Result🏆</div>
        </div>



        <div class="image-container">
            <img src="https://images.pexels.com/photos/1454360/pexels-photo-1454360.jpeg">




            <div class="overlay-buttons">
                <div class="latest-news-box">

                    <div class="news-header">
                        🔔 DAILY UPDATE
                    </div>

                    <div class="news-body">
                        <div class="news-scroll">

                            <asp:Repeater ID="rptNews" runat="server">
                                <ItemTemplate>
                                    <div class="news-item">
                                        <div class="news-text">
                                            <%# Eval("ShortText") %>
                                        </div>
                                        <a href='<%# Eval("LinkUrl") %>' class="news-link">Click here
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>




                </div>



                <div class="mid-btn-box">
                    <div class="mid-btn" onclick="location.href='Syllabus.aspx'">Syllabus / Exam Pattern  </div>
                    <div class="mid-btn" onclick="location.href='સરકારીયોજનાઓ.aspx'">સરકારી યોજનાઓ   </div>
                    <div class="mid-btn" onclick="location.href='GK.aspx'">GK મટિરિયલ  </div>
                </div>



                <div class="social-box">

                    <div class="social-btn"
                        onclick="window.open('https://whatsapp.com/channel/0029Va9vyxW3gvWWJbkOXz1O','_blank')">
                        WhatsApp
                    </div>

                    <div class="social-btn"
                        onclick="window.open('https://t.me/sarkarimanzil2525','_blank')">
                        Telegram
                    </div>
                    <div class="social-btn" onclick="window.open('https://www.facebook.com/share/1Dg4ixJEMJ/','_blank')">Facebook</div>
                    <div class="social-btn" onclick="window.open('https://youtube.com/@yourchannel','_blank')">Youtube</div>
                </div>

                <div class="row">
                    <!-- તમારું button -->
                    <div class="highlight-btn contact-btn" onclick="openContactPopup()">
                        ફોર્મ ભરાવવા માટે ક્લિક કરો 📧
                    </div>





                    <!-- Popup Div -->
                    <div id="contactPopup" class="popup" style="display: none; color: black; font-weight: bold;">
                        <div class="popup-box">
                            <div class="popup-overlay">
                                📧
            <p>નીચે આપેલ Email પર સંપર્ક કરો:</p>

                                <div class="contact-number" style="font-size: 22px; color: darkblue; font-weight: bold; word-break: break-all;">
                                    sarkarimanzil252@gmail.com
                                </div>

                                <button class="close-btn" onclick="closeContactPopup()">Close</button>
                            </div>
                        </div>
                    </div>




                    <script>

                        function toggleSidebar() {
                            document.getElementById("<%= sidebar.ClientID %>").classList.toggle("show");
                        }

                        function openContactPopup() {
                            document.getElementById("contactPopup").style.display = "flex";
                        }

                        function closeContactPopup() {
                            document.getElementById("contactPopup").style.display = "none";
                        }

                    </script>


                    <div class="calc-btn" onclick="location.href='Calculate.aspx'">
                        😊 Age Calculator / ઉંમર ગણો
                    </div>
                </div>





                <script>
                    const btn = document.getElementById("ageBtn");

                    btn.addEventListener("click", function () {
                        alert("બટન active થઇ ગયું છે! હવે અહીં Age Calculator open કરી શકો છો.");
                        // અહીં તમારી Age Calculator function call કરી શકો છો
                    });



                </script>
    </form>
    <script>
        window.addEventListener("load", function () {
            document.getElementById("loader").style.display = "none";
        });
    </script>


    <script>
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', function () {
                navigator.serviceWorker.register('/service-worker.js')
                    .then(function (registration) {
                        console.log('Service Worker registered:', registration.scope);
                    })
                    .catch(function (error) {
                        console.log('Service Worker registration failed:', error);
                    });
            });
        }
    </script>
</body>

</html>
