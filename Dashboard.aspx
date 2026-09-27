<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs"
    Inherits="Admin_Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #1f1433;
            color: white;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 230px;
            background: #1a102c;
            padding-top: 20px;
        }

        .sidebar h3 {
            text-align: center;
            color: #4dd0e1;
            margin-bottom: 30px;
        }

        .menu a {
            display: block;
            padding: 12px 22px;
            color: white;
            text-decoration: none;
        }

        .menu a:hover,
        .menu a.active {
            background: #4dd0e1;
            color: #1f1433;
            font-weight: bold;
        }

        /* Main */
        .main {
            flex: 1;
        }

        .topbar {
            height: 58px;
            background: #261a40;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            border-bottom: 2px solid #4dd0e1;
        }

        .content {
            padding: 25px;
        }

        .welcome {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #4dd0e1;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: #261a40;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        .card h3 {
            margin: 0;
            font-size: 18px;
            color: #4dd0e1;
        }

        .count {
            font-size: 34px;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<form runat="server">

    <div class="container">

        <!-- Sidebar -->
        <div class="sidebar">
            <h3>ADMIN</h3>

            <div class="menu">
                <a href="Dashboard.aspx" class="active">🏠 Dashboard</a>
                <a href="CallLaterManage.aspx">📞 Call Later</a>
                <a href="ResultManage.aspx">🏆 Result</a>
                <a href="ContactMessages.aspx">📩 Contact Messages</a>
                <a href="Dailyupdatebox.aspx">📰 Daily Update</a>
                <a href="topbutton.aspx">📝 10,12,Graduate,ITI</a>
                <a href="PdfManage.aspx">📂 GK Material / Syllabus</a>
                <a href="sarkariyojana.aspx">📜 Sarkari Yojana</a>
                <a href="Logout.aspx">🚪 Logout</a>
            </div>
        </div>

        <!-- Main -->
        <div class="main">

            <div class="topbar">
                <div>Admin Dashboard</div>
                <a href="Logout.aspx" style="color:#4dd0e1;">Logout</a>
            </div>

            <div class="content">

                <div class="welcome">
                    Welcome to Sarkari Manzil Admin Panel 🚀
                </div>

                <div class="cards">

                    <div class="card">
                        <h3>Total Results</h3>
                        <div class="count">
                            <asp:Label ID="lblResults" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>

                    <div class="card">
                        <h3>Total Call Later</h3>
                        <div class="count">
                            <asp:Label ID="lblCallLater" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>

                    <div class="card">
                        <h3>Total Latest News</h3>
                        <div class="count">
                            <asp:Label ID="lblNews" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>

                    <div class="card">
                        <h3>Contact Messages</h3>
                        <div class="count">
                            <asp:Label ID="lblContact" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>

</form>

</body>
</html>