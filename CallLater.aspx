<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CallLater.aspx.cs" Inherits="CallLater" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Call Later Details</title>


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
            padding: 22px 15px;
            font-size: 34px;
            text-align: center;
            font-weight: bold;
            border-bottom: 3px solid #ffcc00;
            letter-spacing: 0.5px;
        }

        .back-emoji-btn {
            font-size: 30px;
            margin: 15px;
            cursor: pointer;
            background: transparent;
            border: none;
            color: white;
            text-decoration: none;
            display: inline-block;
            transition: 0.3s;
        }

            .back-emoji-btn:hover {
                transform: scale(1.08);
            }

        .wrapper {
            width: 92%;
            max-width: 700px;
            margin: 25px auto;
        }

        .card {
            background: linear-gradient(135deg, #092134, #0b2440);
            padding: 24px;
            margin-bottom: 24px;
            border-radius: 18px;
            border: 2px dashed rgba(255,255,255,0.20);
            box-shadow: 0 8px 20px rgba(0,0,0,0.30);
            transition: 0.3s ease;
            position: relative;
            overflow: hidden;
        }

            .card:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 28px rgba(0,0,0,0.40);
                border-color: rgba(255,204,0,0.35);
            }

            .card::before {
                content: "";
                position: absolute;
                left: 0;
                top: 0;
                width: 5px;
                height: 100%;
                background: #ffcc00;
                border-radius: 10px;
            }

            .card h3 {
                margin: 0;
                font-size: 28px;
                color: #ffcc00;
                font-weight: bold;
                line-height: 1.5;
                padding-left: 8px;
            }

            .card p {
                font-size: 16px;
                color: #e0e0e0;
                line-height: 1.6;
                margin-top: 12px;
            }

        .empty-card {
            background: rgba(255,255,255,0.03);
            border: 2px dashed rgba(255,204,0,0.18);
            color: rgba(255,255,255,0.65);
            text-align: center;
            font-style: italic;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 14px;
        }

            .empty-card h3 {
                margin-bottom: 10px;
                color: #ffcc00;
            }

        .update-btn {
            background: #ffcc00;
            color: #0a2240;
            padding: 12px 18px;
            margin-top: 12px;
            border-radius: 10px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            font-size: 15px;
            transition: 0.3s;
        }

            .update-btn:hover {
                background: white;
                color: #0a2240;
                transform: scale(1.03);
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

        @media screen and (max-width: 768px) {
            .header {
                font-size: 22px;
                padding: 14px 8px;
            }

            .wrapper {
                width: 75%;
                max-width: 100%;
                margin: 15px auto;
            }

            .card {
                padding: 8px 16px;
                margin-bottom: 12px;
                border-radius: 12px;
            }

                .card h3 {
                    font-size: 17px;
                    line-height: 1.4;
                }

            .back-emoji-btn {
                font-size: 22px;
                margin: 8px;
            }

            .update-btn {
                width: 100%;
                padding: 12px;
                font-size: 14px;
            }

            .empty-card {
                padding: 15px;
                font-size: 14px;
            }
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">

        <!-- Back Button -->
        <asp:LinkButton ID="btnBack" runat="server" CssClass="back-emoji-btn"
            OnClientClick="history.back(); return false;">
         🔙
        </asp:LinkButton>

        <a id="whatsappShare" runat="server" target="_blank" class="whatsapp-float">
            <i class="fa-brands fa-whatsapp"></i>
        </a>

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <div class="header">Call Later Details 📘</div>
        <div class="wrapper">

            <asp:Repeater ID="rptCallLater" runat="server">
                <ItemTemplate>

                    <a href='<%# Eval("LinkUrl") %>'
                        target="_blank"
                        style="text-decoration: none;">

                        <div class="card">
                            <h3 style="color: #ffcc00;">
                                <%# Eval("Title") %>
                            </h3>
                        </div>

                    </a>

                </ItemTemplate>
            </asp:Repeater>

        </div>

    </form>
</body>
</html>
