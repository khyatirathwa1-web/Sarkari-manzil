<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="ResultManage.aspx.cs"
    Inherits="Admin_ResultManage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Result Manage</title>

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
        }

            .menu a:hover {
                background: #4dd0e1;
                color: #1f1433;
            }

            .menu a.active {
                background: #4dd0e1;
                color: #1f1433;
                font-weight: bold;
            }

        /* MAIN */
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
            padding: 20px;
        }

        .card {
            background: #261a40;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

            .card h3 {
                margin-top: 0;
                color: #4dd0e1;
            }

        .field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
            font-size: 14px;
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
            cursor: pointer;
            font-size: 15px;
        }

            .btn:hover {
                background: #67dce9;
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
                    <a href="ResultManage.aspx" class="active">🏆 Result</a>
                    <a href="ContactMessages.aspx">📩 Contact Messages</a>
                    <a href="Dailyupdatebox.aspx">📰 Daily Update</a>
                    <a href="topbutton.aspx">📝 10,12,Graduate,ITI</a>
                    <a href="PdfManage.aspx">📂 GK Material / Syllabus</a>
                    <a href="sarkariyojana.aspx">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- MAIN -->
            <div class="main">

                <div class="topbar">
                    <div>Result Management</div>
                    <a href="Logout.aspx" style="color: #4dd0e1;">Logout</a>
                </div>

                <div class="content">

                    <div class="card">
                        <h3>Add Result Update</h3>

                        <asp:TextBox
                            ID="txtTitle"
                            runat="server"
                            CssClass="field"
                            placeholder="Enter Result Title" />

                        <asp:TextBox
                            ID="txtLink"
                            runat="server"
                            CssClass="field"
                            placeholder="Enter Official Result Link" />

                        <asp:Button
                            ID="btnSave"
                            runat="server"
                            Text="Save Result"
                            CssClass="btn"
                            OnClick="btnSave_Click" />
                    </div>
                    <br />
                    <br />

                    <asp:GridView ID="gvResult" runat="server"
                        AutoGenerateColumns="False"
                        Width="100%"
                        DataKeyNames="Id"
                        OnRowDeleting="gvResult_RowDeleting"
                        OnRowCommand="gvResult_RowCommand"
                        Style="background: white; color: black; border-radius: 10px;">

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
                    OnClientClick="return confirm('Delete this result?');" />

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
