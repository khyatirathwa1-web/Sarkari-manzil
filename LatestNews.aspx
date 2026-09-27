<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="LatestNews.aspx.cs"
    Inherits="LatestNews" %>


<!DOCTYPE html>
<html>
<head>
    <title>Latest News</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0a2240;
            color: white;
        }

        .header {
            background: #0a2240;
            color: white;
            padding: 18px;
            font-size: 30px;
            text-align: center;
            font-weight: bold;
            border-bottom: 3px solid #ffcc00;
        }

        .back-btn {
            font-size: 28px;
            margin: 15px;
            width: 55%;
            cursor: pointer;
            background: transparent;
            border: none;
            color: white;
            text-decoration: none;
        }

        .card {
            background: linear-gradient(135deg, #092134, #0b2440);
            margin: 20px auto;
            padding: 20px;
            width: 55%;
            border-radius: 15px;
            border: 2px dashed #ffffff30;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.3);
            cursor: pointer;
        }

            .card h3 {
                margin-top: 0;
                font-size: 22px;
                color: #ffcc00;
            }

            .card p {
                font-size: 16px;
                color: #e0e0e0;
                line-height: 1.6;
            }

        .news-btn {
            background: #ffcc00;
            color: #0a2240;
            padding: 10px 18px;
            margin-top: 12px;
            border-radius: 10px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

            .news-btn:hover {
                background: white;
            }


        .calllater-card {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            padding: 28px;
            border: 2px dashed #2c4c6c;
            border-radius: 16px;
            background: linear-gradient(135deg, #092134, #0b2440);
            box-shadow: 0px 4px 12px rgba(0,0,0,0.3);
            cursor: pointer;
        }

            .calllater-card h3 {
                margin: 0;
                font-size: 22px;
                color: #ffcc00;
                font-weight: bold;
            }

        .result-card {
            width: 54%;
            margin: 20px auto;
            background: #f5b800;
            color: #0a2240;
            padding: 14px;
            border-radius: 10px;
            font-size: 20px;
            font-weight: bold;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.20);
            transition: 0.3s;
            cursor: pointer;
        }

            .result-card:hover {
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
            }
        /* ============================= */
        /* Mobile Responsive Layout */
        /* LatestNews.aspx */
        /* ============================= */

        @media screen and (max-width: 768px) {

            body {
                margin: 0;
                padding: 0;
            }

            .header {
                font-size: 18px;
                padding: 8px 5px;
                line-height: 1.4;
            }

            .back-btn {
                width: auto;
                display: inline-block;
                margin: 6px;
                font-size: 15px;
            }

            .card,
            .result-card,
            .calllater-card {
                width: 70%;
                margin: 14px auto;
                padding: 18px;
                border-radius: 7px;
                box-sizing: border-box;
            }

                .card h3,
                .calllater-card h3,
                .result-card {
                    font-size: 14px;
                    line-height: 1.4;
                }

                .card p {
                    font-size: 14px;
                    line-height: 1.6;
                }

            .news-btn {
                display: block;
                width: 50%;
                text-align: center;
                padding: 6px;
                font-size: 7px;
                border-radius: 5px;
                box-sizing: border-box;
                text-decoration: none;
            }
        }

        @media screen and (max-width: 480px) {

            .header {
                font-size: 20px;
                padding: 14px 8px;
            }

            .back-btn {
                font-size: 20px;
                margin: 10px;
            }

            .card,
            .result-card,
            .calllater-card {
                width: 92%;
                padding: 16px;
                margin: 12px auto;
                border-radius: 12px;
            }

                .card h3,
                .calllater-card h3,
                .result-card {
                    font-size: 16px;
                }

                .card p {
                    font-size: 13px;
                    line-height: 1.5;
                }

            .news-btn {
                font-size: 13px;
                padding: 11px;
                border-radius: 8px;
            }
        }
    </style>
</head>

<body>

    <form runat="server">

        <!-- Back Button -->
        <a class="back-btn" href="Home.aspx">🔙

        </a>

        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <div class="header">Latest News 📰</div>
        <asp:Repeater ID="rptNews" runat="server">
            <ItemTemplate>

                <%-- CALL LATER CARD --%>
                <asp:Panel ID="pnlCallLater" runat="server"
                    Visible='<%# Eval("ShortDesc").ToString().Trim() == "CALLTYPE" %>'>

                    <a href='<%# Eval("OfficialLink") %>'
                        target="_blank"
                        style="text-decoration: none; display: block;">

                        <div class="calllater-card">
                            <h3><%# Eval("Title") %></h3>
                        </div>

                    </a>

                </asp:Panel>


                <%-- RESULT CARD --%>
                <asp:Panel ID="pnlResult" runat="server"
                    Visible='<%# Eval("ShortDesc").ToString().Trim() == "RESULTTYPE" %>'>

                    <a href='<%# Eval("OfficialLink") %>'
                        target="_blank"
                        style="text-decoration: none; display: block; '">

                        <div class="calllater-card">
                            <h3><%# Eval("Title") %></h3>
                        </div>

                    </a>

                </asp:Panel>


                <%-- NORMAL NEWS CARD --%>
                <asp:Panel ID="pnlNormal" runat="server"
                    Visible='<%# Eval("ShortDesc").ToString().Trim() != "CALLTYPE"
                && Eval("ShortDesc").ToString().Trim() != "RESULTTYPE" %>'>

                    <div class="card">

                        <h3><%# Eval("Title") %></h3>

                        <p><%# Eval("ShortDesc") %></p>

                        <a href='NewsDetail.aspx?id=<%# Eval("Id") %>'
                            class="news-btn">વધુ વાંચો
                        </a>

                    </div>

                </asp:Panel>

            </ItemTemplate>
        </asp:Repeater>

    </form>

</body>
</html>
