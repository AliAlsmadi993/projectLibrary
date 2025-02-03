using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.Sura
{
    public partial class profilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                viewUserData();
                editUserData();
                //bookHistory();
            }

        }
        protected void viewUserData()
        {
            string file = Server.MapPath("~/App_Data/users.txt");
            string[] data = File.ReadAllLines(file);
            foreach (string line in data)
            {
                string[] userData = line.Split(',');

                if (userData.Length > 6 && userData[6] == "true")
                {
                    fullName.InnerHtml = $"<div>{userData[0]}</div>";
                    lastname.InnerHtml = $"<div>{userData[1]}</div>";
                    email1.InnerHtml = $"<div>{userData[2]}</div>";
                    phone1.InnerHtml = $"<div>{userData[3]}</div>";
                }
                else
                {
                    // التعامل مع الحالات التي لا تحتوي على البيانات الكافية
                    // يمكنك تجاهل السطر أو تسجيله كمشكلة
                }
            }
        }
        protected void editUserData()
        {
            string file = Server.MapPath("~/App_Data/users.txt");
            string[] data = File.ReadAllLines(file);
            foreach (string line in data)
            {
                string[] userData = line.Split(' ');

                if (userData.Length > 6 && userData[6] == "true")
                {
                    fName.Text = userData[0];
                    lName.Text = userData[1];
                    email.Text = userData[2];
                    phone.Text = userData[3];
                }
                else
                {
                    // تعامل مع الحالة عندما لا تحتوي المصفوفة على بيانات كافية
                    // مثال: تسجيل السطر غير الصحيح أو تجاهله
                }

            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("~/App_Data/users.txt");
            if (string.IsNullOrEmpty(fName.Text) && string.IsNullOrEmpty(lName.Text) && string.IsNullOrEmpty(email.Text) && string.IsNullOrEmpty(phone.Text))
            {
                result2.Text = "Please Fill All Feilds!";
                result2.Visible = true;
                result2.CssClass = "danger";
                return;
            }
            string[] edit = File.ReadAllLines(file);
            for (int i = 0; i < edit.Length; i++)
            {
                string[] editData = edit[i].Split(' ');
                if (editData[6] == "true")
                {
                    editData[0] = fName.Text;
                    editData[1] = lName.Text;
                    editData[2] = email.Text;
                    editData[3] = phone.Text;
                    edit[i] = $"{editData[0]} {editData[1]} {editData[2]} {editData[3]} {editData[4]} {editData[5]} {editData[6]}";
                    File.WriteAllLines(file, edit);
                    viewUserData();
                    break;
                }
            }

        }

        protected void savepass_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("~/App_Data/users.txt");
            if (string.IsNullOrEmpty(CurrentPass.Text) && string.IsNullOrEmpty(newPass.Text) && string.IsNullOrEmpty(confirmPass.Text))
            {
                result.Text = "Please Fill All Feilds!";
                result.Visible = true;
                result.CssClass = "danger";
                return;
            }
            string[] editpassword = File.ReadAllLines(file);
            foreach (var item in editpassword)
            {
                string[] chick = item.Split(' ');
                if (chick[4] != CurrentPass.Text)
                {
                    result.Text = "The current password you entered is incorrect!";
                    result.Visible = true;
                    result.CssClass = "danger";
                    return;
                }
                else if (newPass.Text == confirmPass.Text)
                {
                    for (int a = 0; a < editpassword.Length; a++)
                    {
                        string[] chickpass = editpassword[a].Split(' ');
                        if (chickpass[6] == "true")
                        {
                            chickpass[4] = newPass.Text;
                            chickpass[5] = newPass.Text;
                            editpassword[a] = $"{chickpass[0]} {chickpass[1]} {chickpass[2]} {chickpass[3]} {chickpass[4]} {chickpass[5]} {chickpass[6]}";
                            File.WriteAllLines(file, editpassword);
                            break;
                        }

                    }
                }
                else
                {
                    result.Text = "Passwords do not match!";
                    result.Visible = true;
                    result.CssClass = "danger";
                }


            }
        }
        //protected void bookHistory()
        //{
        //    string file = Server.MapPath("");
        //    string[] books = File.ReadAllLines(file);
        //    foreach (var book in books)
        //    {
        //        string[] BooksData = book.Split(',');
        //       bookHis.InnerHtml += $"<tr> <th>{BooksData[0]}</th> <td>{BooksData[1]}</td> <td>{BooksData[2]}</td></tr> ";


        //    }
        //}

        //protected void roomHistory()
        //{
        //    string file = Server.MapPath("");
        //    string[] rooms = File.ReadAllLines(file);
        //    foreach (var room in rooms)
        //    {
        //        string[] roomsData = room.Split(',');
        //        roomHis.InnerHtml += $"<tr> <th>{roomsData[0]}</th> <td>{roomsData[1]}</td> <td>{roomsData[2]}</td> <td>{roomsData[3]}</td></tr> ";


        //    }
        //}

    }
}