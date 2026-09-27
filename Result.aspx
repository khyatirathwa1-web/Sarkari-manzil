<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="Result" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Result</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #0a2240; /* Dark Blue */
            font-family: 'Segoe UI', Arial, sans-serif;
            color: white;
        }

        .header {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            padding: 20px 0;
            border-bottom: 3px solid #ffcc00;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .arrow-btn {
            background: linear-gradient(135deg, #ffcc00, #f0a500);
            color: #0a2240;
            padding: 18px;
            font-size: 18px;
            border-radius: 12px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: all 0.3s ease;
            box-shadow: 0 5px 12px rgba(0,0,0,0.3);
            text-align: center;
        }

            .arrow-btn:hover {
                background: linear-gradient(135deg, #ffd633, #ffb700);
                transform: translateY(-3px);
                box-shadow: 0 8px 15px rgba(0,0,0,0.4);
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

        /* Empty Card for future options */
        .empty-card {
            background: #0a2240;
            border: 2px dashed #ffcc0030;
            color: #ffffff80;
            text-align: center;
            padding: 15px;
            font-style: italic;
            border-radius: 12px;
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
                font-size: 24px;
                padding: 10px 15px;
            }

            .container {
                width: 75%;
                max-width: 100%;
                margin: 15px auto;
                gap: 10px;
            }

            .arrow-btn {
                padding: 14px;
                font-size: 16px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.25);
            }

            .back-emoji-btn {
                font-size: 24px;
                margin: 20px 10px 10px 10px;
            }

            .back-emoji-btn {
                display: inline-block;
                font-size: 24px;
                margin-top: 25px !important;
                margin-left: 10px;
                margin-bottom: 10px;
            }
        }

        .empty-card {
            padding: 12px;
            font-size: 14px;
            border-radius: 10px;
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

        <div class="header">Exam Results 🏆</div>
        <div class="container">

            <asp:Repeater ID="rptResults" runat="server">
                <ItemTemplate>

                    <a href='<%# Eval("LinkUrl") %>'
                        target="_blank"
                        style="text-decoration: none;">

                        <div class="arrow-btn">
                            <%# Eval("Title") %>
                        </div>

                    </a>

                </ItemTemplate>
            </asp:Repeater>

        </div>







    </form>
</body>
</html>
