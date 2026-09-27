<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ITIDepl.aspx.cs" Inherits="ITIDepl" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ITI / Diploma Job Details</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #0a2240;
            font-family: Arial, sans-serif;
            color: white;
        }

        .header {
            background: #0a2240;
            color: white;
            padding: 22px;
            font-size: 42px;
            text-align: center;
            font-weight: bold;
            border-bottom: 3px solid #ffcc00;
            letter-spacing: 1px;
        }

        .back-emoji-btn {
            font-size: 28px;
            margin: 15px;
            cursor: pointer;
            background: transparent;
            border: none;
            color: white;
            text-decoration: none;
        }

        .wrapper {
            width: 90%;
            max-width: 1100px; /* pehla 900px htu */
            margin: 30px auto;
        }

        .card {
            background: linear-gradient(135deg, #092134, #0b2440);
            padding: 5px;
            margin-bottom: 18px; /* ek niche ek */
            border-radius: 12px;
            border: 1px dashed #3b5f82;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.25);
            margin: 0 auto 18px auto;
            width: 75%; /* aado box */
            min-height: auto; /* extra height nai */
            padding-left: 35px;
        }


            .card h3 {
                font-size: 24px;
                margin-bottom: 8px;
                color: #ffcc00; /* yellow */
                font-weight: bold;
                margin-top: 0;
            }

            .card:hover {
                transform: translateY(-3px);
                border-color: #ffcc00;
            }

            .card p {
                font-size: 15px;
                margin: 4px 0;
                line-height: 1.3;
                color: #ffffff;
            }


        /* Placeholder card (future admin panel use) */
        .empty-card {
            background: #0a2240;
            border: 2px dashed #ffcc0030;
            color: #ffffff80;
            text-align: center;
            font-style: italic;
            padding: 20px;
            margin-bottom: 20px;
        }

        .update-btn {
            padding: 6px 10px;
            font-size: 12px;
            margin-top: 6px;
            border-radius: 7px;
            display: block;
            margin: 8px auto 0 auto;
            cursor: pointer;
            background: #ffcc00;
            color: #0a2240;
            font-weight: bold;
            border: none;
        }

            .update-btn:hover {
                background: white;
                color: #0a2240;
            }
        /* Main container */
        .job-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2 box per row */
            gap: 20px;
            max-width: 1100px;
            margin: auto;
            padding: 20px;
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


        /* ================= MOBILE RESPONSIVE ONLY ================= */

        @media (max-width: 768px) {

            .wrapper {
                width: 96% !important;
                margin: 8px auto !important;
            }

            .header {
                font-size: 22px !important;
                padding: 12px !important;
            }

            .back-emoji-btn {
                font-size: 22px !important;
                margin: 8px !important;
            }

            .card {
                padding: 10px !important;
                margin-bottom: 10px !important;
                border-radius: 10px !important;
            }

                .card h3 {
                    font-size: 17px !important;
                    margin-bottom: 6px !important;
                }

                .card p {
                    font-size: 13px !important;
                    margin: 2px 0 !important;
                    line-height: 1.3 !important;
                }

            .update-btn {
                padding: 7px 12px !important;
                font-size: 13px !important;
                margin-top: 6px !important;
                border-radius: 8px !important;
            }
        }


        /* ================= EXTRA SMALL MOBILE ================= */

        @media (max-width: 480px) {

            .header {
                font-size: 19px !important;
            }

            .card {
                padding: 8px !important;
            }

                .card h3 {
                    font-size: 15px !important;
                }

                .card p {
                    font-size: 12px !important;
                }

            .update-btn {
                font-size: 12px !important;
                padding: 6px 10px !important;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- Back Button -->
        <asp:LinkButton ID="btnBack" runat="server"
            CssClass="back-emoji-btn"
            OnClientClick="history.back(); return false;">
        🔙
        </asp:LinkButton>

        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <div class="header">ITI / Diploma Job Details 🛠️</div>

        <div class="wrapper">

            <!-- ✅ DYNAMIC JOBS FROM DATABASE -->
            <asp:Repeater ID="rptITIJobs" runat="server">
                <ItemTemplate>

                    <div class="card">

                        <h3><%# Eval("JobTitle") %></h3>

                        <p>🏢 <%# Eval("Department") %></p>

                        <p>🎓 <%# Eval("Qualification") %></p>

                        <p>📅 Last Date: <%# Eval("LastDate") %></p>

                        <a href='JobDetails.aspx?jobid=<%# Eval("Id") %>'>
                            <button type="button" class="update-btn">
                                વધુ વાંચો
                            </button>
                        </a>

                    </div>

                </ItemTemplate>
            </asp:Repeater>

        </div>

    </form>
</body>
</html>
