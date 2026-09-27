<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dailyupdatebox.aspx.cs" Inherits="Admin_NewsUpdatesManage" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add News Update</title>
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

        /* CARD */
        .card {
            max-width: 600px;
            background: #261a40;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,.4);
        }

            .card h3 {
                margin-top: 0;
                color: #4dd0e1;
                text-align: center;
            }

        /* INPUT FIELD */
        .field {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 8px;
            border: none;
            font-size: 14px;
            box-sizing: border-box;
        }

        /* BUTTON */
        .btn {
            width: 100%;
            padding: 12px;
            background: #4dd0e1;
            color: #1f1433;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

            .btn:hover {
                background: #7be7f3;
            }

        .menu a.active {
            background: #4dd0e1;
            color: #1f1433;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form runat="server">

        <div class="container">

            <!-- SIDEBAR -->
            <div class="sidebar">
                <h3>ADMIN</h3>

                <div class="menu">
                    <a href="Dashboard.aspx">🏠 Dashboard</a>
                    <a href="CallLaterManage.aspx">📞 Call Later</a>
                    <a href="ResultManage.aspx">Result </a>
                    <a href="ContactMessages.aspx">📩 Contact Messages</a>
                    <a href="Dailyupdatebox.aspx" class="active">Daily update box</a>
                    <a href="topbutton.aspx">📝 10,12,graduate,ITI</a>
                    <a href="PdfManage.aspx">📂 GK Material/📘 Syllabus</a>
                    <a href="sarkariyojana.aspx">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- MAIN -->
            <div class="main">

                <div class="topbar">
                    <div>Add News Update</div>
                    <a href="Logout.aspx">Logout</a>
                </div>

                <div class="content">

                    <div class="card">

                        <h3>Add News</h3>

                        <!-- Short News Text -->
                        <asp:TextBox ID="txtShortText"
                            runat="server"
                            CssClass="field"
                            Placeholder="Police Bharti 2026 released">
                        </asp:TextBox>

                        <!-- Click Here Link -->
                        <asp:TextBox ID="txtLinkUrl"
                            runat="server"
                            CssClass="field"
                            Placeholder="https://example.com/full-news">
                        </asp:TextBox>

                        <asp:Button ID="btnSave"
                            runat="server"
                            Text="Save News"
                            CssClass="btn"
                            OnClick="btnSave_Click" />

                    </div>
                    <br />
                    <br />

                    <asp:GridView ID="gvNews" runat="server"
                        AutoGenerateColumns="False"
                        Width="100%"
                        DataKeyNames="Id"
                        OnRowDeleting="gvNews_RowDeleting"
                        OnRowCommand="gvNews_RowCommand"
                        Style="background: white; color: black; border-radius: 10px;">

                        <Columns>

                            <asp:BoundField DataField="Id" HeaderText="ID" />

                            <asp:BoundField DataField="ShortText" HeaderText="News Title" />

                            <asp:BoundField DataField="LinkUrl" HeaderText="Link URL" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnEdit"
                                        runat="server"
                                        Text="Edit"
                                        CommandName="EditRow"
                                        CommandArgument='<%# Eval("Id") %>'
                                        ForeColor="Blue" />

                                    &nbsp; | &nbsp;

                <asp:LinkButton
                    ID="btnDelete"
                    runat="server"
                    Text="Delete"
                    CommandName="Delete"
                    CommandArgument='<%# Eval("Id") %>'
                    ForeColor="Red"
                    OnClientClick="return confirm('Delete this news?');" />

                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>
            </div>

        </div>

    </form>
</body>
</html>
