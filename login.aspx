<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Login.aspx.cs"
    Inherits="Admin_Login" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Login</title>

    <style>
        body{
            margin:0;
            font-family:Arial;
            background:#1f1433; /* Page background */
            color:#ffffff;
        }

        .login-box{
            width:360px;
            margin:130px auto;
            background: linear-gradient(135deg, #2d1f4f, #24163d); /* DIFFERENT CARD COLOR */
            padding:28px;
            border-radius:14px;
            border:1px solid #4dd0e140;
            box-shadow:0 12px 30px rgba(0,0,0,.55);
        }

        h2{
            text-align:center;
            margin-top:0;
            color:#4dd0e1;
            letter-spacing:1px;
        }

        .field{
            width:100%;
            padding:12px;
            margin:12px 0;
            border-radius:8px;
            border:none;
            outline:none;
            font-size:14px;
        }

        .field:focus{
            box-shadow:0 0 0 2px #4dd0e160;
        }

        .btn{
            width:100%;
            padding:12px;
            background:#4dd0e1;
            color:#1f1433;
            border:none;
            border-radius:8px;
            font-weight:bold;
            cursor:pointer;
            font-size:15px;
            transition:0.3s;
        }

        .btn:hover{
            background:#ffffff;
            color:#1f1433;
            box-shadow:0 6px 15px rgba(0,0,0,.35);
        }

        .error{
            color:#ff8a80;
            text-align:center;
            margin-top:12px;
        }
    </style>
</head>

<body>
<form runat="server">

    <div class="login-box">
        <h2>ADMIN LOGIN</h2>

        <asp:TextBox  ID="txtUser"  runat="server" 
   CssClass="field" 
            Placeholder="Username" />

        <asp:TextBox 
            ID="txtPass" 
            runat="server" 
            CssClass="field" 
            TextMode="Password" 
            Placeholder="Password" />

        <asp:Button 
            ID="btnLogin" 
            runat="server" 
            Text="LOGIN" 
            CssClass="btn"
            OnClick="btnLogin_Click" />

        <asp:Label 
            ID="lblMsg" 
            runat="server" 
            CssClass="error" />
    </div>   <!-- ✅ THIS WAS MISSING -->

</form>
</body>

</html>
