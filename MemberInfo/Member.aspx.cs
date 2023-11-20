using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchool
{
    public partial class Member : System.Web.UI.Page
    {
        SchoolDataContext dbcon;

        // BV Connection String
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        // TK Connection String
        // string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\travis kunkel\\Source\\Repos\\bradyvogt\\Assignment-4\\App_Data\\KarateSchool.mdf\";Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                if (HttpContext.Current.Session["userType"].ToString().Trim() == "Instructor")
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
                // If member, relevant info
                if (HttpContext.Current.Session["userType"].ToString().Trim() == "Member")
                {
                    ShowData(Convert.ToInt32(HttpContext.Current.Session["userID"]));

                    var member = (from m in dbcon.Members
                                  where m.Member_UserID == Convert.ToInt32(HttpContext.Current.Session["userID"])
                                  select new
                                  {
                                      FullName = m.MemberFirstName + " " + m.MemberLastName
                                  }).First();

                    lblFullName.Text = "(" + member.FullName + ")";
                }
                // Must be admin
                else
                {
                    // Check if the page is loaded for the first time
                    if (!IsPostBack)
                    {
                        // Get all members and instructors. Concat first and last names for dropdowns
                        var members = from x in dbcon.Members
                                      select new
                                      {
                                          x.Member_UserID,
                                          Fullname = x.MemberFirstName + " " + x.MemberLastName
                                      };

                        // Prime dropdowns
                        ddlMembers.DataTextField = "FullName";
                        ddlMembers.DataValueField = "Member_UserID";

                        // Add data to both dropdowns
                        ddlMembers.DataSource = members;
                        ddlMembers.DataBind();

                        // Show label and dropdown
                        Label1.Visible = true;
                        ddlMembers.Visible = true;

                        // Show data for first member
                        ShowData(Convert.ToInt32(ddlMembers.SelectedValue));
                    }
                }
            }
        }

        protected void ddlInstructors_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Update gridview for selected member
            ShowData(Convert.ToInt32(ddlMembers.SelectedValue));
        }

        private void ShowData(int ID)
        {
            var results = from sect in dbcon.Sections
                          join inst in dbcon.Instructors on sect.Instructor_ID equals inst.InstructorID
                          where sect.Member_ID == ID
                          select new { sect.SectionName, inst.InstructorFirstName, inst.InstructorLastName, sect.SectionFee, sect.SectionStartDate };

            memberGridView.DataSource = results;
            memberGridView.DataBind();
        }
    }
}