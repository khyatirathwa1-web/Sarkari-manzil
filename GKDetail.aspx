<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GKDetail.aspx.cs" Inherits="GKDetail" %>

<!DOCTYPE html>
<html>
<head>
    <title>GK માહિતી</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #0a2240;
            color: white;
        }

        .header {
            padding: 18px;
            font-size: 26px;
            text-align: center;
            border-bottom: 3px solid #ffcc00;
            font-weight: bold;
        }

        .back-btn {
            position: absolute;
            top: 15px;
            left: 15px;
            font-size: 26px;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
        }

        .box {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background: rgba(255,255,255,0.08);
            border-radius: 18px;
            border: 1px dashed rgba(255,255,255,0.2);
        }

        .gk-title {
            color: #ffcc00;
            font-size: 26px;
            margin-bottom: 12px;
        }

        .gk-desc {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 18px;
        }

        .gk-btn {
            display: inline-block;
            padding: 10px 20px;
            background: #ffcc00;
            color: #0a2240;
            border-radius: 25px;
            font-weight: bold;
            text-decoration: none;
        }

        .whatsapp-float {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 55px;
            height: 55px;
            background: #25D366;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            z-index: 9999;
            text-decoration: none;
        }

            .whatsapp-float i {
                color: white;
                font-size: 28px;
            }
        /* ============================= */
        /* Mobile Responsive Layout */
        /* ============================= */

        @media screen and (max-width: 768px) {

            body {
                margin: 0;
                padding: 0;
            }

            .header {
                font-size: 15px;
                padding: 8px 5px;
                line-height: 1.4;
            }

            .back-btn {
                position: static;
                display: inline-block;
                margin: 6px;
                font-size: 15px;
            }

            .box {
                width: 70%;
                margin: 10px auto;
                padding: 10px;
                border-radius: 7px;
            }

            .gk-title,
            h2 {
                font-size: 15px;
                line-height: 1.4;
                margin-bottom: 5px;
            }

            .gk-desc,
            p {
                font-size: 14px;
                line-height: 1.7;
                margin-bottom: 16px;
            }

            .gk-btn {
                display: block;
                width: 50%;
                text-align: center;
                padding: 7px;
                font-size: 7px;
                border-radius: 6px;
                box-sizing: border-box;
            }
        }

        @media screen and (max-width: 480px) {

            .header {
                font-size: 15px;
                padding: 7px 4px;
            }

            .box {
                width: 70%;
                padding: 8px;
                margin: 7px auto;
            }

            .gk-title,
            h2 {
                font-size: 15px;
            }

            .gk-desc,
            p {
                font-size: 15px;
                line-height: 1.6;
            }

            .gk-btn {
                font-size: 7px;
                padding: 6px;
                border-radius: 5px;
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <button type="button" class="back-btn" onclick="history.back();">🔙</button>

        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <div class="header">GK મટિરિયલ્સ 📚 </div>


        <div class="box">

            <h2>
                <asp:Label ID="lblTitle" runat="server" />
            </h2>

            <p>
                <asp:Label ID="lblDesc" runat="server" />
            </p>

            <a id="lnkPdf" runat="server" target="_blank" class="gk-btn">📄 View / Download PDF
            </a>

        </div>


    </form>



</body>
</html>
