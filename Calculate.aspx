<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calculate.aspx.cs" Inherits="Calculate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Age Calculator</title>
    <style>
        body {
            font-family: Arial;
            background: #e5e5e5;
            padding: 20px;
        }

        .box-title {
            background: #e5f4ff;
            border: 2px solid #0a4c8b;
            border-right: none;
            padding: 12px;
            font-size: 22px;
            width: 50%;
            display: inline-block;
            border-radius: 5px 0 0 5px;
        }

        .weekday-box {
            background: #0a4c8b;
            color: white;
            padding: 12px;
            width: 91px;
            text-align: center;
            font-size: 22px;
            display: inline-block;
            border-radius: 0 5px 5px 0;
        }

        .date-input {
            width: 50%;
            padding: 14px;
            font-size: 22px;
            border: 2px solid #0a4c8b;
            border-radius: 8px;
            margin-top: 10px;
        }

        .btn {
            background: #0a4c8b;
            color: white;
            padding: 14px 32px;
            margin: 10px;
            font-size: 22px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        .result {
            margin-top: 25px;
            background: white;
            padding: 18px;
            border-radius: 10px;
            font-size: 24px;
            border: 2px solid #0a4c8b;
            width: 63%;
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

        .txtbox {
            width: 50%;
            height: 65px;
            font-size: 22px;
            padding: 14px;
            border: 2px solid #0d57a1;
            border-radius: 8px;
            outline: none;
            margin-top: 10px
        }
        /* ============================= */
        /* Mobile Responsive Layout */
        /* Calculate.aspx */
        /* ============================= */

        @media screen and (max-width: 768px) {

            body {
                padding: 12px;
            }

            .back-emoji-btn {
                font-size: 15px;
                margin: 10px;
                display: inline-block;
            }

            .box-title {
                width: 70%;
                font-size: 15px;
                padding: 5px;
                box-sizing: border-box;
            }

            .weekday-box {
                width: 70px;
                font-size: 15px;
                padding: 10px;
                box-sizing: border-box;
            }

            .date-input,
            .txtbox {
                width: 60%;
                font-size: 15px;
                padding: 10px;
                height: auto;
                box-sizing: border-box;
            }

            .btn {
                width: 60%;
                margin: 5px 0;
                padding: 10px;
                font-size: 15px;
                border-radius: 8px;
                box-sizing: border-box;
            }

            .result {
                width: 70%;
                font-size: 15px;
                padding: 18px;
                margin-top: 18px;
                box-sizing: border-box;
            }
        }

        @media screen and (max-width: 480px) {

            body {
                padding: 10px;
            }

            .box-title {
                width: 68%;
                font-size: 14px;
                padding: 8px;
            }

            .weekday-box {
                width: 60px;
                font-size: 14px;
                padding: 8px;
            }

            .date-input,
            .txtbox {
                width: 100%;
                font-size: 14px;
                padding: 10px;
            }

            .btn {
                font-size: 14px;
                padding: 12px;
            }

            .result {
                width: 100%;
                font-size: 16px;
                padding: 14px;
            }

            .back-emoji-btn {
                font-size: 20px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- Back Button -->
        <asp:LinkButton ID="btnBack" runat="server" CssClass="back-emoji-btn"
            OnClientClick="history.back(); return false;" OnClick="btnBack_Click">
         🔙
        </asp:LinkButton>

        <!-- TODAY DATE -->
        <div>
            <div class="box-title">Today Date:</div>
            <div id="lblTodayWeekday" runat="server" class="weekday-box">---</div>
        </div>

        <asp:TextBox ID="txtToday" runat="server" CssClass="date-input" ReadOnly="true"></asp:TextBox>

        <br />
        <br />

        <!-- BIRTHDAY DATE -->
        <div>
            <div class="box-title">Birthday Date:</div>
            <div id="lblBirthWeekday" runat="server" class="weekday-box">🗓️</div>
        </div>

        <asp:TextBox
            ID="txtBirthday"
            CssClass="date-input"
            runat="server"
            MaxLength="10"
            placeholder="MM/DD/YYYY"
            onkeyup="formatDate(this)">
        </asp:TextBox>
        <br />
        <br />

        <script>
            function formatDate(input) {
                let value = input.value.replace(/\D/g, ''); // numbers only

                if (value.length > 2 && value.length <= 4) {
                    value = value.slice(0, 2) + '/' + value.slice(2);
                }
                else if (value.length > 4) {
                    value = value.slice(0, 2) + '/' + value.slice(2, 4) + '/' + value.slice(4, 8);
                }

                input.value = value;
            }
        </script>

        <!-- BUTTONS -->
        <asp:Button ID="btnCalc" runat="server" Text="Calculate" CssClass="btn" OnClick="btnCalc_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn" OnClick="btnReset_Click" />

        <!-- RESULT -->
        <div id="lblResult" runat="server" class="result"></div>
    </form>
</body>
</html>
