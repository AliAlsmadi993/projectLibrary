<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="library.ManageRooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Rooms</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #E4E4E4;
            margin: 0;
            padding: 0;
        }
          .sidebar {
      width: 250px;
      background: #000000;
      color: #E4E4E4;
      position: fixed;
      height: 100vh;
      padding-top: 20px;
      text-align: center;
      transition: transform 0.3s ease;
      z-index: 1000;
  }

      .sidebar.hidden {
          transform: translateX(-100%);
      }

      .sidebar h2 {
          color: #CCE0C5;
          margin-bottom: 20px;
      }

      .sidebar .menu-button {
          display: block;
          width: 90%;
          background: #464646;
          color: #CCE0C5;
          border: none;
          border-radius: 5px;
          padding: 10px;
          margin: 10px auto;
          font-size: 16px;
          text-align: left;
          cursor: pointer;
          transition: background 0.3s;
      }

          .sidebar .menu-button:hover {
              background: #CCE0C5;
              color: #000000;
          }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        h2 {
            color: #000;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #464646;
            color: #CCE0C5;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #CCE0C5;
            color: #000;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #464646;
            color: #CCE0C5;
        }
        .filter {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="sidebar">
     <h2>Library Admin</h2>
     <asp:Button CssClass="menu-button" runat="server" Text="Home" PostBackUrl="AdminDashboard.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Manage Books" PostBackUrl="ManageBooks.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Manage Rooms" PostBackUrl="ManageRooms.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Notifications" PostBackUrl="Notifications.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Pending Requests Books" PostBackUrl="PendingRequestsBooks.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Pending Requests Rooms" PostBackUrl="PesndingRequestsRooms.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Manage Users" PostBackUrl="ManageUsers.aspx" />
     <asp:Button CssClass="menu-button" runat="server" Text="Logout" PostBackUrl="loginadmin.aspx" />
 </div>
        <div class="main-content">
            <h2>Manage Rooms</h2>
            
            <!-- Add Room Form -->
            <div class="form-group">
                <label>Room Name:</label>
                <asp:TextBox ID="txtRoomName" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnAddRoom" runat="server" Text="Add Room" CssClass="btn" OnClick="btnAddRoom_Click" />



            <!-- Filter Section -->
            <div class="filter">
                <asp:DropDownList ID="ddlRoomFilter" runat="server">
                    <asp:ListItem Text="All Rooms" Value="all" />
                    <asp:ListItem Text="Available Rooms" Value="available" />
                    <asp:ListItem Text="Reserved Rooms" Value="reserved" />
                </asp:DropDownList>
                <asp:TextBox ID="txtRoomSearch" runat="server" Placeholder="Search by Name or ID"></asp:TextBox>
                <asp:Button ID="btnSearchRoom" runat="server" Text="Search" CssClass="btn" OnClick="btnSearchRoom_Click" />
                <asp:Button ID="btnRoomFilter" runat="server" Text="Apply Filter" CssClass="btn" OnClick="btnRoomFilter_Click" />
            </div>

            <!-- Rooms Table -->
            <asp:GridView ID="gvRooms" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="RoomID" HeaderText="Room ID" />
                    <asp:BoundField DataField="Name" HeaderText="Room Name" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
