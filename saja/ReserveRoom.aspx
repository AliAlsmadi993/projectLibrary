<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveRoom.aspx.cs" Inherits="library.ReserveRoom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Reservation</title>
    <style>
        * { box-sizing: border-box; }
        body { font-family: Arial, sans-serif; }
        nav { background-color: #34495E; color: white; padding: 1.5rem; text-align: center; }
        .container { max-width: 1200px; margin: 2rem auto; padding: 1rem; }
        .maze { display: grid; grid-template-columns: repeat(5, 1fr); gap: 15px; }
        .room { padding: 20px; text-align: center; cursor: pointer; height: 120px; }
        .available { background-color: #2ECC71; color: white; }
        .booked { background-color: #E74C3C; color: white; cursor: not-allowed; }
        .booking-form { background-color: #f9f9f9; padding: 2rem; border-radius: 10px; margin-top: 2rem; }
        input, select { width: 100%; padding: 0.8rem; margin: 0.5rem 0; }
        button { background-color: #2980B9; color: white; border: none; padding: 1rem; cursor: pointer; width: 100%; }
        footer { background-color: #34495E; color: white; text-align: center; padding: 1.5rem; }
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
                    <asp:GridView ID="gvPendingRequests" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gvPendingRequests_RowCommand">
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
                    <asp:GridView ID="gvApprovedRequests" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gvApprovedRequests_RowCommand">
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
                    <asp:GridView ID="gvRejectedRequests" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
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

            <footer>
                <p>&copy; 2025 Reservation System. All rights reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>
