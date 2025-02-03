<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveRoom.aspx.cs" Inherits="library.ReserveRoom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Reservation</title>
    <style>
             * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #1e3c72, #2a5298);
            color: #fff;
        }

        nav {
            background: linear-gradient(120deg, #34495E, #2C3E50);
            color: white;
            padding: 1.5rem;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s;
        }

        nav:hover {
            transform: scale(1.02);
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 1rem;
        }

        .maze {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 15px;
            perspective: 1000px;
        }

        .room {
            padding: 20px;
            text-align: center;
            cursor: pointer;
            height: 120px;
            font-weight: bold;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .room:hover {
            transform: translateY(-5px) rotateY(5deg);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.4);
        }

        .available {
            background: linear-gradient(120deg, #2ECC71, #27AE60);
            color: white;
        }

        .booked {
            background: linear-gradient(120deg, #E74C3C, #C0392B);
            color: white;
            cursor: not-allowed;
        }

        .booking-form {
            background: rgba(255, 255, 255, 0.1);
            padding: 2rem;
            border-radius: 15px;
            margin-top: 2rem;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s;
        }

        .booking-form:hover {
            transform: scale(1.02);
        }

        input, select {
            width: 100%;
            padding: 0.8rem;
            margin: 0.5rem 0;
            border-radius: 10px;
            border: none;
            background: rgba(255, 255, 255, 0.3);
            color: #fff;
        }

        button {
            background: linear-gradient(120deg, #2980B9, #2471A3);
            color: white;
            border: none;
            padding: 1rem;
            cursor: pointer;
            width: 100%;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s;
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.4);
        }

                .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 1rem;
        }

        .modern-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.4);
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            margin-top: 2rem;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .modern-table:hover {
            transform: scale(1.02);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
        }

        .modern-table th, .modern-table td {
            padding: 1rem;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            transition: background 0.3s, color 0.3s;
        }

        .modern-table th {
            background: linear-gradient(120deg, #4A90E2, #2C82C9);
            font-weight: bold;
            text-transform: uppercase;
        }

        .modern-table tr:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: scale(1.01);
            transition: transform 0.3s, background 0.3s;
        }

        .modern-table td {
            font-size: 1rem;
        }

        .modern-table button {
            background: linear-gradient(120deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            cursor: pointer;
            border-radius: 8px;
            transition: transform 0.3s, background 0.3s;
        }

        .modern-table button:hover {
            transform: scale(1.1);
            background: linear-gradient(120deg, #c0392b, #a93226);
        }

        footer {
            background: linear-gradient(120deg, #34495E, #2C3E50);
            color: white;
            text-align: center;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0px -4px 10px rgba(0, 0, 0, 0.3);
        }
    </style>
    <script type="text/javascript">
        function setSelectedRoom(room, elem) {
            document.getElementById('<%= hiddenSelectedRoom.ClientID %>').value = room;
            document.getElementById('<%= lblRoomDetails.ClientID %>').innerText = "Selected Room: " + room;
            var rooms = document.getElementsByClassName('room');
            for (var i = 0; i < rooms.length; i++) {
                rooms[i].classList.remove('selected');
            }
            elem.classList.add('selected');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav>
                <h1>Study Room Reservation System 📚</h1>
            </nav>
            <div class="container">
                <h2>Room Layout</h2>
                <div class="maze" id="roomContainer" runat="server">
                    <!-- الغرف سيتم تحميلها ديناميكيًا من الكود الخلفي -->
                </div>
                <div class="booking-form">
                    <h2>Booking Form</h2>
                    <asp:Label ID="lblRoomDetails" runat="server" Text="Selected Room: None"></asp:Label>
                    <asp:HiddenField ID="hiddenSelectedRoom" runat="server" />
                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name" required="true"></asp:TextBox>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" required="true"></asp:TextBox>
                    <asp:TextBox ID="txtTime" runat="server" TextMode="Time" required="true"></asp:TextBox>
                    <asp:DropDownList ID="ddlSnack" runat="server">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Chips - 10 JD" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Cookies - 5 JD" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Soda - 7 JD" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Chocolate - 8 JD" Value="8"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm Reservation" OnClick="btnSubmit_Click" />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                </div>

              <div class="container">
    <h2>Pending Room Requests</h2>
    <asp:GridView ID="gvPendingRequests" runat="server" CssClass="modern-table" AutoGenerateColumns="False" OnRowCommand="gvPendingRequests_RowCommand">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
            <asp:BoundField DataField="Room" HeaderText="Room" />
            <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:BoundField DataField="Time" HeaderText="Time" />
            <asp:BoundField DataField="Snack" HeaderText="Snack" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
        </Columns>
    </asp:GridView>

    <h2>Approved Room Requests</h2>
    <asp:GridView ID="gvApprovedRequests" runat="server" CssClass="modern-table" AutoGenerateColumns="False" OnRowCommand="gvApprovedRequests_RowCommand">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
            <asp:BoundField DataField="Room" HeaderText="Room" />
            <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:BoundField DataField="Time" HeaderText="Time" />
            <asp:BoundField DataField="Snack" HeaderText="Snack" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:ButtonField ButtonType="Button" CommandName="Complete" Text="Complete" />
        </Columns>
    </asp:GridView>

    <h2>Rejected Room Requests</h2>
    <asp:GridView ID="gvRejectedRequests" runat="server" CssClass="modern-table" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
            <asp:BoundField DataField="Room" HeaderText="Room" />
            <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:BoundField DataField="Time" HeaderText="Time" />
            <asp:BoundField DataField="Snack" HeaderText="Snack" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
        </Columns>
    </asp:GridView>
</div>

                </div>
            </div>

            <footer>
                <p>&copy; 2025 Reservation System. All rights reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>
