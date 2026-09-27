<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sarkariyojana.aspx.cs" Inherits="Admin_Yojana" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sarkari Yojana</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #1f1433;
            color: white;
        }

        .container {
            display: flex;
            height: 100vh;
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
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 20px;
        }

        .field {
            width: 100%;
            padding: 10px;
            margin: 6px 0;
            border-radius: 6px;
            border: none;
        }

        .btn {
            padding: 10px 18px;
            background: #4dd0e1;
            color: #1f1433;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #4dd0e140;
        }

        th {
            color: #4dd0e1;
            text-align: left;
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
                    <a href="Dailyupdatebox.aspx">Daily update box</a>
                    <a href="topbutton.aspx">📝 10,12,graduate,ITI </a>
                    <a href="PdfManage.aspx">📂 GK Material/📘 Syllabus</a>
                    <a href="sarkariyojana.aspx" class="active">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- MAIN -->
            <div class="main">
                <div class="topbar">
                    <div>Sarkari Yojana</div>
                    <a href="Logout.aspx" style="color: #4dd0e1;">Logout</a>
                </div>

                <div class="content">

                    <!-- ADD YOJANA -->
                    <div class="card">
                        <h3 style="color: #4dd0e1;">Add / Edit Yojana</h3>
                        <asp:TextBox ID="txtSeoUrl" runat="server" CssClass="field" Placeholder="SEO URL (pm-awas-yojana)" />

                        <asp:HiddenField ID="hfId" runat="server" />
                        <asp:HiddenField ID="hfOldTitle" runat="server" />


                        <asp:TextBox ID="txtName" runat="server" CssClass="field" Placeholder="Yojana Name" />
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="field" Placeholder="Department" />
                        <asp:TextBox ID="txtEligibility" runat="server" CssClass="field" Placeholder="Eligibility" />
                        <asp:TextBox ID="txtBenefits" runat="server" CssClass="field" Placeholder="Benefits" />

                        <asp:TextBox ID="txtSchemeType" runat="server" CssClass="field" Placeholder="Scheme Type (Central / State)" />
                        <asp:TextBox ID="txtState" runat="server" CssClass="field" Placeholder="State (if any)" />

                        <asp:TextBox ID="txtDocs" runat="server" CssClass="field"
                            TextMode="MultiLine" Rows="2" Placeholder="Documents Required" />

                        <asp:TextBox ID="txtApply" runat="server" CssClass="field"
                            TextMode="MultiLine" Rows="3" Placeholder="How To Apply" />

                        <asp:TextBox ID="txtLink" runat="server" CssClass="field" Placeholder="Official Link" />

                        <asp:CheckBox ID="chkActive" runat="server" Text=" Active" Checked="true" />
                        <br />
                        <br />

                        <!-- 🔴 IMPORTANT FIX -->
                        <asp:Button ID="btnSave" runat="server"
                            Text="Save Yojana"
                            CssClass="btn"
                            OnClick="btnSave_Click" />
                    </div>

                    <!-- YOJANA LIST (FIX-1 ADDED HERE) -->
                    <div class="card">
                        <h3 style="color: #4dd0e1;">Yojana List</h3>

                        <asp:Repeater ID="rptYojana" runat="server">
                            <ItemTemplate>

                                <div class="card">

                                    <h3><%# Eval("YojanaName") %></h3>

                                    <p>
                                        🏢 <%# Eval("Department") %><br />
                                        📍 <%# Eval("State") %>
                                    </p>

                                    <br />

                                    <a href='sarkariyojana.aspx?edit=<%# Eval("Id") %>'
                                        style="color: #4dd0e1; font-weight: bold; text-decoration: none;">Edit
                                    </a>

                                    &nbsp; | &nbsp;

            <a href='sarkariyojana.aspx?delete=<%# Eval("Id") %>'
                onclick="return confirm('Delete this Yojana?');"
                style="color: red; font-weight: bold; text-decoration: none;">Delete
            </a>

                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>
            </div>

        </div>

    </form>
</body>
</html>
