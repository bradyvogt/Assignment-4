using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchool
{
    public partial class Instructor : System.Web.UI.Page
    {
        SchoolDataContext dbcon;
        string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
        //string connStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            dbcon = new SchoolDataContext(connStr);

            int loggedInInstructorId = 18;

            var results = from sect in dbcon.Sections
                          join memb in dbcon.Members on sect.Member_ID equals memb.Member_UserID
                          where sect.Instructor_ID == loggedInInstructorId
                          select new { sect.SectionName, memb.MemberFirstName, memb.MemberLastName};

            instructorGridView.DataSource = results;
            instructorGridView.DataBind();

            Instructor instructor = (from i in dbcon.Instructors
                                    where i.InstructorID == loggedInInstructorId
                                    select i).First();

            lblFirstName.Text = instructor.InstructorFirstName;
            lblLastName.Text = instructor.InstructorLastName;
        }
    }
}