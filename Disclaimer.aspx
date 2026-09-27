<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disclaimer.aspx.cs" Inherits="Disclaimer" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Disclaimer</title>
    <link href="style.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0a2240, #1c3b70);
            color: white;
            margin: 0;
            padding: 0;
        }

        .header {
            background: linear-gradient(90deg, #ff0080, #ff8c00);
            padding: 20px;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.05);
            padding: 25px 30px;
            border-radius: 15px;
            backdrop-filter: blur(8px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        }

            .container p {
                font-size: 18px;
                line-height: 1.6;
            }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: linear-gradient(45deg, #ff0080, #ff8c00);
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 50px;
            transition: 0.3s;
            box-shadow: 0 4px 15px rgba(255,0,90,0.5);
        }

            .back-btn:hover {
                transform: scale(1.05);
                box-shadow: 0 6px 20px rgba(255,0,90,0.7);
            }

        @media screen and (max-width: 768px) {
            .header {
                font-size: 24px;
                padding: 16px 10px;
                border-bottom-left-radius: 14px;
                border-bottom-right-radius: 14px;
            }

            .container {
                width: 50%;
                max-width: 100%;
                margin: 20px auto;
                padding: 10px 15px;
                border-radius: 12px;
            }

                .container p {
                    font-size: 13px;
                    line-height: 1.7;
                }

            .back-btn {
                display: inline-block;
                width: auto;
                padding: 10px 18px;
                font-size: 13px;
                margin-top: 15px;
                border-radius: 30px;
            }
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">

        <div class="header">Disclaimer</div>

        <div class="container">
            <p>
                Sarkari Manzil is not an official government website. The information provided on this website is for educational and informational purposes only. We try to provide accurate and up-to-date information related to jobs, results, government schemes, and study materials.
            </p>

            <p>
                However, we do not guarantee the completeness or accuracy of any information. Users are strongly advised to verify all details from the official website or notification before applying or taking any action.
            </p>

            <p>
                This website may contain links to third-party websites. We are not responsible for the content, accuracy, or reliability of any external website.
            </p>

            <p>
                By using this website, you agree that you are using the information at your own risk.
            </p>

            <a class="back-btn" href="Home.aspx">🔙 Back</a>
        </div>

    </form>
</body>
</html>
