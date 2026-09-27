<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Syllabus.aspx.cs" Inherits="Syllabus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Syllabus & Exam Pattern</title>

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

        .back-emoji-btn {
            font-size: 28px;
            margin: 15px;
            cursor: pointer;
            background: transparent;
            border: none;
            color: white;
            text-decoration: none;
        }

        .card {
            background: linear-gradient(135deg, #092134, #0b2440);
            margin: 25px auto;
            padding: 22px;
            width: 50%;
            border-radius: 15px;
            border: 2px dashed #ffffff30;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0px 8px 18px rgba(0,0,0,0.4);
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

        .gk-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #ffcc00, #ffb300);
            color: #0a2240;
            padding: 12px 26px;
            margin-top: 16px;
            border-radius: 30px;
            font-size: 15px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 6px 18px rgba(0,0,0,0.45);
            transition: all 0.25s ease;
        }

            .gk-btn:hover {
                background: linear-gradient(135deg, #ffffff, #ffe082);
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.55);
            }

            .gk-btn:active {
                transform: scale(0.96);
            }
        /* ============================= */
        /* Mobile Responsive Layout */
        /* ============================= */

        @media screen and (max-width: 768px) {

            body {
                padding: 0;
                margin: 0;
            }

            .header {
                font-size: 22px;
                padding: 8px 5px;
                line-height: 1.4;
            }

            .back-emoji-btn {
                font-size: 20px;
                margin: 12px;
                display: inline-block;
            }

            .card {
                width: 60%;
                margin: 9px auto;
                padding: 9px;
                border-radius: 12px;
            }

                .card h3 {
                    font-size: 15px;
                    line-height: 1.4;
                }

                .card p {
                    font-size: 15px;
                    line-height: 1.6;
                }

            .gk-btn {
                width: 70%;
                justify-content: center;
                padding: 7px;
                font-size: 7px;
                border-radius: 6px;
                margin-top: 10px;
            }
        }

        @media screen and (max-width: 480px) {

            .header {
                font-size: 20px;
                padding: 14px 8px;
            }

            .card {
                width: 92%;
                padding: 15px;
            }

                .card h3 {
                    font-size: 18px;
                }

                .card p {
                    font-size: 14px;
                }

            .gk-btn {
                font-size: 13px;
                padding: 12px;
            }
        }
    </style>




</head>

<body>
    <form runat="server">

        <a href="Home.aspx" class="back-emoji-btn">🔙</a>

        <div class="header">Syllabus & Exam Pattern 📘</div>

        <div class="btn-box">

            <asp:Repeater ID="rptPdf" runat="server">
                <ItemTemplate>

                    <div class="card">
                        <h3><%# Eval("Title") %></h3>

                        <p><%# Eval("Description") %></p>

                        <a href='<%# Eval("PdfPath") %>'
                            target="_blank"
                            class="gk-btn">📄 View / Download PDF
                        </a>
                    </div>

                </ItemTemplate>
            </asp:Repeater>



        </div>

    </form>
</body>
</html>
