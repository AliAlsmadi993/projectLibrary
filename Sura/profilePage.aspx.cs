using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.Sura
{
    public partial class profilePage : System.Web.UI.Page
    {
        public string loggedInEmail = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetLoggedInUserEmail();
                viewUserData();
                editUserData();
            }
        }

        // ✅ جلب البريد الإلكتروني للمستخدم المسجل حاليًا
        protected void GetLoggedInUserEmail()
        {
            string fileLogged = Server.MapPath("~/App_Data/loggedInUser.txt");
            if (File.Exists(fileLogged))
            {
                string[] lines = File.ReadAllLines(fileLogged);
                if (lines.Length > 0)
                {
                    loggedInEmail = lines[0].Trim(); // استخراج الإيميل
                }
            }
        }

        // ✅ عرض بيانات المستخدم بناءً على الإيميل المسجل حاليًا
        protected void viewUserData()
        {
            

            string file = Server.MapPath("~/App_Data/users.txt");
            if (File.Exists(file))
            {
                string[] data = File.ReadAllLines(file);
                foreach (string line in data)
                {
                    string[] userData = line.Split(',');
                 
                        fullName.InnerHtml = $"<div>{userData[0]}</div>";
                        lastname.InnerHtml = $"<div>{userData[1]}</div>";
                        email1.InnerHtml = $"<div>{userData[2]}</div>";
                        phone1.InnerHtml = $"<div>{userData[3]}</div>";
                        break;
                    
                }
            }
        }

        // ✅ تعديل بيانات المستخدم وعرضها في الحقول
        protected void editUserData()
        {
            if (string.IsNullOrEmpty(loggedInEmail)) return;

            string file = Server.MapPath("~/App_Data/users.txt");
            if (File.Exists(file))
            {
                string[] data = File.ReadAllLines(file);
                foreach (string line in data)
                {
                    string[] userData = line.Split(',');
                    if (userData.Length >= 5 && userData[2] == loggedInEmail)
                    {
                        fName.Text = userData[0];
                        lName.Text = userData[1];
                        email.Text = userData[2];
                        phone.Text = userData[3];
                        break;
                    }
                }

            }
        }

        // ✅ حفظ التعديلات على بيانات المستخدم
        protected void save_Click(object sender, EventArgs e)
        {
            

            string file = Server.MapPath("~/App_Data/users.txt");
            if (string.IsNullOrEmpty(fName.Text) || string.IsNullOrEmpty(lName.Text) ||
                string.IsNullOrEmpty(email.Text) || string.IsNullOrEmpty(phone.Text))
            {
                result2.Text = "Please fill all fields!";
                result2.Visible = true;
                result2.CssClass = "danger";
                return;
            }

            if (File.Exists(file))
            {
                string[] lines = File.ReadAllLines(file);
                for (int i = 0; i < lines.Length; i++)
                {
                    string[] userData = lines[i].Split(',');
                                         userData[0] = fName.Text;
                        userData[1] = lName.Text;
                        userData[2] = email.Text;
                        userData[3] = phone.Text;

                        lines[i] = string.Join(",", userData);
                        File.WriteAllLines(file, lines); // حفظ التعديلات في الملف

                        result2.Text = "Profile updated successfully!";
                        result2.Visible = true;
                        result2.CssClass = "success";

                        viewUserData(); // تحديث العرض بعد الحفظ
                        return;
                   
                }
            }
        }

        // ✅ تحديث كلمة المرور
        protected void savepass_Click(object sender, EventArgs e)
        {
            

            string file = Server.MapPath("~/App_Data/users.txt");
            if (string.IsNullOrEmpty(CurrentPass.Text) || string.IsNullOrEmpty(newPass.Text) || string.IsNullOrEmpty(confirmPass.Text))
            {
                result.Text = "Please fill all fields!";
                result.Visible = true;
                result.CssClass = "danger";
                return;
            }

            if (File.Exists(file))
            {
                string[] lines = File.ReadAllLines(file);
                for (int i = 0; i < lines.Length; i++)
                {
                    string[] userData = lines[i].Split(',');
        
                        if (userData[4] != CurrentPass.Text)
                        {
                            result.Text = "The current password you entered is incorrect!";
                            result.Visible = true;
                            result.CssClass = "danger";
                            return;
                        }
                        else if (newPass.Text == confirmPass.Text)
                        {
                            userData[4] = newPass.Text; // تحديث كلمة المرور
                            lines[i] = string.Join(",", userData);
                            File.WriteAllLines(file, lines);

                            result.Text = "Password updated successfully!";
                            result.Visible = true;
                            result.CssClass = "success";
                            return;
                        }
                        else
                        {
                            result.Text = "Passwords do not match!";
                            result.Visible = true;
                            result.CssClass = "danger";
                            return;
                        }
                    }
                }
            
        }
    }
}
