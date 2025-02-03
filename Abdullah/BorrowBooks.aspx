<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowBooks.aspx.cs" Inherits="library.Abdullah.BorrowBooks" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Library Books</title>
    
    <!-- SWIPER -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- Font Awesome CDN Link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- CSS file link -->
    <link href="./style.css" rel="stylesheet" type="text/css" />
        <link href="./styleContactUs.css" rel="stylesheet" type="text/css" />

    <style>


         /* تنسيق القائمة المنسدلة */
 .dropdown {
     position: relative;
     display: inline-block;
 }

 .dropbtn {
     background: none;
     border: none;
     color: white;
     font-size: 16px;
     font-weight: 600;
     cursor: pointer;
     padding: 10px;
     transition: 0.3s;
 }

     .dropbtn:hover {
         color: #ff9800;
     }

 .dropdown-content {
     display: none;
     position: absolute;
     background: white;
     min-width: 200px;
     box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
     border-radius: 5px;
     z-index: 100;
 }

     .dropdown-content a, .dropdown-content .aspNetLink {
         color: #333;
         padding: 12px 16px;
         text-decoration: none;
         display: block;
         transition: 0.3s;
     }

         .dropdown-content a:hover, .dropdown-content .aspNetLink:hover {
             background: #f1f1f1;
         }

 /* عرض القائمة عند تمرير الماوس */
 .dropdown:hover .dropdown-content {
     display: block;
 }
        /* Add your CSS styles here */

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .navbar {
            background-color: #333;
            padding: 15px;
        }

            .navbar .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .navbar .logo {
                color: white;
                font-size: 24px;
                text-decoration: none;
            }

            .navbar .nav-links {
                list-style: none;
                padding: 0;
                display: flex;
            }

                .navbar .nav-links li {
                    margin: 0 10px;
                }

                .navbar .nav-links a {
                    color: white;
                    text-decoration: none;
                }

        .search-container {
            text-align: center;
            margin: 20px 0;
        }

        .search-box {
            padding: 10px;
            width: 40%;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-btn {
            padding: 10px 15px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .books-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .book-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

            .book-card img {
                width: 100%;
                height: auto;
                border-radius: 5px;
            }

            .book-card h3 {
                margin: 10px 0;
                font-size: 18px;
            }

            .book-card p {
                font-size: 14px;
                color: #555;
            }

        .borrow-btn {
            padding: 10px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            margin-top: 10px;
        }

            .borrow-btn:hover {
                background-color: #218838;
            }

        .borrowed-header {
            text-align: center;
            margin-top: 40px;
            font-size: 24px;
        }

        .borrowed-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .borrowed-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }



        .borrowed-books {
            margin-top: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-top: 2px solid #ddd;
        }

            .borrowed-books h2 {
                margin-bottom: 10px;
            }

            .borrowed-books ul {
                list-style-type: none;
                padding: 0;
            }

            .borrowed-books li {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

        .borrow-form {
            margin-top: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

            .borrow-form h2 {
                margin-bottom: 10px;
            }

            .borrow-form label {
                display: block;
                margin-bottom: 5px;
            }

            .borrow-form input[type="datetime-local"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .borrow-form button {
                padding: 10px 15px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

                .borrow-form button:hover {
                    background-color: #218838;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Search Form -->
        <div class="search-container">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Search books..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message-label" />

        <!-- Books Container -->
        <div class="books-container">
            <asp:Repeater ID="BooksRepeater" runat="server" OnItemCommand="BooksRepeater_ItemCommand">
                <ItemTemplate>
                    <div class="book-card">
                        <h3><%# Eval("Title") %></h3>
                        <p><%# Eval("Description") %></p>
                        <p><%# Eval("Status") %></p>
                        <!-- Borrow Button -->
                        <asp:Button ID="btnBorrow" runat="server" Text="Borrow" CommandName="Borrow" CommandArgument='<%# Eval("Title") %>' CssClass="borrow-btn" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Hidden Borrow Form -->
        <asp:Panel ID="borrowForm" runat="server" CssClass="borrow-form" Visible="false">
            <h2>Borrow Book</h2>
            <asp:HiddenField ID="hiddenBookTitle" runat="server" />
            <label for="txtPickupTime">Pick-up Time:</label>
            <asp:TextBox ID="txtPickupTime" runat="server" TextMode="DateTimeLocal" required="true"></asp:TextBox>
            <label for="txtDeliveryTime">Delivery Time:</label>
            <asp:TextBox ID="txtDeliveryTime" runat="server" TextMode="DateTimeLocal" required="true"></asp:TextBox>
            <asp:Button ID="btnSubmitBorrow" runat="server" Text="Submit Borrow Request" OnClick="btnSubmitBorrow_Click" />
        </asp:Panel>

        <!-- Confirmation Message -->
        <asp:Label ID="lblBorrowMessage" runat="server" Text="" CssClass="message-label" />

        <!-- Borrowed Books Section -->
        <div class="borrowed-books">
            <h2>Borrowed Books</h2>
            <asp:Repeater ID="BorrowedBooksRepeater" runat="server">
                <ItemTemplate>
                    <ul>
                        <li>
                            <strong><%# Eval("BookTitle") %></strong> - Pick-up: <%# Eval("PickupTime") %>, Delivery: <%# Eval("DeliveryTime") %>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
