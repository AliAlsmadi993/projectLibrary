using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.Abdullah
{
    public partial class BorrowBooks : System.Web.UI.Page
    {

        string loggedInUserFile;

        protected void Page_Load(object sender, EventArgs e)
        {
            loggedInUserFile = Server.MapPath("~/App_Data/loggedInUser.txt");

            if (!IsPostBack)
            {
                LoadBooks();
                LoadBorrowedBooks();
            }
        }

        private void LoadBooks(string searchTerm = "")
        {
            string filePath = Server.MapPath("~/App_Data/books.txt");
            List<Book> books = new List<Book>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split(',');

                    if (parts.Length == 8)
                    {
                        // قراءة البيانات بناءً على التنسيق الجديد
                        Book book = new Book()
                        {
                            ID = parts[0],
                            Title = parts[1],
                            Author = parts[2],
                            TotalCopies = int.Parse(parts[3]),
                            AvailableCopies = int.Parse(parts[4]),
                            Status = parts[5].ToLower() == "available" ? "Available" : "Not Available",
                            ImageURL = ResolveUrl(parts[6]), // تحديد المسار الصحيح للصورة
                            Description = parts[7]
                        };

                        // فقط عرض الكتب المتاحة للحجز
                        books.Add(book);
                    }
                }
            }

            // تطبيق البحث
            if (!string.IsNullOrEmpty(searchTerm))
            {
                books = books.Where(b => b.Title.IndexOf(searchTerm, StringComparison.OrdinalIgnoreCase) >= 0).ToList();
            }

            BooksRepeater.DataSource = books;
            BooksRepeater.DataBind();
        }

        private void LoadBorrowedBooks()
        {
            string filePath = Server.MapPath("~/App_Data/ApprovedRequests.txt");
            List<BorrowRequest> borrowedBooks = new List<BorrowRequest>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split('|');
                    if (parts.Length == 4)
                    {
                        borrowedBooks.Add(new BorrowRequest
                        {
                            BookTitle = parts[0],
                            EmailUser = parts[1],
                            PickupTime = parts[2],
                            DeliveryTime = parts[3]
                        });
                    }
                }
            }

            BorrowedBooksRepeater.DataSource = borrowedBooks;
            BorrowedBooksRepeater.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();
            LoadBooks(searchTerm);

            if (BooksRepeater.Items.Count == 0)
            {
                lblMessage.Text = "No books found with the given search term.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblMessage.Text = ""; // مسح أي رسالة سابقة
            }
        }

        protected void BooksRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Borrow")
            {
                string bookTitle = e.CommandArgument.ToString();

                hiddenBookTitle.Value = bookTitle;

                string stutas = "";

                string filePath = Server.MapPath("~/App_Data/books.txt");
                string[] lines = File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split(',');

                    if (parts[1] == bookTitle)
                    {
                        stutas = parts[5];
                    }





                }
                string email = File.ReadAllText(loggedInUserFile).Trim();

                string blackList = Server.MapPath("~/App_Data/blacklist.txt");


                string[] lines2 = File.ReadAllLines(blackList);
                if (lines2.Length > 0)
                {
                    foreach (string line in lines2)
                    {
                        string[] parts = line.Split(',');

                        if (parts[2] == email)
                        {
                            Response.Write("<script>alert('your in black list');</script>");
                            return;
                        }
                        else
                        {

                            if (stutas == "available")
                            {
                                borrowForm.Visible = true; // إظهار النموذج
                            }
                            else
                            {
                                Response.Write("<script>alert('Not available.');</script>");
                            }
                            return;
                        }
                    }

                }
                else
                {

                    if (stutas == "available")
                    {
                        borrowForm.Visible = true; // إظهار النموذج
                    }
                    else
                    {
                        Response.Write("<script>alert('Not available.');</script>");
                    }

                }
            }
        }

        protected void btnSubmitBorrow_Click(object sender, EventArgs e)
        {
            string bookTitle = hiddenBookTitle.Value;
            string pickupTime = txtPickupTime.Text;
            string deliveryTime = txtDeliveryTime.Text;

            string emailUser = GetLoggedInUserEmail();

            if (string.IsNullOrEmpty(emailUser))
            {
                lblBorrowMessage.Text = "Error: Could not retrieve logged-in user email.";
                lblBorrowMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string filePath = Server.MapPath("~/App_Data/PendingRequests.txt");
            string requestDetails = $"{bookTitle}|{emailUser}|{pickupTime}|{deliveryTime}";

            try
            {
                File.AppendAllText(filePath, requestDetails + Environment.NewLine);
                lblBorrowMessage.Text = $"Your request to borrow '{bookTitle}' has been sent to the admin.";
                lblBorrowMessage.ForeColor = System.Drawing.Color.Green;

                borrowForm.Visible = false;
            }
            catch (Exception ex)
            {
                lblBorrowMessage.Text = "An error occurred: " + ex.Message;
                lblBorrowMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private string GetLoggedInUserEmail()
        {
            try
            {
                if (File.Exists(loggedInUserFile))
                {
                    string email = File.ReadAllText(loggedInUserFile).Trim();
                    if (!string.IsNullOrEmpty(email))
                    {
                        return email;
                    }
                    else
                    {
                        lblBorrowMessage.Text = "Error: The logged-in user file is empty.";
                        lblBorrowMessage.ForeColor = System.Drawing.Color.Red;
                        return string.Empty;
                    }
                }
                else
                {
                    lblBorrowMessage.Text = "Error: The logged-in user file does not exist.";
                    lblBorrowMessage.ForeColor = System.Drawing.Color.Red;
                    return string.Empty;
                }
            }
            catch (Exception ex)
            {
                lblBorrowMessage.Text = "An error occurred while reading the logged-in user file: " + ex.Message;
                lblBorrowMessage.ForeColor = System.Drawing.Color.Red;
                return string.Empty;
            }
        }

        public class Book
        {
            public string ID { get; set; }
            public string Title { get; set; }
            public string Author { get; set; }
            public int TotalCopies { get; set; }
            public int AvailableCopies { get; set; }
            public string Status { get; set; }
            public string ImageURL { get; set; }
            public string Description { get; set; }
        }

        public class BorrowRequest
        {
            public string BookTitle { get; set; }
            public string EmailUser { get; set; }
            public string PickupTime { get; set; }
            public string DeliveryTime { get; set; }
        }





    }
}