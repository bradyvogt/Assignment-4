using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.Security;
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
        string conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\travis kunkel\\source\\repos\\bradyvogt\\Assignment-4\\App_Data\\KarateSchool.mdf\";Integrated Security=True;Connect Timeout=30";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check that user is logged in
            if (Session.Count != 0)
            {
                // Check that user is an administrator
                if (HttpContext.Current.Session["userType"].ToString().Trim() != "Administrator")
                {
                    // If not, redirect to logon page
                    Session.Clear();
                    Session.RemoveAll();
                    Session.Abandon();
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    Response.Redirect("Logon.aspx", true);
                }
            }

            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Check if the page is loaded for the first time
            if (!IsPostBack)
            {
                // Show all members and instructors
                ShowAllMembers();
                ShowAllInstructors();

                // Create connection to database
                dbcon = new SchoolDataContext(conn);

                // Get all members and instructors. Concat first and last names for dropdowns
                var members = from x in dbcon.Members
                              select new
                              {
                                  x.Member_UserID,
                                  Fullname = x.MemberFirstName + " " + x.MemberLastName
                              };
                var instructors = from x in dbcon.Instructors
                                  select new
                                  {
                                      x.InstructorID,
                                      FullName = x.InstructorFirstName + " " + x.InstructorLastName
                                  };

                // Prime dropdowns
                ddlMembers.DataTextField = "FullName";
                ddlInstructors.DataTextField = "FullName";
                ddlMembers.DataValueField = "Member_UserID";
                ddlInstructors.DataValueField = "InstructorID";

                // Add data to both dropdowns
                ddlMembers.DataSource = members;
                ddlInstructors.DataSource = instructors;
                ddlMembers.DataBind();
                ddlInstructors.DataBind();
            }
        }

        /// <summary>
        /// Updates the labels with the selected member's info for confirmation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dgvMembers_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get info from member table for the selected member
            var results = (from member in dbcon.Members
                           where member.Member_UserID == Convert.ToInt32(dgvMembers.SelectedDataKey[0].ToString())
                           select new
                                                                               {
                               member.MemberFirstName,
                               member.MemberLastName,
                               member.MemberDateJoined,
                               member.MemberPhoneNumber,
                               member.MemberEmail
                           }).First();

            // Display results
            lblDeleteMemberFName.Text = results.MemberFirstName;
            lblDeleteMemberLName.Text = results.MemberLastName;
            lblDeleteMemberDateJoined.Text = results.MemberDateJoined.ToString();
            lblDeleteMemberPhoneNumber.Text = results.MemberPhoneNumber;
            lblDeleteMemberEmail.Text = results.MemberEmail;
        }

        /// <summary>
        /// Creates a new member and corresponding user, then adds them to the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Create new NetUser object
            NetUser newUser = new NetUser();

            // Populate username and password from textboxes
            // UserType is Member
            newUser.UserName = txtAddMemberUsername.Text;
            newUser.UserPassword = txtAddMemberPassword.Text;
            newUser.UserType = "Member";

            // Add new user to database
            dbcon.NetUsers.InsertOnSubmit(newUser);
            dbcon.SubmitChanges();

            // Create new member object
            Member newMember = new Member();

            // Populate info from textboxes
            newMember.MemberFirstName = txtAddMemberFName.Text;
            newMember.MemberLastName = txtAddMemberLName.Text;
            newMember.MemberDateJoined = Convert.ToDateTime(txtAddMemberDateJoined.Text);
            newMember.MemberPhoneNumber = txtAddMemberPhoneNumber.Text;
            newMember.MemberEmail = txtAddMemberEmail.Text;

            // Get new member's UserID
            var results = (from x in dbcon.NetUsers
                           where x.UserName == newUser.UserName &&
                                 x.UserPassword == newUser.UserPassword
                           select new
                           {
                               x.UserID
                           }).First();

            // Populate UserID
            newMember.Member_UserID = results.UserID;

            // Add new member to database
            dbcon.Members.InsertOnSubmit(newMember);
            dbcon.SubmitChanges();

            // Update shown members
            ShowAllMembers();

            // Clear textboxes
            txtAddMemberFName.Text = string.Empty;
            txtAddMemberLName.Text = string.Empty;
            txtAddMemberDateJoined.Text = string.Empty;
            txtAddMemberPhoneNumber.Text = string.Empty;
            txtAddMemberEmail.Text = string.Empty;
            txtAddInstructorUsername.Text = string.Empty;
            txtAddInstructorPassword.Text = string.Empty;
        }

        /// <summary>
        /// Deletes the selected member and corresponding user from the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDeleteMember_Click(object sender, EventArgs e)
        {
            // Check that data is selected
            if (dgvMembers.SelectedIndex == -1)
            {
                return;
            }

            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Get Member and User objects
            Member deleteMember = (from member in dbcon.Members
                                   where member.Member_UserID == Convert.ToInt32(dgvMembers.SelectedDataKey[0].ToString())
                                   select member).First();
            NetUser deleteUser = (from user in dbcon.NetUsers
                                  where user.UserID == Convert.ToInt32(dgvMembers.SelectedDataKey[0].ToString())
                                  select user).First();

            // Delete member and user
            dbcon.Members.DeleteOnSubmit(deleteMember);
            dbcon.NetUsers.DeleteOnSubmit(deleteUser);

            // Submit changes
            dbcon.SubmitChanges();

            // Update shown members
            ShowAllMembers();

            // Clear labels
            lblDeleteMemberFName.Text = string.Empty;
            lblDeleteMemberLName.Text = string.Empty;
            lblDeleteMemberDateJoined.Text = string.Empty;
            lblDeleteMemberPhoneNumber.Text = string.Empty;
            lblDeleteMemberEmail.Text = string.Empty;
        }

        /// <summary>
        /// Updates the labels with the selected instructor's info for confirmation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dgvInstructors_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Create connection to database
            dbcon = new SchoolDataContext(conn);
            int temp = Convert.ToInt32(dgvInstructors.SelectedDataKey[0].ToString());

            // Get info from instructor table for the selected instructor
            var results = (from instructor in dbcon.Instructors
                           where instructor.InstructorID == Convert.ToInt32(dgvInstructors.SelectedDataKey[0].ToString())
                           select new
                           {
                               instructor.InstructorFirstName,
                               instructor.InstructorLastName,
                               instructor.InstructorPhoneNumber,
                           }).First();

            // Display results
            lblDeleteInstructorFName.Text = results.InstructorFirstName;
            lblDeleteInstructorLName.Text = results.InstructorLastName;
            lblDeleteInstructorPhoneNumber.Text = results.InstructorPhoneNumber;
        }

        /// <summary>
        /// Creates a new instructor and corresponding user, then adds adds them to the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddInstructor_Click(object sender, EventArgs e)
        {
            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Create new NetUser object
            NetUser newUser = new NetUser();

            // Populate username and password from textboxes
            // UserType is Instructor
            newUser.UserName = txtAddInstructorUsername.Text;
            newUser.UserPassword = txtAddInstructorPassword.Text;
            newUser.UserType = "Instructor";

            // Add new user to database
            dbcon.NetUsers.InsertOnSubmit(newUser);
            dbcon.SubmitChanges();

            // Create new instructor object
            Instructor newInstructor = new Instructor();

            // Populate info from textboxes
            newInstructor.InstructorFirstName = txtAddInstructorFName.Text;
            newInstructor.InstructorLastName = txtAddInstructorLName.Text;
            newInstructor.InstructorPhoneNumber = txtAddInstructorPhoneNumber.Text;

            // Get new instructor's UserID
            var results = (from x in dbcon.NetUsers
                           where x.UserName == newUser.UserName &&
                                 x.UserPassword == newUser.UserPassword
                           select new
                           {
                                x.UserID
                           }).First();

            // Populate UserID
            newInstructor.InstructorID = results.UserID;

            // Add new instructor to database
            dbcon.Instructors.InsertOnSubmit(newInstructor);
            dbcon.SubmitChanges();

            // Update shown instructors
            ShowAllInstructors();

            // Clear textboxes
            txtAddInstructorFName.Text = string.Empty;
            txtAddInstructorLName.Text = string.Empty;
            txtAddInstructorPhoneNumber.Text = string.Empty;
            txtAddInstructorUsername.Text = string.Empty;
            txtAddInstructorPassword.Text = string.Empty;
        }

        /// <summary>
        /// Deletes the selected instructor and corresponding user from the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDeleteInstructor_Click(object sender, EventArgs e)
        {
            // Check that data is selected
            if (dgvInstructors.SelectedIndex == -1)
            {
                return;
            }

            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Get Instructor and User objects
            Instructor deleteInstructor = (from instructor in dbcon.Instructors
                                           where instructor.InstructorID == Convert.ToInt32(dgvInstructors.SelectedDataKey[0].ToString())
                                           select instructor).First();
            NetUser deleteUser = (from user in dbcon.NetUsers
                                  where user.UserID == Convert.ToInt32(dgvInstructors.SelectedDataKey[0].ToString())
                                  select user).First();

            // Delete instructor and user
            dbcon.Instructors.DeleteOnSubmit(deleteInstructor);
            dbcon.NetUsers.DeleteOnSubmit(deleteUser);

            // Submit changes
            dbcon.SubmitChanges();

            // Update shown instructors
            ShowAllInstructors();

            // Clear labels
            lblDeleteInstructorFName.Text = string.Empty;
            lblDeleteInstructorLName.Text = string.Empty;
            lblDeleteInstructorPhoneNumber.Text = string.Empty;
        }

        /// <summary>
        /// Creates a new section and adds it to the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAssign_Click(object sender, EventArgs e)
        {

            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Create new section object
            Section newSection = new Section();

            // Populate info from drop downs and textboxes
            newSection.SectionName = ddlSection.Text;
            newSection.SectionStartDate = Convert.ToDateTime(txtSectionDate.Text);
            newSection.Member_ID = Convert.ToInt32(ddlMembers.SelectedValue);
            newSection.Instructor_ID = Convert.ToInt32(ddlInstructors.SelectedValue);
            newSection.SectionFee = Convert.ToDecimal(txtFee.Text);

            // Add new section to database
            dbcon.Sections.InsertOnSubmit(newSection);
            dbcon.SubmitChanges();

            // Clear textboxes
            txtSectionDate.Text = string.Empty;
            txtFee.Text = string.Empty;
        }

        /// <summary>
        /// Hides InstructorID column. Id is needed for deletion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param> The row that is being bound
        protected void dgvInstructors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // InstructorID is column 1
            e.Row.Cells[1].Visible = false;
        }

        /// <summary>
        /// Hides UserID column. ID is needed for deletion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param> The row that is being bound
        protected void dgvMembers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // UserID is column 1
            e.Row.Cells[1].Visible = false;
        }

        /// <summary>
        /// Gets every record from the Member table and displays them in dgvMembers
        /// </summary>
        private void ShowAllMembers()
        {
            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Get member names, phone numbers and dates joined
            var memberResults = from x in dbcon.Members
                                select new
                                {
                                    x.Member_UserID,
                                    x.MemberFirstName,
                                    x.MemberLastName,
                                    x.MemberPhoneNumber,
                                    x.MemberDateJoined
                                };

            // Bind and display results
            dgvMembers.DataSource = memberResults;
            dgvMembers.DataBind();
        }

        /// <summary>
        /// Gets every record from the Instructor table and displays them in dgvInstructors
        /// </summary>
        private void ShowAllInstructors()
        {
            // Create connection to database
            dbcon = new SchoolDataContext(conn);

            // Get instructor names
            var instructorResults = from x in dbcon.Instructors
                                    select new
                                    {
                                        x.InstructorID,
                                        x.InstructorFirstName,
                                        x.InstructorLastName
                                    };

            // Bind and display results
            dgvInstructors.DataSource = instructorResults;
            dgvInstructors.DataBind();
        }
    }
}