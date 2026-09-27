using System;
using System.Globalization;

public partial class Calculate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // આજની તારીખ show કરો
            DateTime today = DateTime.Today;
            txtToday.Text = today.ToString("MM/dd/yyyy");
            lblTodayWeekday.InnerText = today.DayOfWeek.ToString();
        }
    }

    protected void btnCalc_Click(object sender, EventArgs e)
    {
        lblResult.InnerText = ""; // જૂનું result clear

        // Birthday input strict format માં parse કરો
        DateTime birthDate;
        bool isValid = DateTime.TryParseExact(
            txtBirthday.Text,
            "MM/dd/yyyy",
            CultureInfo.InvariantCulture,
            DateTimeStyles.None,
            out birthDate
        );

        if (!isValid)
        {
            lblResult.InnerText = "કૃપા કરીને સાચી જન્મ તારીખ લખો (MM/DD/YYYY).";
            return;
        }

        DateTime today = DateTime.Today;

        // Year, Month, Day calculate
        int years = today.Year - birthDate.Year;
        int months = today.Month - birthDate.Month;
        int days = today.Day - birthDate.Day;

        if (days < 0)
        {
            months--;

            DateTime previousMonth = today.AddMonths(-1);
            days += DateTime.DaysInMonth(previousMonth.Year, previousMonth.Month);
        }

        if (months < 0)
        {
            years--;
            months += 12;
        }

        // Birthday નો weekday show કરો
        lblBirthWeekday.InnerText = birthDate.DayOfWeek.ToString();

        // Gujarati Result (Year → Month → Day)
        lblResult.InnerText = "તમારી ઉંમર : "
                            + years + " વર્ષ, "
                            + months + " મહિના, "
                            + days + " દિવસ";
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtBirthday.Text = "";
        lblBirthWeekday.InnerText = "🗓️";
        lblResult.InnerText = "";
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {

    }
}