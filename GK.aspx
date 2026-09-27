<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GK.aspx.cs" Inherits="GK" %>

<!DOCTYPE html>
<html>
<head>
    <title>GK મટિરિયલ્સ</title>

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
            position: absolute;
            top: 15px;
            left: 15px;
            font-size: 26px;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
        }

        .card {
            background: linear-gradient(135deg, #092134, #0b2440);
            margin: 25px auto;
            padding: 22px;
            width: 55%;
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

            .card {
                width: 70%;
                margin: 9px auto;
                padding: 9px;
                border-radius: 6px;
            }

                .card h3 {
                    font-size: 15px;
                    line-height: 1.4;
                }

                .card p {
                    font-size: 14px;
                    line-height: 1.6;
                }

            .gk-btn {
                width: 50%;
                justify-content: center;
                padding: 7px;
                font-size: 7px;
                border-radius: 6px;
                margin-top: 7px;
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
                    font-size: 17px;
                }

                .card p {
                    font-size: 13px;
                }

            .gk-btn {
                font-size: 13px;
                padding: 12px;
                border-radius: 10px;
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <button type="button" class="back-btn" onclick="history.back();">🔙</button>


        <div class="header">GK મટિરિયલ્સ 📚 </div>


        <asp:Repeater ID="rptGK" runat="server">
            <ItemTemplate>

                <div class="card">

                    <h3><%# Eval("Title") %></h3>

                    <p><%# Eval("Description") %></p>

                    <a href='GKDetail.aspx?id=<%# Eval("Id") %>' class="gk-btn">📄 વધુ વાંચો
                    </a>

                </div>

            </ItemTemplate>
        </asp:Repeater>


    </form>

</body>
</html>
