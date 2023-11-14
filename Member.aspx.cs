using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchool
{
    public partial class Member : System.Web.UI.Page
    {
        SchoolDataContext dbcon;

        string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
        //string connStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            dbcon = new SchoolDataContext(connStr);

            int loggedInMemberId = 10;

            var results = from sect in dbcon.Sections
                          join inst in dbcon.Instructors on sect.Instructor_ID equals inst.InstructorID
                          where sect.Member_ID == loggedInMemberId
                          select new { sect.SectionName, inst.InstructorFirstName, inst.InstructorLastName, sect.SectionFee, sect.SectionStartDate };

            memberGridView.DataSource = results;
            memberGridView.DataBind();

            Member member = (from m in dbcon.Members
                             where m.Member_UserID == loggedInMemberId
                             select m).First();

            lblFirstName.Text = member.MemberFirstName;
            lblLastName.Text = member.MemberLastName;
        }
        

    }
}