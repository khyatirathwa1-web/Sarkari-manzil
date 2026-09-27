<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Support" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Support</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0a2240;
            color: white;
        }

        .header {
            background: linear-gradient(90deg, #ff8c00, #ff0080);
            padding: 20px;
            font-size: 28px;
            font-weight: bold;
            text-align: center;
            border-bottom: 4px solid #fff;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }

        .container {
            margin: 40px auto;
            max-width: 600px;
            background: rgba(255,255,255,0.05);
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
        }

            .container p {
                font-size: 20px;
                line-height: 1.6;
                margin-bottom: 25px;
            }

        .back-btn {
            display: inline-block;
            text-decoration: none;
            padding: 12px 25px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(45deg, #ff0080, #ff8c00);
            border-radius: 50px;
            box-shadow: 0 5px 15px rgba(255,0,90,0.6);
            transition: all 0.3s ease;
        }

            .back-btn:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 20px rgba(255,0,90,0.8);
            }

        @media screen and (max-width: 768px) {
            .header {
                font-size: 22px;
                padding: 16px 10px;
                border-radius: 0 0 10px 10px;
                border-bottom: 3px solid #fff;
            }

            .container {
                width: 90%;
                max-width: 100%;
                margin: 20px auto;
                padding: 18px 15px;
                border-radius: 10px;
            }

                .container p {
                    font-size: 15px;
                    line-height: 1.7;
                    margin-bottom: 18px;
                }

                    .container p[style] {
                        font-size: 18px !important;
                    }

            .back-btn {
                display: inline-block;
                padding: 10px 18px;
                font-size: 14px;
                border-radius: 30px;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">

        <div class="header">Support</div>

        <div class="container">
            <p>For help or inquiries, contact us at:</p>
            <p style="color: #ffe600; font-weight: bold; font-size: 22px;">sarkarimanzil25@gmail.com</p>
            <a class="back-btn" href="Home.aspx">🔙 Back</a>
        </div>

    </form>
</body>
</html>
