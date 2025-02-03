using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.Sofyan
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void lnkMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Menu.aspx");
        }

        protected void lnkBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Booking.aspx");
        }

        protected void lnkAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/About.aspx");
        }

        protected void lnkContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact-Us.aspx");
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

            // تنفيذ عمليات مثل حفظ البيانات أو إرسال بريد إلكتروني
        }
    }
}