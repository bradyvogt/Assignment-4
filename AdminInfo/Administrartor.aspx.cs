using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchool.AdminInfo
{
    public partial class Administrartor : System.Web.UI.Page
    {
        SchoolDataContext dbcon;

        // BV Connection String
        // string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        // TK Connection String
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\travis kunkel\\Source\\Repos\\bradyvogt\\Assignment-4\\App_Data\\KarateSchool.mdf\";Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Get member names, phone numbers and dates joined
            var memberResults = from x in dbcon.Members
                          select new 
                          { 
                              x.MemberFirstName, 
                              x.MemberLastName, 
                              x.MemberPhoneNumber,
                              x.MemberDateJoined 
                          };
            
            // Get instructor names
            var instructorResults = from x in dbcon.Instructors
                                    select new 
                                    { 
                                        x.InstructorFirstName, 
                                        x.InstructorLastName,
                                    };

            // Bind and display results
            dgvMembers.DataSource = memberResults;
            dgvInstructors.DataSource = instructorResults;
            dgvMembers.DataBind();
            dgvInstructors.DataBind();
        }
    }
}