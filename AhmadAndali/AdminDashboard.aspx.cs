

using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace library
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            int totalBooks = GetTotalBooks();
            int availableRooms = GetAvailableRooms();
            int pendingReservations = GetPendingReservations();

            lblTotalBooks.Text = totalBooks.ToString();
            lblAvailableRooms.Text = availableRooms.ToString();
            lblPendingReservations.Text = pendingReservations.ToString();

            // حساب النسب المئوية لكل إحصائية
            int totalBooksPercentage = totalBooks > 0 ? 100 : 0;
            int availableRoomsPercentage = totalBooks > 0 ? (availableRooms * 100) / totalBooks : 0;
            int pendingReservationsPercentage = totalBooks > 0 ? (pendingReservations * 100) / totalBooks : 0;

            // إضافة النسب إلى العناصر كـ Attribute لتحديث الحلقات الدائرية ديناميكيًا
            lblTotalBooks.Attributes["style"] = $"--percentage: {totalBooksPercentage}%";
            lblAvailableRooms.Attributes["style"] = $"--percentage: {availableRoomsPercentage}%";
            lblPendingReservations.Attributes["style"] = $"--percentage: {pendingReservationsPercentage}%";
        }

        private int GetTotalBooks()
        {
            string filePath = Server.MapPath("~/App_Data/books.txt");
            if (!File.Exists(filePath)) return 0;

            string[] lines = File.ReadAllLines(filePath);
            return lines.Length; // كل سطر يمثل كتابًا
        }

        private int GetAvailableRooms()
        {
            string filePath = Server.MapPath("~/App_Data/rooms.txt");
            if (!File.Exists(filePath)) return 0;

            string[] lines = File.ReadAllLines(filePath);
            return lines.Count(line => line.Contains("available")); // عد الغرف المتاحة
        }

        private int GetPendingReservations()
        {
            string filePath = Server.MapPath("~/App_Data/reservations.txt");
            if (!File.Exists(filePath)) return 0;

            string[] lines = File.ReadAllLines(filePath);
            return lines.Count(line => line.Contains("Pending")); // عد الحجوزات المعلقة
        }
    }
}
