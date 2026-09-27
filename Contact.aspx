<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contact Us</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0a2240;
            color: white;
        }

        .header {
            background: linear-gradient(90deg, #00c6ff, #0072ff);
            padding: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            border-bottom: 4px solid #fff;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }

        .container {
            margin: 40px auto;
            max-width: 500px;
            background: rgba(255,255,255,0.05);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
        }

        .container p {
            font-size: 18px;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .input,
        .textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
            outline: none;
            box-sizing: border-box;
        }

        .textarea {
            resize: none;
        }

        .send-btn {
            background: linear-gradient(45deg, #ff0080, #ff8c00);
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px 25px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 18px;
            box-shadow: 0 5px 15px rgba(255,0,90,0.6);
            transition: all 0.3s ease;
        }

        .send-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(255,0,90,0.8);
        }

        .back-btn {
            display: inline-block;
            text-decoration: none;
            padding: 12px 25px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(45deg, #00c6ff, #0072ff);
            border-radius: 50px;
            box-shadow: 0 5px 15px rgba(0,200,255,0.6);
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0,200,255,0.8);
        }

        /* Mobile Layout */
        @media screen and (max-width: 768px) {
            .header {
                font-size: 22px;
                padding: 16px 10px;
            }

            .container {
                width: 70%;
                max-width: 100%;
                margin: 20px auto;
                padding: 12px 15px;
            }

            .container p {
                font-size: 15px;
            }

            .input,
            .textarea {
                width: 100%;
                padding: 10px;
                font-size: 13px;
                margin-bottom: 12px;
            }

            .send-btn {
                width: 100%;
                padding: 12px;
                font-size: 15px;
                border-radius: 30px;
            }

            .back-btn {
                font-size: 14px;
                padding: 10px 18px;
                margin-top: 12px;
            }
        }
    </style>
</head>

<body>
    <form id="Form1" runat="server">

        <div class="header">Contact Us</div>

        <div class="container">

            <p>Name:</p>
            <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>

            <p>Email:</p>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>

            <p>Message:</p>
            <asp:TextBox ID="txtMsg" runat="server"
                TextMode="MultiLine"
                Rows="4"
                CssClass="textarea"></asp:TextBox>

            <asp:Button ID="btnSend"
                runat="server"
                Text="Send"
                CssClass="send-btn"
                OnClick="btnSend_Click" />

            <br /><br />

            <a class="back-btn" href="Home.aspx">🔙 Back</a>

        </div>

    </form>
</body>
</html>