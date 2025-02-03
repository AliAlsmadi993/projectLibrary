using iText.Kernel.Colors;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWebforms.Ahmad
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        private string usersFilePath = HttpContext.Current.Server.MapPath("~/App_Data/users.txt");
        private string manageUsersFilePath = HttpContext.Current.Server.MapPath("~/App_Data/manageUsers.txt");
        private string blacklistFilePath = HttpContext.Current.Server.MapPath("~/App_Data/blacklist.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            List<User> users = ReadUsersFromFile(usersFilePath);
            List<User> managedUsers = new List<User>();

            foreach (var originalUser in users)
            {
                User userCopy = User.FromCsv(originalUser.ToCsv());

                if (!UserExistsInManageFile(userCopy.Email))
                {
                    userCopy.Bookings = 0;
                    userCopy.Delays = 0;
                    AppendUserToManageFile(userCopy);
                }
                else
                {
                    userCopy = GetUserFromManageFile(userCopy.Email);
                }
                managedUsers.Add(userCopy);
            }

            gvUsers.DataSource = managedUsers;
            gvUsers.DataBind();

            List<User> blacklistedUsers = ReadUsersFromFile(blacklistFilePath);
            gvBlacklistedUsers.DataSource = blacklistedUsers;
            gvBlacklistedUsers.DataBind();
        }

        private List<User> ReadUsersFromFile(string filePath)
        {
            List<User> users = new List<User>();

            if (File.Exists(filePath))
            {
                var lines = File.ReadAllLines(filePath);
                foreach (var line in lines)
                {
                    users.Add(User.FromCsv(line));
                }
            }
            return users;
        }

        private bool UserExistsInManageFile(string email)
        {
            return File.Exists(manageUsersFilePath) && File.ReadAllLines(manageUsersFilePath).Any(line => line.Contains(email));
        }

        private User GetUserFromManageFile(string email)
        {
            var users = ReadUsersFromFile(manageUsersFilePath);
            return users.FirstOrDefault(u => u.Email == email);
        }

        private void AppendUserToManageFile(User user)
        {
            File.AppendAllText(manageUsersFilePath, user.ToCsv() + Environment.NewLine);
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            string searchQuery = txtUserSearch.Text.Trim().ToLower();
            List<User> users = ReadUsersFromFile(manageUsersFilePath);
            var filteredUsers = users.Where(u => u.Email.ToLower().Contains(searchQuery) || u.FirstName.ToLower().Contains(searchQuery)).ToList();

            gvUsers.DataSource = filteredUsers;
            gvUsers.DataBind();
        }

        protected void btnWarnUser_Click(object sender, EventArgs e)
        {
            string userEmail = (sender as Button).CommandArgument;
            List<User> users = ReadUsersFromFile(manageUsersFilePath);

            foreach (var user in users)
            {
                if (user.Email == userEmail)
                {
                    user.Delays++;

                    if (user.Delays >= 3)
                    {
                        users.Remove(user);
                        AppendUserToBlacklist(user);
                    }
                    break;
                }
            }

            WriteUsersToFile(manageUsersFilePath, users);
            LoadUsers();
        }

        protected void btnRemoveWarnings_Click(object sender, EventArgs e)
        {
            string userEmail = (sender as Button).CommandArgument;
            List<User> users = ReadUsersFromFile(manageUsersFilePath);

            foreach (var user in users)
            {
                if (user.Email == userEmail)
                {
                    user.Delays = 0;
                    break;
                }
            }

            WriteUsersToFile(manageUsersFilePath, users);
            LoadUsers();
        }

        protected void btnRestoreUser_Click(object sender, EventArgs e)
        {
            string userEmail = (sender as Button).CommandArgument;
            List<User> blacklistedUsers = ReadUsersFromFile(blacklistFilePath);
            List<User> managedUsers = ReadUsersFromFile(manageUsersFilePath);

            // البحث عن المستخدم في القائمة السوداء
            User userToRestore = blacklistedUsers.FirstOrDefault(u => u.Email == userEmail);

            if (userToRestore != null)
            {
                // إزالته من القائمة السوداء
                blacklistedUsers.Remove(userToRestore);
                WriteUsersToFile(blacklistFilePath, blacklistedUsers);

                // إعادة إضافته إلى قائمة المستخدمين العاديين
                if (!managedUsers.Any(u => u.Email == userEmail))
                {
                    managedUsers.Add(userToRestore);
                    WriteUsersToFile(manageUsersFilePath, managedUsers);
                }
            }

            LoadUsers();
        }

        private void AppendUserToBlacklist(User user)
        {
            File.AppendAllText(blacklistFilePath, user.ToCsv() + Environment.NewLine);
        }

        protected void btnExportUsersPDF_Click(object sender, EventArgs e)
        {
            string pdfPath = Path.GetTempPath() + "UsersList.pdf";
            var users = ReadUsersFromFile(manageUsersFilePath);

            using (PdfWriter writer = new PdfWriter(pdfPath))
            using (PdfDocument pdf = new PdfDocument(writer))
            using (Document document = new Document(pdf))
            {
                document.Add(new Paragraph("Library Users List")
                    .SetFontSize(20)
                    .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER));
                document.Add(new Paragraph("\n"));

                iText.Layout.Element.Table table = new iText.Layout.Element.Table(new float[] { 2, 2, 3, 2, 2, 2 }).UseAllAvailableWidth();
                table.AddHeaderCell(new Cell().Add(new Paragraph("First Name").SetBackgroundColor(ColorConstants.LIGHT_GRAY)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Last Name").SetBackgroundColor(ColorConstants.LIGHT_GRAY)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Email").SetBackgroundColor(ColorConstants.LIGHT_GRAY)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Phone").SetBackgroundColor(ColorConstants.LIGHT_GRAY)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Bookings").SetBackgroundColor(ColorConstants.LIGHT_GRAY)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Delays").SetBackgroundColor(ColorConstants.LIGHT_GRAY)));

                foreach (var user in users)
                {
                    table.AddCell(user.FirstName);
                    table.AddCell(user.LastName);
                    table.AddCell(user.Email);
                    table.AddCell(user.Phone);
                    table.AddCell(user.Bookings.ToString());
                    table.AddCell(user.Delays.ToString());
                }

                document.Add(table);
            }

            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=UsersList.pdf");
            Response.TransmitFile(pdfPath);
            Response.End();
        }

        private void WriteUsersToFile(string filePath, List<User> users)
        {
            File.WriteAllLines(filePath, users.Select(u => u.ToCsv()));
        }

        public class User
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Email { get; set; }
            public string Phone { get; set; }
            public string Password { get; set; }
            public int Bookings { get; set; }
            public int Delays { get; set; }

            public string ToCsv()
            {
                return $"{FirstName},{LastName},{Email},{Phone},{Password},{Bookings},{Delays}";
            }

            public static User FromCsv(string csvLine)
            {
                var parts = csvLine.Split(',');
                return new User
                {
                    FirstName = parts.ElementAtOrDefault(0) ?? "",
                    LastName = parts.ElementAtOrDefault(1) ?? "",
                    Email = parts.ElementAtOrDefault(2) ?? "",
                    Phone = parts.ElementAtOrDefault(3) ?? "",
                    Password = parts.ElementAtOrDefault(4) ?? "",
                    Bookings = int.TryParse(parts.ElementAtOrDefault(5), out int bookings) ? bookings : 0,
                    Delays = int.TryParse(parts.ElementAtOrDefault(6), out int delays) ? delays : 0
                };
            }
        }
    }
}
