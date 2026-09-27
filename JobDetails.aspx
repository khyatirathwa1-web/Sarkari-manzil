<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobDetails.aspx.cs" Inherits="JobDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Job Details</title>

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

        .box {
            width: 90%;
            max-width: 650px;
            margin: 30px auto;
            background: #092134;
            padding: 20px;
            border-radius: 12px;
        }

        .row {
            margin-bottom: 10px;
        }

        .label {
            color: #ffcc00;
            font-weight: bold;
        }

        .back-emoji-btn {
            position: absolute;
            top: 15px;
            left: 15px;
            font-size: 26px;
            background: transparent;
            border: none;
            color: white;
            cursor: pointer;
        }

        a {
            color: #ffcc00;
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
            text-decoration: none; /* 🔥 IMPORTANT */
            -webkit-tap-highlight-color: transparent;
        }

            .whatsapp-float i {
                color: white;
                font-size: 28px;
                text-decoration: none; /* safety */
            }
        /* ============================= */
        /* Mobile Responsive Layout */
        /* JobDetails.aspx */
        /* ============================= */

        @media screen and (max-width: 768px) {

            body {
                margin: 0;
                padding: 0;
            }

            .header {
                font-size: 20px;
                padding: 8px 5px;
                line-height: 1.4;
            }

            .back-emoji-btn {
                position: static;
                display: inline-block;
                margin: 16px;
                font-size: 20px;
            }

            .box {
                width: 80%;
                margin: 7px auto;
                padding: 9px;
                border-radius: 6px;
                box-sizing: border-box;
            }

            h2 {
                font-size: 20px;
                line-height: 1.4;
                margin-bottom: 7px;
            }

            .row {
                margin-bottom: 7px;
                font-size: 15px;
                line-height: 1.6;
            }

            .label {
                font-size: 15px;
                display: inline-block;
                margin-bottom: 4px;
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
            }

                .whatsapp-float i {
                    font-size: 24px;
                }

            #lnkOfficial {
                display: block;
                width: 50%;
                text-align: center;
                padding: 12px;
                margin-top: 12px;
                border-radius: 10px;
                box-sizing: border-box;
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

            h2 {
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
                border-radius: 8px;
            }
        }
    </style>
</head>

<body>
    <form runat="server">

        <button class="back-emoji-btn" onclick="history.back(); return false;">🔙</button>

        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <div class="header">Job Details</div>

        <div class="box">

            <h2>
                <asp:Label ID="lblJobTitle" runat="server"></asp:Label>
            </h2>

            <div class="row">
                <span class="label">Department / Board:</span>
                <asp:Label ID="lblDepartment" runat="server"></asp:Label>
            </div>

            <div class="row">
                <span class="label">Post Name:</span>
                <asp:Label ID="lblPostName" runat="server"></asp:Label>
            </div>

            <div class="row">
                <span class="label">Qualification:</span>
                <asp:Label ID="lblQualification" runat="server"></asp:Label>
            </div>

            <div class="row">
                <span class="label">Salary:</span>
                <asp:Label ID="lblSalary" runat="server"></asp:Label>
            </div>

            <div class="row">
                <span class="label">Recruitment Type:</span>
                <asp:Label ID="lblRecruitmentType" runat="server"></asp:Label>
            </div>

            <div class="row">
                <span class="label">Last Date:</span>
                <asp:Label ID="lblLastDate" runat="server"></asp:Label>
            </div>





            <hr />

            <asp:Label ID="lblFullDescription" runat="server"></asp:Label>

            <br />
            <br />

            <asp:HyperLink ID="lnkOfficial" runat="server" Target="_blank"></asp:HyperLink>

        </div>

    </form>
</body>
</html>
