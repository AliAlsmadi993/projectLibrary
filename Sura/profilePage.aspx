<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profilePage.aspx.cs" Inherits="library.Sura.profilePage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            margin-top: 20px;
            color: #1a202c;
            text-align: left;
/*            background-color: #e2e8f0;*/
/*background-image:url("https://i.pinimg.com/736x/58/1b/3a/581b3a5d6ad51ebf7b126d6c2e7eea98.jpg" );*/
background-repeat:no-repeat;

  background-size: cover;
        }

        .main-body {
            padding: 15px;
        }

        .card {
            box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0,0,0,.125);
            border-radius: .25rem;
        }

        .card-body {
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1rem;
        }

        .gutters-sm {
            margin-right: -8px;
            margin-left: -8px;
        }

            .gutters-sm > .col, .gutters-sm > [class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }

        .mb-3, .my-3 {
            margin-bottom: 1rem !important;
        }

        .bg-gray-300 {
            background-color: #e2e8f0;
        }

        .h-100 {
            height: 100% !important;
        }

        .shadow-none {
            box-shadow: none !important;
        }

        .custom-table {
            width: 70%;
            margin: auto;
            border-radius: .25rem;
            overflow: hidden;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 3%;
        }


        .table > :not(caption) > * > * {
            padding: .5rem .9rem;
            color: var(--bs-table-color-state, var(--bs-table-color-type, var(--bs-table-color)));
            background-color: var(--bs-table-bg);
            border-bottom-width: var(--bs-border-width);
            box-shadow: inset 0 0 0 9999px var(--bs-table-bg-state, var(--bs-table-bg-type, var(--bs-table-accent-bg)));
        }

        .danger {
            color: red;
        }
                .heading {
    font-size: 9rem;
    text-transform: uppercase;
    color: transparent;
    -webkit-text-stroke: .05rem var(--main-color);
    letter-spacing: .2rem;
    text-align: center;
    pointer-events: none;
    position: relative;
}

.heading span {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    color: var(--main-color);
    font-size: 3rem;
}
.headline {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline: none;
    border: none;
    text-decoration: none;
    text-transform: capitalize;
    transition: all .2s linear;
}
@media (max-width: 768px) {
    .heading {
        font-size: 6rem;
    }

    .heading span {
        font-size: 2.3rem;
    }
}
.heading span {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    color: var(--main-color);
    font-size: 3rem;
}
:root {
    --main-color: #443;
    --border-radius: 95% 4% 97% 5% / 4% 94% 3% 95%;
    --border-radius-hover: 4% 95% 6% 95% / 95% 4% 92% 5%;
    --border: .2rem solid var(--main-color);
    --border-hover: .2rem dashed var(--main-color);
}
/* From Uiverse.io by 3bdel3ziz-T */ 
.card-container {
  width: 100%;
  background-color: #E1D8D0;
  background-image: linear-gradient(
    139deg,
    rgba(36, 40, 50, 1) 0%,
    
  );

  user-select: none;
  border-radius: 10px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.card-container .list-items .list-item label input[type="radio"] {
  display: none;
}

.card-container .divider {
  border-top: 1.5px solid #42434a;
}

.card-container .list-items {
  list-style-type: none;
  display: flex;
  flex-direction: column;
  gap: 4px;
  padding: 0px;
}

.card-container .list-items .list-item > label {
  display: flex;
  align-items: center;
  color: #7e8590;
  gap: 10px;
  transition: all 0.3s ease-out;
  padding: 6px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: 600;
}

.card-container .list-items .list-item label svg {
  width: 19px;
  height: 19px;
  transition: all 0.3s ease-out;
}

.card-container .list-items .list-item label:has(input[type="radio"]:checked),
.card-container .list-items .list-item label:hover {

  color: var(--hover-color);
}

.card-container .list-items .list-item label:active {
  transform: scale(0.96);
}

.card-container .list-items .list-item label:has(input[type="radio"]:checked) svg,
.card-container .list-items .list-item label:hover svg {
  stroke: var(--hover-storke);
}
.membership .box {
    perspective: 1000px; /* Required for 3D effect */
}

.membership .card {
    width: 39%;
    height: 200px;
    position: relative;
    transform-style: preserve-3d;
    transition: transform 0.8s ease;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.membership .box:hover .card {
    transform: rotateY(180deg); /* Flip the card on hover */
}

.membership .front,
.membership .back {
    width: 100%;
    height: 100%;
    position: absolute;
    backface-visibility: hidden; /* Hide the back side of the card */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 20px;
    border-radius: 15px;
    background: #fff;
}

.membership .front {
    background: #E1D8D0;
}

.membership .back {
    background: #333;
    color: #fff;
    transform: rotateY(180deg); /* Initially hide the back side */
}

.membership h3 {
    font-size: 24px;
    margin-bottom: 15px;
}

.membership .price {
    font-size: 30px;
    font-weight: bold;
    color: #333;
}

    .membership .price span {
        font-size: 16px;
        color: #666;
    }

.membership ul {
    list-style: none;
    padding: 0;
}

    .membership ul li {
        font-size: 16px;
        margin: 10px 0;
    }

@media (max-width: 768px) {
    .membership .box-container {
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    }
}

@media (max-width: 480px) {
    .membership .box-container {
        grid-template-columns: 1fr;
    }
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="main-body">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                                        <div class="mt-3" style="width: 100%;">
                                            <h4 runat="server" id="FullN"></h4>
                                            <p class="text-secondary mb-1">Full Stack Developer</p>
                                            <p runat="server" id="Femail" class="text-muted font-size-sm"></p>
                                            <%--<button type="button" class="btn btn-info" onclick="openModal()" style="width: 100%;" >Edit</button>--%>
                                            <!-- From Uiverse.io by 3bdel3ziz-T --> 
<div class="card-container">
    <ul
      class="list-items"
      style="--color:#5353ff;--hover-storke:#fff; --hover-color:#fff"
    >
      <li class="list-item">
        <label for="rename">
          <input type="radio" id="rename" name="filed" checked="" onclick="openModal()" class=" btn-info" />
          <svg
            class="lucide lucide-pencil"
            stroke-linejoin="round"
            stroke-linecap="round"
            stroke-width="2"
            stroke="#7e8590"
            fill="none"
            viewBox="0 0 24 24"
            height="25"
            width="25"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"
            ></path>
            <path d="m15 5 4 4"></path>
          </svg>
          Edit Information</label
        >
      </li>
      <li class="list-item" style="--color:#5353ff">
        <label class="label" for="addmember">
          <input type="radio" id="addmember" name="filed" class="btn-info" onclick="openUpdatePassModal()" />
            <svg
                class="lucide lucide-lock"
                stroke-linejoin="round"
                stroke-linecap="round"
                stroke-width="2"
                stroke="#7e8590"
                fill="none"
                viewBox="0 0 24 24"
                height="25"
                width="25"
                xmlns="http://www.w3.org/2000/svg"
            >
                <path d="M17 10V7a5 5 0 0 0-10 0v3H4v10h16V10h-3zM12 7a3 3 0 0 1 3 3v3H9V10a3 3 0 0 1 3-3z"></path>
            </svg>
          Change Password</label
        >
      </li>
      <div class="divider"></div>
      <li class="list-item" style="--color:#5353ff">
        <label for="settings">
          <input type="radio" id="settings" name="filed" />
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="#7e8590"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-settings"
          >
            <path
              d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"
            ></path>
            <circle cx="12" cy="12" r="3"></circle>
          </svg>
          Settings</label
        >
      </li>
      <li class="list-item delete-item" style="--color:#8e2a2a">
        <label for="delete">
          <input type="radio" id="delete" name="filed" />
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="#7e8590"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-trash-2"
          >
            <path d="M3 6h18"></path>
            <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
            <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
            <line x1="10" x2="10" y1="11" y2="17"></line>
            <line x1="14" x2="14" y1="11" y2="17"></line>
          </svg>
          Delete Account</label
        >
      </li>
      <div class="divider"></div>
      <li
        class="list-item"
        style="--color:rgba(56, 45, 71, 0.836);--hover-storke:#bd89ff;--hover-color:#bd89ff"
      >
        <label for="teamaccess">
          <input type="radio" id="teamaccess" name="filed" />
  
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="#7e8590"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-users-round"
          >
            <path d="M18 21a8 8 0 0 0-16 0"></path>
            <circle cx="10" cy="8" r="5"></circle>
            <path d="M22 20c0-3.37-2-6.5-4-8a5 5 0 0 0-.45-8.3"></path>
          </svg>
          Team Access</label
        >
      </li>
    </ul>
  </div>
  
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">First Name</h6>
                                        </div>
                                        <div runat="server" id="fullName" class="col-sm-9 text-secondary">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Last Name</h6>
                                        </div>
                                        <div runat="server" id="lastname" class="col-sm-9 text-secondary">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div runat="server" id="email1" class="col-sm-9 text-secondary">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div runat="server" id="phone1" class="col-sm-9 text-secondary">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row mt-3">
                                        <div class="col-sm-12 text" style="padding-top: 2.5%;">

                                            <%--<button type="button" class="btn btn-info" onclick="openUpdatePassModal()" style="width: 100%;">Update Password</button>--%>
                                            <!-- From Uiverse.io by vinodjangid07 --> 
                                             <div class="col-sm-3">
     <h6 class="mb-0" style="font-weight: 900;">Previous Subscriptions :</h6>
 </div>
                                            <br />

                                            <!-- MEMBERSHIP -->
<section class="membership" id="membership">

  <div class="box-container">
      <!-- Individual Membership -->
      <div class="box">
          <div class="card">
              <div class="front">
                  <h3>Individual Membership</h3>
                  <p class="price">15 JOD<span>/month</span></p>
                  <small style="color:red;">It expired on 2-2025.</small>
              </div>
              <div class="back">
                  <h3>Individual Membership</h3>
                  <ul>
                      <li>Borrow up to 5 books at a time for 2 weeks.</li>
                      <li>4 drinks of your choice.</li>
                      <li>20% discount on private rooms.</li>
                  </ul>
              </div>
          </div>
      </div>

                                        </div>

                                    </div>

                                    <!-- Edit Profile -->
                                    <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="passwordModalLabel">Edit Profile</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1">First Name</label>
                                                            <asp:TextBox runat="server" ID="fName" placeholder="Enter your first name" class="form-control"></asp:TextBox>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1">Last Name</label>
                                                            <asp:TextBox runat="server" ID="lName" placeholder="Enter your last name" class="form-control"></asp:TextBox>

                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1">Email</label>
                                                            <asp:TextBox runat="server" ID="email" placeholder="Enter your email" class="form-control"></asp:TextBox>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1">phone</label>
                                                            <asp:TextBox runat="server" ID="phone" placeholder="Enter your phone" class="form-control"></asp:TextBox>
                                                        </div>
                                                        <asp:Label ID="result2" runat="server" Visible="false" /><br />
                                                        <asp:Button runat="server" ID="save" OnClick="save_Click" Text="Save Changes" class="btn btn-primary" />
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Update Password-->
                                    <div class="modal fade" id="updatePassModal" tabindex="-1" aria-labelledby="updatePassModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="updatePassModalLabel">Update Password</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="oldPass">Current Password</label>
                                                            <asp:TextBox ID="CurrentPass" runat="server" placeholder="Enter current password" class="form-control"></asp:TextBox>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="newPass">New Password</label>
                                                            <asp:TextBox ID="newPass" runat="server" placeholder="Enter new password" class="form-control" type="password"></asp:TextBox>

                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="confirmPass">Confirm Password</label>
                                                            <asp:TextBox ID="confirmPass" runat="server" placeholder="Confirm new password" class="form-control" type="password"></asp:TextBox>

                                                        </div>
                                                        <asp:Label ID="result" runat="server" Visible="false" /><br />
                                                        <asp:Button ID="savepass" runat="server" Text="Save Changes" OnClick="savepass_Click" class="btn btn-primary" />
                                                        <button type="button" class="btn btn" data-bs-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <br />
            </div>
            <div class="headline">
    <h1 class="heading">History<span>Books & Meeting Room</span></h1>
            </div>
            <table class="table table-hover custom-table">
                <thead class="table-dark">

                    <tr>
                        <th scope="col">Book Name</th>
                        <th scope="col">Pick Up</th>
                        <th scope="col">Delivery</th>
                    </tr>
                </thead>
<%--                <tbody runat="server" id="bookHis">--%>

                </tbody>
            </table>

            <table class="table table-hover custom-table">
                <thead class="table-dark">

                    <tr>
                        <th scope="col">Room Name </th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Snack</th>
                    </tr>
                </thead>
<%--                <tbody runat="server" id="roomHis">--%>

                </tbody>
            </table>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function openModal() {
            var modal = new bootstrap.Modal(document.getElementById('passwordModal'));
            modal.show();
        }
        function openUpdatePassModal() {
            var modal = new bootstrap.Modal(document.getElementById('updatePassModal'));
            modal.show();
        }

    </script>

</body>
</html>
