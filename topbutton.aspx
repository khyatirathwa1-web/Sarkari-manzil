<%@ Page Language="C#" AutoEventWireup="true" CodeFile="topbutton.aspx.cs" Inherits="Admin_JobDetail" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Jobs</title>

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
            padding: 20px;
            overflow: auto;
        }

        .card {
            background: #261a40;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 25px;
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
        }

        a.action {
            color: #4dd0e1;
            text-decoration: none;
            margin-right: 10px;
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
                    <a href="topbutton.aspx" class="active">📝 10,12,graduate,ITI </a>
                    <a href="PdfManage.aspx">📂 GK Material/📘 Syllabus</a>
                    <a href="sarkariyojana.aspx">📜 Sarkari Yojana</a>
                    <a href="Logout.aspx">🚪 Logout</a>
                </div>
            </div>

            <!-- MAIN -->
            <div class="main">

                <div class="topbar">
                    <div>Manage Jobs</div>
                    <a href="Logout.aspx" style="color: #4dd0e1;">Logout</a>
                </div>

                <div class="content">

                    <!-- ADD / EDIT FORM -->
                    <div class="card">
                        <h3 style="color: #4dd0e1;">Add / Edit Job</h3>

                        <asp:HiddenField ID="hfId" runat="server" />

                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="field">
                            <asp:ListItem Text="10th Pass" Value="10th" />
                            <asp:ListItem Text="12th Pass" Value="12th" />
                            <asp:ListItem Text="Graduate" Value="Graduate" />
                            <asp:ListItem Text="ITI" Value="ITI" />

                        </asp:DropDownList>

                        <asp:TextBox ID="txtTitle" runat="server" CssClass="field" Placeholder="Job Title" />
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="field" Placeholder="Department / Board" />
                        <asp:TextBox ID="txtPostName" runat="server" CssClass="field" Placeholder="Post Name" />
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="field" Placeholder="Qualification" />
                        <asp:TextBox ID="txtSalary" runat="server" CssClass="field" Placeholder="Salary" />
                        <asp:TextBox ID="txtRecruitment" runat="server" CssClass="field" Placeholder="Recruitment Type" />
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="field" Placeholder="Job Location" />

                        <asp:TextBox ID="txtShort" runat="server" CssClass="field"
                            TextMode="MultiLine" Rows="2" Placeholder="Short Description" />

                        <asp:TextBox ID="txtFull" runat="server" CssClass="field"
                            TextMode="MultiLine" Rows="4" Placeholder="Full Description" />

                        <asp:TextBox ID="txtLink" runat="server" CssClass="field" Placeholder="Official Link" />
                        <asp:TextBox ID="txtApplyLink" runat="server" CssClass="field" Placeholder="Apply Link" />

                        <asp:CheckBox ID="chkActive" runat="server" Text=" Active" Checked="true" />

                        <br />
                        <br />
                        <asp:Button ID="btnSave" runat="server" Text="Save Job"
                            CssClass="btn" OnClick="btnSave_Click" />
                    </div>

                    <!-- JOB LIST -->
                    <div class="card">
                        <h3 style="color: #4dd0e1;">Jobs List</h3>

                        <asp:Repeater ID="rptJobs" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Active</th>
                                        <th>Action</th>
                                    </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("JobTitle") %></td>
                                    <td><%# Eval("Category") %></td>
                                    <td><%# (bool)Eval("IsActive") ? "Yes" : "No" %></td>
                                    <td>
                                        <a class="action" href='topbutton.aspx?edit=<%# Eval("Id") %>'>Edit</a>

                                        <a class="action" href='topbutton.aspx?delete=<%# Eval("Id") %>'
                                            onclick="return confirm('Delete this job?')">Delete</a>
                                    </td>
                                </tr>
                            </ItemTemplate>

                            <FooterTemplate></table></FooterTemplate>
                        </asp:Repeater>
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
