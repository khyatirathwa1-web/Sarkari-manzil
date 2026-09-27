<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PdfManage.aspx.cs" Inherits="Admin_PdfManage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Upload PDF</title>

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
        }

        .content {
            padding: 30px;
        }

        .card {
            max-width: 600px;
            background: #261a40;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,.4);
        }

        .field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: none;
        }

        .btn {
            margin-top: 15px;
            padding: 12px;
            background: #4dd0e1;
            color: #1f1433;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            width: 100%;
            cursor: pointer;
        }

        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #444;
        }

        a {
            color: #4dd0e1;
            text-decoration: none;
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
                    <a href="CallLaterManage.aspx" >📞 Call Later</a>
                     <a href="ResultManage.aspx" > Result </a>
                    <a href="ContactMessages.aspx">📩 Contact Messages</a>
                    <a href="Dailyupdatebox.aspx">Daily update box</a>
                    <a href="topbutton.aspx">📝 10,12,graduate,ITI </a>
                    <a href="PdfManage.aspx" class="active">📂 GK Material/📘 Syllabus</a>
                    <a href="sarkariyojana.aspx">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- MAIN -->
            <div class="main">

                <div class="topbar">
                    <div>Upload PDF</div>
                    <a href="Logout.aspx">Logout</a>
                </div>

                <div class="content">

                    <!-- UPLOAD CARD -->
                    <div class="card">
                        <h3>Add PDF</h3>

                        <asp:DropDownList ID="ddlCat" runat="server" CssClass="field">
                            <asp:ListItem Text="GK" Value="GK" />
                            <asp:ListItem Text="Syllabus" Value="Syllabus" />
                        </asp:DropDownList>

                        <asp:TextBox ID="txtTitle" runat="server" CssClass="field" placeholder="PDF Title" />
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="field" placeholder="Description" />
                        <asp:FileUpload ID="fuPdf" runat="server" CssClass="field" />

                        <asp:CheckBox ID="chkActive" runat="server" Checked="true" />
                        Active

                <asp:Button ID="btnSave" runat="server"
                    Text="Upload PDF"
                    CssClass="btn"
                    OnClick="btnSave_Click" />
                    </div>

                    <!-- PDF LIST -->
                    <h3 style="margin-top: 40px;">Uploaded PDFs</h3>

                    <asp:Repeater ID="rptPdf" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Title") %></td>
                                <td><%# Eval("Category") %></td>
                                <td>
                                    <a href='<%# Eval("PdfPath") %>' target="_blank">View</a> |
                            <asp:LinkButton
                                runat="server"
                                Text="Delete"
                                CommandArgument='<%# Eval("Id") %>'
                                OnCommand="DeletePdf"
                                OnClientClick="return confirm('Delete PDF?');"
                                ForeColor="Red" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
