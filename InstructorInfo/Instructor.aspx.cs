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
        // string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        // TK Connection String
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\travis kunkel\\Source\\Repos\\bradyvogt\\Assignment-4\\App_Data\\KarateSchool.mdf\";Integrated Security=True;Connect Timeout=30";

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

            // Initialize connection string
            dbcon = new SchoolDataContext(conn);

            // Check if page is loading for the first time
            if (!IsPostBack)
            {
                // If instructor, relevant info
                if (HttpContext.Current.Session["userType"].ToString().Trim() == "Instructor")
                {
                    ShowData(Convert.ToInt32(HttpContext.Current.Session["userID"]));

                    var instructor = (from i in dbcon.Instructors
                                      where i.InstructorID == Convert.ToInt32(HttpContext.Current.Session["userID"])
                                      select new
                                      {
                                          fullName = i.InstructorFirstName + " " + i.InstructorLastName
                                      }).First();

                    lblFullName.Text = "(" + instructor.fullName + ")";
                }
                // Must be admin
                else
                {
                    // Get all instructors. Concat first and last names for dropdowns
                    var instructors = from x in dbcon.Instructors
                                        select new
                                        {
                                            x.InstructorID,
                                            FullName = x.InstructorFirstName + " " + x.InstructorLastName
                                        };

                    // Prime dropdown
                    ddlInstructors.DataTextField = "FullName";
                    ddlInstructors.DataValueField = "InstructorID";

                    // Add data to dropdown
                    ddlInstructors.DataSource = instructors;
                    ddlInstructors.DataBind();

                    // Show label and dropdown
                    Label1.Visible = true;
                    ddlInstructors.Visible = true;

                    // Show data for first instructor
                    ShowData(Convert.ToInt32(ddlInstructors.SelectedValue));
                }
            }
        }

        protected void ddlInstructors_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Update gridview for selected instructor
            ShowData(Convert.ToInt32(ddlInstructors.SelectedValue));
        }
        private void ShowData(int ID)
        {
            var results = from sect in dbcon.Sections
                          join memb in dbcon.Members on sect.Member_ID equals memb.Member_UserID
                          where sect.Instructor_ID == ID
                          select new { sect.SectionName, memb.MemberFirstName, memb.MemberLastName };

            instructorGridView.DataSource = results;
            instructorGridView.DataBind();
        }
    }
}