<%@ Page Language="C#" AutoEventWireup="true" CodeFile="સરકારીયોજનાઓ.aspx.cs" Inherits="સરકારીયોજનાઓ" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>સરકારી યોજનાઓ</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #0a2240;
            color: white;
        }

        .header {
            padding: 18px;
            font-size: 30px;
            text-align: center;
            border-bottom: 3px solid #ffcc00;
            font-weight: bold;
        }

        .wrapper {
            max-width: 750px;
            margin: 25px auto;
            padding: 12px;
        }

        .back {
            font-size: 26px;
            margin: 15px;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
        }

        /* 🔥 YOJANA CARD – SAME FEEL AS 10th PASS */
        .yojana-card {
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(8px);
            border-left: 6px solid #ffcc00;
            padding: 22px 24px;
            margin-bottom: 22px;
            border-radius: 18px;
            transition: 0.3s;
        }

            .yojana-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 14px 30px rgba(0,0,0,0.45);
            }

        /* TITLE */
        .yojana-title {
            font-size: 22px;
            font-weight: bold;
            color: #ffcc00;
            margin-bottom: 8px;
        }

        /* META INFO */
        .yojana-meta {
            font-size: 14px;
            color: #e6e6e6;
            margin-bottom: 16px;
            line-height: 1.6;
        }

        /* 🔥 BUTTON – PROPER CTA */
        .yojana-btn {
            display: inline-block;
            padding: 10px 24px;
            background: #ffcc00;
            color: #0a2240 !important;
            border-radius: 26px;
            font-weight: bold;
            font-size: 14px;
            text-decoration: none;
            transition: 0.25s;
        }

            .yojana-btn:hover {
                background: #ffffff;
                box-shadow: 0 0 12px rgba(255,204,0,0.7);
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
                padding: 7px 3px;
                line-height: 1.4;
            }

            .back {
                font-size: 15px;
                margin: 6px;
                display: inline-block;
            }

            .wrapper {
                width: 70%;
                margin: 7px auto;
                padding: 4px;
            }

            .yojana-card {
                padding: 9px 8px;
                margin-bottom: 9px;
                border-radius: 7px;
                border-left: 5px solid #ffcc00;
            }

            .yojana-title {
                font-size: 15px;
                line-height: 1.4;
                margin-bottom: 5px;
            }

            .yojana-meta {
                font-size: 14px;
                line-height: 1.7;
                margin-bottom: 7px;
            }

            .yojana-btn {
                display: block;
                width: fit-content;
                font-size: 7px;
                padding: 6px 10px;
                border-radius: 6px;
                text-align: center;
            }
        }

        @media screen and (max-width: 480px) {

            .header {
                font-size: 20px;
                padding: 14px 8px;
            }

            .wrapper {
                width: 94%;
                padding: 5px;
            }

            .yojana-card {
                padding: 15px 14px;
            }

            .yojana-title {
                font-size: 17px;
            }

            .yojana-meta {
                font-size: 13px;
                line-height: 1.6;
            }

            .yojana-btn {
                width: 100%;
                font-size: 13px;
                padding: 12px;
                border-radius: 10px;
            }
        }
    </style>
</head>

<body>
    <form runat="server">

        <button class="back" onclick="history.back(); return false;">🔙</button>


        <div class="header">સરકારી યોજનાઓ 📜</div>

        <div class="wrapper">

            <asp:Repeater ID="rptYojana" runat="server">
                <ItemTemplate>

                    <div class="yojana-card">

                        <div class="yojana-title">
                            <%# Eval("YojanaName") %>
                        </div>

                        <div class="yojana-meta">
                            વિભાગ: <%# Eval("Department") %> |
                યોજના પ્રકાર: <%# Eval("SchemeType") %> |
                રાજ્ય: <%# Eval("State") %>
                        </div>

                        <a href='YojanaDetail.aspx?slug=<%# Eval("SeoUrl") %>' class="yojana-btn">વધુ માહિતી જુઓ →
                        </a>


                    </div>

                </ItemTemplate>
            </asp:Repeater>


        </div>

    </form>
</body>
</html>
