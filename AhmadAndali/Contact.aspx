<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="library.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://source.unsplash.com/1600x900/?library');
            background-size: cover;
            background-position: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-submit {
            background-color: #2c3e50;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #34495e;
        }
        .reply-container {
            margin-top: 20px;
            padding: 10px;
            background: #f8f9fa;
            border-left: 4px solid #2c3e50;
            border-radius: 5px;
        }
        .reply-container h5 {
            color: #2c3e50;
            font-size: 14px;
        }
        .reply-container p {
            font-size: 12px;
            margin-bottom: 0;
            color: #555;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Contact Us</h2>

            <div class="form-group">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Message:</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>

            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="btnSendMessage_Click" />
            <asp:Label ID="lblStatus" runat="server" CssClass="text-success mt-2"></asp:Label>

            <!-- عرض الردود من الأدمن -->
            <asp:Repeater ID="rptReplies" runat="server">
                <ItemTemplate>
                    <div class="reply-container">
                        <h5>📩 Admin Reply:</h5>
                        <p><strong>Date:</strong> <%# Eval("ReplyDate") %></p>
                        <p><strong>Message:</strong> <%# Eval("Reply") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>