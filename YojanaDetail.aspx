<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YojanaDetail.aspx.cs" Inherits="YojanaDetail" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sarkari Yojana Details</title>

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

        .back {
            font-size: 26px;
            margin: 15px;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
        }

        .box {
            width: 90%;
            max-width: 750px;
            margin: 20px auto;
            background: #092134;
            padding: 20px;
            border-radius: 12px;
        }

        .title {
            color: #ffcc00;
            font-size: 24px;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .row {
            margin-bottom: 12px;
        }

        .label {
            color: #ffcc00;
            font-weight: bold;
        }

        a {
            color: #ffcc00;
            text-decoration: none;
            font-weight: bold;
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
            text-decoration: none; /* 🔥 IMPORTANT */
        }

            .whatsapp-float i {
                color: white;
                font-size: 28px;
                text-decoration: none; /* safety */
            }
        /* ============================= */
        /* Official Website Link Special CSS */
        /* ============================= */

        #lnkOfficial {
            display: inline-block;
            padding: 10px 18px;
            border-radius: 10px;
            font-weight: bold;
            font-size: 16px;
            text-decoration: none;
            transition: 0.3s ease;
            border: 2px solid transparent;
        }

            /* Normal active link */
            #lnkOfficial:link {
                color: #ffcc00;
                background: rgba(255, 204, 0, 0.08);
            }

            /* Already visited link */
            #lnkOfficial:visited {
                color: #ff9f1a;
                background: rgba(255, 159, 26, 0.08);
            }

            /* Mouse hover */
            #lnkOfficial:hover {
                color: #ffffff;
                background: #ffcc00;
                border-color: #ffffff;
                box-shadow: 0 0 12px rgba(255,204,0,0.6);
            }

            /* While clicking */
            #lnkOfficial:active {
                color: #0a2240;
                background: #ffffff;
                border-color: #ffcc00;
                transform: scale(0.97);
            }

            /* If no link / disabled style */
            #lnkOfficial[disabled],
            #lnkOfficial.disabled {
                color: #999999 !important;
                background: rgba(255,255,255,0.05);
                pointer-events: none;
                cursor: not-allowed;
                border: 1px dashed #666;
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

            .back {
                font-size: 15px;
                margin: 6px;
                display: inline-block;
            }

            .box {
                width: 70%;
                margin: 7px auto;
                padding: 9px;
                border-radius: 6px;
            }

            .title {
                font-size: 15px;
                line-height: 1.4;
                margin-bottom: 7px;
            }

            .row {
                margin-bottom: 7px;
                font-size: 14px;
                line-height: 1.6;
            }

            .label {
                font-size: 15px;
            }

            a {
                font-size: 14px;
                word-break: break-word;
            }

            .whatsapp-float {
                width: 50px;
                height: 50px;
                right: 30px;
                bottom: 30px;
                cursor: pointer;
            }

                .whatsapp-float i {
                    font-size: 24px;
                }

            #lnkOfficial {
                display: block;
                width: 50%;
                text-align: center;
                padding: 6px;
                font-size: 14px;
                border-radius: 6px;
                margin-top: 6px;
                box-sizing: border-box;
                word-break: break-word;
            }
        }

        @media screen and (max-width: 480px) {

            .header {
                font-size: 20px;
                padding: 14px 8px;
            }

            .box {
                width: 94%;
                padding: 15px;
            }

            .title {
                font-size: 18px;
            }

            .row {
                font-size: 13px;
            }

            .label {
                font-size: 14px;
            }

            a {
                font-size: 13px;
            }

            .whatsapp-float {
                width: 46px;
                height: 46px;
                right: 15px;
                bottom: 15px;
            }

                .whatsapp-float i {
                    font-size: 22px;
                }

            #lnkOfficial {
                font-size: 13px;
                padding: 11px;
            }
        }
    </style>
</head>

<body>
    <form runat="server">

        <button class="back" onclick="history.back(); return false;">🔙</button>
        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <div class="header">Sarkari Yojana Details</div>

        <div class="box">

            <div class="title">
                <asp:Label ID="lblTitle" runat="server" />
            </div>

            <div class="row">
                <span class="label">Department:</span>
                <asp:Label ID="lblDepartment" runat="server" />
            </div>

            <div class="row">
                <span class="label">Scheme Type:</span>
                <asp:Label ID="lblSchemeType" runat="server" />
            </div>

            <div class="row">
                <span class="label">State:</span>
                <asp:Label ID="lblState" runat="server" />
            </div>

            <hr />

            <div class="row">
                <span class="label">Eligibility:</span><br />
                <asp:Label ID="lblEligibility" runat="server" />
            </div>

            <div class="row">
                <span class="label">Benefits:</span><br />
                <asp:Label ID="lblBenefits" runat="server" />
            </div>

            <div class="row">
                <span class="label">Documents Required:</span><br />
                <asp:Label ID="lblDocs" runat="server" />
            </div>

            <div class="row">
                <span class="label">How To Apply:</span><br />
                <asp:Label ID="lblApply" runat="server" />
            </div>

            <br />

            <asp:HyperLink
                ID="lnkOfficial"
                runat="server"
                Target="_blank"
                Text="👉 Official Website" />

        </div>

    </form>
</body>
</html>
