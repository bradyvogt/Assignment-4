using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateSchool
{
    public partial class Logon : System.Web.UI.Page
    {
        // Connection to the database
        SchoolDataContext dbcon;

        // BV Connection String
        // string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vogtk\\Downloads\\KarateSchool\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";

        // TK Connection String
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\travis kunkel\\Source\\Repos\\bradyvogt\\Assignment-4\\App_Data\\KarateSchool.mdf\";Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                    Session.Clear();
                    Session.RemoveAll();
                    Session.Abandon();
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    Response.Redirect("Logon.aspx", true);
                
            }

            // Initialize connection string
            dbcon = new SchoolDataContext(conn);
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            // Get username and password from the Login control
            string username = Login1.UserName;
            string password = Login1.Password;

            // Add username and password to the Session
            HttpContext.Current.Session["username"] = username;
            HttpContext.Current.Session["password"] = password;

            // Search for current user, validateusername and password
            NetUser myUser = (from x in dbcon.NetUsers
                             where x.UserName == HttpContext.Current.Session["username"].ToString() && 
                                   x.UserPassword == HttpContext.Current.Session["password"].ToString()
                             select x).FirstOrDefault();


            if (myUser == null)
            {
                // If user is not found, redirect to Logon page
                Response.Redirect("Logon.aspx", true);
            }
            else
            {
                //Add UserID and User type to the Session
                HttpContext.Current.Session["userID"] = myUser.UserID;
                HttpContext.Current.Session["userType"] = myUser.UserType;
            }
            
            // Redirect to the appropriate page based on the user type
            if (HttpContext.Current.Session["userType"].ToString().Trim() == "Member")
            {
                FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.Session["username"].ToString(), true);

                Response.Redirect("~/MemberInfo/Member.aspx");
            }
            else if (HttpContext.Current.Session["userType"].ToString().Trim() == "Instructor")
            {
                FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.Session["username"].ToString(), true);

                Response.Redirect("~/InstructorInfo/Instructor.aspx");
            }
            else if (HttpContext.Current.Session["userType"].ToString().Trim() == "Administrator")
            {
                FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.Session["username"].ToString(), true);

                Response.Redirect("~/AdminInfo/Administrator.aspx");
            }
        }
    }
}