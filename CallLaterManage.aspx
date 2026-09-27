<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CallLaterManage.aspx.cs" Inherits="Admin_CallLaterManage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Call Later Manage</title>

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
            padding: 14px 22px;
            color: white;
            text-decoration: none;
            font-size: 18px;
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
            background: #261a40;
            padding: 20px;
            font-size: 28px;
            font-weight: bold;
            border-bottom: 2px solid #4dd0e1;
        }

        .content {
            padding: 30px;
        }

        .card {
            max-width: 700px;
            background: #261a40;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,.4);
        }

            .card h2 {
                margin-top: 0;
                color: #4dd0e1;
            }

        .field {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border-radius: 8px;
            border: none;
            font-size: 15px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: #4dd0e1;
            color: #1f1433;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
        }

            .btn:hover {
                background: #6fe7f7;
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
                    <a href="Dashboard.aspx">🏠 Dashboard</a>
                    <a href="CallLaterManage.aspx" class="active">📞 Call Later</a>
                    <a href="ResultManage.aspx">Result </a>
                    <a href="ContactMessages.aspx">📩 Contact Messages</a>
                    <a href="Dailyupdatebox.aspx">📰 Daily update box</a>
                    <a href="topbutton.aspx">📝 10,12,Graduate,ITI</a>
                    <a href="PdfManage.aspx">📂 GK Material</a>
                    <a href="YojanaManage.aspx">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- Main -->

            <div class="main">

                <div class="topbar">
                    Call Later Manage
                </div>

                <div class="content">

                    <div class="card">

                        <h2>Add Call Later Link</h2>

                        <asp:TextBox
                            ID="txtTitle"
                            runat="server"
                            CssClass="field"
                            placeholder="Example: SSC Hall Ticket">
                        </asp:TextBox>

                        <asp:TextBox
                            ID="txtLink"
                            runat="server"
                            CssClass="field"
                            placeholder="Example: https://ssc.gov.in">
                        </asp:TextBox>

                        <asp:Button
                            ID="btnSave"
                            runat="server"
                            Text="Save"
                            CssClass="btn"
                            OnClick="btnSave_Click" />

                    </div>
                    <br />
                    <br />
                    <asp:GridView ID="gvCallLater" runat="server"
                        AutoGenerateColumns="False"
                        Width="100%"
                        DataKeyNames="Id"
                        OnRowDeleting="gvCallLater_RowDeleting"
                        OnRowCommand="gvCallLater_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="Id" HeaderText="ID" />

                            <asp:BoundField DataField="Title" HeaderText="Title" />

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
            OnClientClick="return confirm('Delete this item?');" />

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
