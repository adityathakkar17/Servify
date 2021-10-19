<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Project.Customer.CustomerLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="150"  />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr>
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                           <div class="m-3">
                                <label class="form-label">User Email</label>
                                <asp:TextBox CssClass="form-control" ID="usermail"  runat="server" placeholder="User Email" TextMode="Email" > </asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="usermail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ErrorMessage="Please Enter Valid Email Address"></asp:RegularExpressionValidator>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="usermail" ForeColor="Red" ErrorMessage="Please Enter Your Username" runat="server" ></asp:RequiredFieldValidator>
                          </div>
                        <div class="m-3">
                            <label class="form-label">User Password</label>
                            <asp:TextBox CssClass="form-control" ID="userpass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredPassword" ControlToValidate="userpass" runat="server" ForeColor="Red" ErrorMessage="Please Enter Your Password"></asp:RequiredFieldValidator>
                        </div>
                        <div class="m-3">
                            <asp:Button class="btn btn-success w-100 btn-lg" ID="login" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>
                        <div class="m-3">
                            <asp:HyperLink CssClass="btn btn-info w-100 btn-lg" ID="HyperLink2" NavigateUrl="~/CustomerRegistration.aspx" runat="server">Sign Up</asp:HyperLink>
                        </div>
                        </div>
                    </div>

                </div>
               <center>
            <asp:HyperLink CssClass="btn btn-primary ml-lg-2" ID="HyperLink1" NavigateUrl="~/Home.aspx" runat="server">Back to Home</asp:HyperLink>
        </center>    
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
