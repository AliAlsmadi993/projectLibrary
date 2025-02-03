using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace library
{
    public partial class ManageRooms : Page
    {
        private string filePath = HttpContext.Current.Server.MapPath("~/App_Data/rooms.txt");
        private List<Room> filteredRooms = new List<Room>();

        public class Room
        {
            public string RoomID { get; set; }
            public string Name { get; set; }
            public string Status { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRooms();
            }
        }

        private void LoadRooms(string filter = "all", string searchQuery = "")
        {
            // إذا لم يكن الملف موجودًا، قم بإنشائه
            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close();
            }

            // قراءة الغرف من الملف
            var rooms = File.ReadAllLines(filePath)
                            .Where(line => !string.IsNullOrWhiteSpace(line))
                            .Select(line => line.Split(','))
                            .Select(parts => new Room
                            {
                                RoomID = parts[0],
                                Name = parts[1],
                                Status = parts[2]
                            }).ToList();

            // البحث
            if (!string.IsNullOrEmpty(searchQuery))
            {
                rooms = rooms.Where(room => room.Name.ToLower().Contains(searchQuery.ToLower()) ||
                                            room.RoomID.ToLower().Contains(searchQuery.ToLower())).ToList();
            }

            // الفلترة
            if (filter == "available")
            {
                rooms = rooms.Where(room => room.Status == "available").ToList();
            }
            else if (filter == "reserved")
            {
                rooms = rooms.Where(room => room.Status == "reserved").ToList();
            }

            // تخزين النتائج المفلترة
            filteredRooms = rooms;

            // عرض النتائج في الجدول
            gvRooms.DataSource = filteredRooms;
            gvRooms.DataBind();
        }

        protected void btnAddRoom_Click(object sender, EventArgs e)
        {
            // التحقق إذا كان الملف موجودًا
            if (File.Exists(filePath))
            {
                // الحصول على المعرف التالي
                var lastLine = File.ReadLines(filePath).LastOrDefault();
                int nextId = lastLine != null ? int.Parse(lastLine.Split(',')[0]) + 1 : 1;

                // الحصول على البيانات المدخلة
                string roomName = txtRoomName.Text.Trim();
                string status = "available"; // يمكن تعديلها لاحقًا إذا أردت

                // صيغة الغرفة
                string newRoom = $"{nextId},{roomName},{status}";

                // إضافتها إلى الملف
                File.AppendAllText(filePath, newRoom + Environment.NewLine);

                // تفريغ الحقول
                txtRoomName.Text = string.Empty;

                // إعادة تحميل الغرف
                LoadRooms();
            }
        }

        protected void btnRoomFilter_Click(object sender, EventArgs e)
        {
            string filter = ddlRoomFilter.SelectedValue;
            LoadRooms(filter);
        }

        protected void btnSearchRoom_Click(object sender, EventArgs e)
        {
            string searchQuery = txtRoomSearch.Text.Trim();
            LoadRooms("all", searchQuery);
        }

    }
}
