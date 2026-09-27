<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrivacyPolicy.aspx.cs" Inherits="PrivacyPolicy" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Privacy Policy</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #0a2240;
            color: white;
        }

        .header {
            padding: 18px;
            font-size: 28px;
            text-align: center;
            border-bottom: 3px solid #ffcc00;
            font-weight: bold;
        }

        .back-btn {
            font-size: 26px;
            margin: 15px;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
        }

        .box {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background: #092134;
            padding: 25px;
            border-radius: 12px;
            line-height: 1.8;
        }

        .box p {
            margin-bottom: 15px;
        }

        .title {
            color: #ffcc00;
            font-weight: bold;
        }

       
        

        /* Mobile */
        @media (max-width: 768px) {
            .header {
                font-size: 22px;
                padding: 15px;
            }

            .box {
                width: 94%;
                padding: 18px;
            }
        }
    </style>
</head>

<body>

<form runat="server">

    <button class="back-btn" onclick="history.back(); return false;">🔙</button>

   

    <div class="header">Privacy Policy 🔒</div>

    <div class="box">

        <p>
            Sarkari Manzil respects your privacy and is committed to protecting your personal information.
        </p>

        <p>
            <span class="title">Information We Collect:</span><br />
            We may collect basic details like name or email through contact forms.
        </p>

        <p>
            <span class="title">How We Use Information:</span><br />
            We use data only to improve our services and respond to queries.
        </p>

        <p>
            <span class="title">Cookies:</span><br />
            We may use cookies to enhance user experience.
        </p>

        <p>
            <span class="title">Third-Party Links:</span><br />
            We are not responsible for external websites.
        </p>

        <p>
            <span class="title">Security:</span><br />
            We try to protect your data but cannot guarantee full security.
        </p>

        <p>
            By using this website, you agree to this Privacy Policy.
        </p>

    </div>

</form>

</body>
</html>