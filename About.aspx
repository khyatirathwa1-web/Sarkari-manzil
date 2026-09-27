<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>અમારા વિશે</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0a2240;
            color: white;
        }

        .header {
            background: linear-gradient(90deg, #ff0080, #ff8c00);
            padding: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            border-bottom: 4px solid #fff;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }

        .container {
            margin: 40px auto;
            max-width: 600px;
            background: rgba(255,255,255,0.05);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
            line-height: 1.7;
        }

            .container p {
                font-size: 18px;
                margin-bottom: 15px;
            }

        .highlight {
            color: #ffe600;
            font-weight: bold;
        }

        .back-btn {
            display: inline-block;
            text-decoration: none;
            padding: 12px 25px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(45deg, #00c6ff, #0072ff);
            border-radius: 50px;
            box-shadow: 0 5px 15px rgba(0,200,255,0.6);
            transition: all 0.3s ease;
        }

            .back-btn:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 20px rgba(0,200,255,0.8);
            }

        @media screen and (max-width: 768px) {
            .header {
                font-size: 22px;
                padding: 16px 10px;
                border-radius: 0 0 10px 10px;
                border-bottom: 3px solid #fff;
            }

            .container {
                width: 80%;
                max-width: 100%;
                margin: 20px auto;
                padding: 15px 18px;
                border-radius: 10px;
                line-height: 1.6;
                box-sizing: border-box;
            }

                .container p {
                    font-size: 14px;
                    margin-bottom: 12px;
                }

                .container ul {
                    padding-left: 20px;
                    margin-bottom: 15px;
                }

                    .container ul li {
                        font-size: 14px;
                        margin-bottom: 8px;
                        line-height: 1.6;
                    }

            .highlight {
                font-size: inherit;
            }

            .back-btn {
                display: inline-block;
                font-size: 13px;
                padding: 10px 18px;
                border-radius: 30px;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">

        <div class="header">Sarkari Manzil વિશે</div>

        <div class="container">
            <p>આપનું સ્વાગત છે <span class="highlight">Sarkari Manzil</span> માં – જે તમને આપશે તાજા <span class="highlight">સરકારી નોકરીના અપડેટ્સ</span> અને <span class="highlight">શૈક્ષણિક સામગ્રી</span> સરળ અને ઝડપી રીતે.</p>

            <p>અમે વિદ્યાર્થીઓ અને નોકરી શોધતા લોકો માટે નીચેની માહિતી પ્રદાન કરીએ છીએ:</p>
            <ul>
                <li>10મી, 12મી અને ગ્રેજ્યુએટ લેવલ નોકરીઓ</li>
                <li>સરકારી યોજનાઓ અને પહેલો</li>
                <li>પરીક્ષા પેટર્ન, સિલેબસ અને સામાન્ય જ્ઞાન સામગ્રી</li>
                <li>ફોર્મ ભરવા અને પરિણામ અપડેટ માટે માર્ગદર્શન અને સપોર્ટ</li>
            </ul>

            <p>અમારું લક્ષ્ય છે વિદ્યાર્થીઓને <span class="highlight">જ્ઞાન અને અવસર</span> પૂરા પાડવાનો જેથી તેઓ સરળતાથી પોતાના કરિયરના લક્ષ્યો પ્રાપ્ત કરી શકે.</p>

            <br />
            <a class="back-btn" href="Home.aspx">🔙 Back To Home</a>
        </div>

    </form>
</body>
</html>
