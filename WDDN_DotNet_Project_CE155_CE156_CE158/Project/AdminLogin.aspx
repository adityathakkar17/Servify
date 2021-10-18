<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Project.AdminLogin" %>
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
                                    <img width="150px" src="imgs/adminuser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
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
                                <label class="form-label">Admin Email</label>
                                <asp:TextBox CssClass="form-control" ID="adminmail" required="true" runat="server" placeholder="Admin Email" TextMode="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="adminmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ErrorMessage="Please Enter Valid Email Address"></asp:RegularExpressionValidator>
                                
                            </div>
                            <div class="m-3">
                                <label class="form-label">Admin Password</label>
                                <asp:TextBox CssClass="form-control" required="true" ID="adminpass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                
                            </div>
                            <div class="m-3">
                                <asp:Button class="btn btn-success w-100 btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"/>
                            </div>
                            <%--                                   <div class="m-3">
                                       <a href="homepage.aspx"><input id="Button2" class="btn btn-info w-100 btn-lg" type="button" value="Signup" /></a>
                                 </div>--%>
                        </div>
                    </div>

                </div>

                <%--<a href="#"> <span><<</span> Back to Home</a> <br \><br \>--%>
            </div>
        </div>
    </div>
</asp:Content>
