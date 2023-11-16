using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchool
{
    public partial class Instructor : System.Web.UI.Page
    {
        SchoolDataContext dbcon;

        // BV Connection String
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        // TK Connection String
        //string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\travis kunkel\\Source\\Repos\\bradyvogt\\Assignment-4\\App_Data\\KarateSchool.mdf\";Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                if (HttpContext.Current.Session["userType"].ToString().Trim() == "Member")
                {
                    Session.Clear();
                    Session.RemoveAll();
                    Session.Abandon();
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    Response.Redirect("Logon.aspx", true);
                }
            }

            dbcon = new SchoolDataContext(conn);

            int loggedInInstructorId = Convert.ToInt32(HttpContext.Current.Session["userID"]);

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