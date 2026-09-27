<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="ContactMessages.aspx.cs"
    Inherits="Admin_ContactMessages" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Contact Messages | Admin</title>

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

        /* SIDEBAR */
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
            font-size: 16px;
        }

            .menu a:hover {
                background: #4dd0e1;
                color: #1f1433;
            }

        /* MAIN AREA */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .topbar {
            height: 58px;
            background: #261a40;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            border-bottom: 2px solid #4dd0e1;
            font-size: 20px;
            font-weight: bold;
        }

            .topbar a {
                color: #4dd0e1;
                text-decoration: none;
            }

        /* CONTENT */
        .content {
            padding: 30px;
        }

        .msg-card {
            background: #2a1f47;
            border-radius: 14px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.35);
            border-left: 4px solid #4dd0e1;
        }

        .msg-name {
            font-size: 22px;
            font-weight: bold;
            color: #4dd0e1;
        }

        .msg-email {
            font-size: 15px;
            color: #b39ddb;
            margin: 8px 0;
        }

        .msg-text {
            font-size: 15px;
            line-height: 1.6;
            color: #eeeeee;
            margin-bottom: 15px;
        }

        .msg-actions {
            text-align: right;
        }

        /* BUTTONS */
        .reply-btn {
            background: #4dd0e1;
            color: #1f1433;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            margin-right: 8px;
            display: inline-block;
        }

        .delete-btn {
            background: #ff4d4d;
            color: white;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
        }

        /* REPLY PANEL */
        .reply-panel {
            margin-top: 30px;
            background: #261a40;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,.4);
        }

            .reply-panel h3 {
                margin-top: 0;
                color: #4dd0e1;
            }

            .reply-panel textarea {
                width: 100%;
                min-height: 130px;
                border: none;
                border-radius: 10px;
                padding: 12px;
                margin-top: 12px;
                font-family: Arial;
                font-size: 14px;
            }

        .send-btn {
            margin-top: 15px;
            background: #4dd0e1;
            color: #1f1433;
            border: none;
            padding: 12px 24px;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
        }

        .menu a.active {
            background: #4dd0e1;
            color: #1f1433;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">

            <!-- SIDEBAR -->
            <div class="sidebar">
                <h3>ADMIN</h3>

                <div class="menu">
                    <a href="Dashboard.aspx">🏠 Dashboard</a>
                    <a href="CallLaterManage.aspx">📞 Call Later</a>
                     <a href="ResultManage.aspx" > Result </a>
                    <a href="ContactMessages.aspx" class="active">📩 Contact Messages</a>
                    <a href="Dailyupdatebox.aspx">Daily update box</a>
                    <a href="topbutton.aspx">📝 10,12,graduate,ITI</a>
                    <a href="PdfManage.aspx">📂 GK Material/📘 Syllabus</a>
                    <a href="sarkariyojana.aspx">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- MAIN -->
            <div class="main">

                <div class="topbar">
                    <div>Contact Messages</div>
                    <a href="Logout.aspx">Logout</a>
                </div>

                <div class="content">

                    <asp:Repeater ID="rptContact" runat="server" OnItemCommand="rptContact_ItemCommand">
                        <ItemTemplate>

                            <div class="msg-card">

                                <div class="msg-name">
                                    <%# Eval("Name") %>
                                </div>

                                <div class="msg-email">
                                    <%# Eval("Email") %>
                                </div>

                                <div class="msg-text">
                                    <%# Eval("Message") %>
                                </div>

                                <div class="msg-actions">

                                    <asp:LinkButton
                                        runat="server"
                                        Text="✉ Reply"
                                        CssClass="reply-btn"
                                        CommandName="reply"
                                        CommandArgument='<%# Eval("Id") + "|" + Eval("Email") %>' />

                                    <asp:LinkButton
                                        runat="server"
                                        Text="🗑 Delete"
                                        CssClass="delete-btn"
                                        CommandName="delete"
                                        CommandArgument='<%# Eval("Id") %>'
                                        OnClientClick="return confirm('Delete this message?');" />

                                </div>

                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Panel ID="pnlReply" runat="server" Visible="false" CssClass="reply-panel">

                        <h3>Reply Message</h3>

                        <asp:Label ID="lblReplyEmail" runat="server"></asp:Label>

                        <asp:HiddenField ID="hfReplyId" runat="server" />

                        <asp:TextBox ID="txtReply"
                            runat="server"
                            TextMode="MultiLine"
                            placeholder="Type reply here...">
                        </asp:TextBox>

                        <br />

                        <asp:Button ID="btnSendReply"
                            runat="server"
                            Text="Send Reply"
                            CssClass="send-btn"
                            OnClick="btnSendReply_Click" />

                    </asp:Panel>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
