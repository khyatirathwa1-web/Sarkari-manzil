<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="NewsDetail" %>

<!DOCTYPE html>
<html>
<head>
    <title>News Detail</title>
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
            margin: 15px;
            font-size: 26px;
            cursor: pointer;
            background: none;
            border: none;
            color: white;
        }

        .back-btn {
            display: inline-block;
            margin: 20px;
            padding: 10px 20px;
            background: #ffcc00;
            color: #000;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

            .back-btn:hover {
                background: #ffd633;
                transform: translateY(-2px);
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
                text-decoration: none;
            }

        /* 🔥 Dynamic Premium Content Box */

        .content {
            width: 90%;
            max-width: 850px;
            margin: 30px auto;
            padding: 30px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.10);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.15);
            box-shadow: 0 12px 35px rgba(0,0,0,0.35);
        }

            .content h2 {
                color: #ffcc00;
                font-size: 28px;
                margin-bottom: 25px;
                line-height: 1.5;
                border-bottom: 2px solid rgba(255,204,0,0.3);
                padding-bottom: 12px;
            }

        .full-news {
            margin-top: 20px;
        }

            .full-news p {
                background: rgba(255,255,255,0.06);
                padding: 14px 16px;
                border-radius: 12px;
                margin-bottom: 14px;
                line-height: 1.8;
                border-left: 4px solid #ffcc00;
                transition: 0.3s;
            }

                .full-news p:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 18px rgba(0,0,0,0.25);
                }

            .full-news b {
                color: #ffcc00;
                font-size: 15px;
            }

        hr {
            border: none;
            height: 1px;
            background: rgba(255,255,255,0.12);
            margin: 20px 0;
        }

        #lnkOfficial {
            display: inline-block;
            margin-top: 10px;
            padding: 12px 22px;
            background: #ffcc00;
            color: #0a2240 !important;
            border-radius: 30px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

            #lnkOfficial:hover {
                background: white;
                transform: translateY(-2px);
            }

        /* ============================= */
        /* Extra Mobile Responsive Layout */
        /* NewsDetail.aspx */
        /* ============================= */

        @media screen and (max-width: 768px) {

            .header {
                font-size: 22px;
                padding: 8px 5px;
                line-height: 1.4;
            }

            .back-btn {
                display: inline-block;
                margin: 8px;
                padding: 5px 7px;
                font-size: 11px;
                border-radius: 8px;
            }

            .content {
                width: 80%;
                padding: 9px;
                margin: 7px auto;
                border-radius: 7px;
                box-sizing: border-box;
            }

                .content h2 {
                    font-size: 15px;
                    line-height: 1.5;
                    margin-bottom: 9px;
                }

            .full-news p {
                font-size: 14px;
                padding: 6px;
                line-height: 1.7;
                border-radius: 5px;
            }

            .full-news b {
                font-size: 14px;
            }

            #lnkOfficial,
            #lnkPdf {
                display: block;
                width: 70%;
                text-align: center;
                padding: 8px;
                font-size: 14px;
                border-radius: 5px;
                box-sizing: border-box;
                margin-top: 6px;
            }

            .whatsapp-float {
                width: 50px;
                height: 50px;
                right: 10px;
                bottom: 10px;
            }

                .whatsapp-float i {
                    font-size: 24px;
                }
        }

        @media screen and (max-width: 480px) {

            .header {
                font-size: 20px;
                padding: 14px 8px;
            }

            .back-btn {
                font-size: 13px;
                padding: 9px 12px;
                margin: 10px;
            }

            .content {
                width: 95%;
                padding: 15px;
                border-radius: 12px;
            }

                .content h2 {
                    font-size: 18px;
                }

            .full-news p {
                font-size: 13px;
                padding: 10px;
                line-height: 1.6;
            }

            .full-news b {
                font-size: 13px;
            }

            #lnkOfficial,
            #lnkPdf {
                font-size: 13px;
                padding: 11px;
                border-radius: 8px;
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
        }

        
    </style>
</head>


<body>

    <form runat="server">

        <a href="LatestNews.aspx" class="back-btn">⬅ Back to News</a>

        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


        <div class="header">News Detail</div>

        <div class="content">

            <h2>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </h2>


            <!-- YOJANA SECTION -->

            <asp:Panel ID="pnlYojana" runat="server">

                <div class="full-news">

                    <p>
                        <b>Department:</b>
                        <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                    </p>

                    <p>
                        <b>Scheme Type:</b>
                        <asp:Label ID="lblSchemeType" runat="server"></asp:Label>
                    </p>

                    <p>
                        <b>State:</b>
                        <asp:Label ID="lblState" runat="server"></asp:Label>
                    </p>

                    <hr />

                    <p>
                        <b>Eligibility:</b><br />
                        <asp:Label ID="lblEligibility" runat="server"></asp:Label>
                    </p>

                    <p>
                        <b>Benefits:</b><br />
                        <asp:Label ID="lblBenefits" runat="server"></asp:Label>
                    </p>

                    <p>
                        <b>Documents Required:</b><br />
                        <asp:Label ID="lblDocs" runat="server"></asp:Label>
                    </p>

                    <p>
                        <b>How To Apply:</b><br />
                        <asp:Label ID="lblApply" runat="server"></asp:Label>
                    </p>

                    <br />

                    <asp:HyperLink
                        ID="lnkOfficial"
                        runat="server"
                        Target="_blank"
                        Text="👉 Official Website">
                    </asp:HyperLink>

                </div>

            </asp:Panel>


            <!-- PDF / GK / SYLLABUS SECTION -->

            <asp:Panel ID="pnlPdf" runat="server">

                <div class="full-news">

                    <p>
                        <b>Description:</b><br />
                        <asp:Label ID="lblPdfDescription" runat="server"></asp:Label>
                    </p>

                    <br />

                    <asp:HyperLink
                        ID="lnkPdf"
                        runat="server"
                        Target="_blank"
                        Text="📄 View / Download PDF">
                    </asp:HyperLink>

                </div>

            </asp:Panel>

            <asp:Panel ID="pnlCallLater" runat="server" Visible="false">

                <div class="calllater-card">
                    <h3>
                        <asp:Label ID="lblCallLaterTitle" runat="server"></asp:Label>
                    </h3>
                </div>

            </asp:Panel>

        </div>

    </form>

</body>
</html>
