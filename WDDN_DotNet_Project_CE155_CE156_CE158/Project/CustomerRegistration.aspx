<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="Project.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" class="auto-style1" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Registration</h4>
                                </center>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="CName" runat="server" placeholder="Full Name" CausesValidation="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Gender</label>
                                <div class="form-group">
                                    <asp:RadioButtonList ID="RadioButtonGender" runat="server" CssClass="form-control" Height="75px" Width="200px">
                                        <asp:ListItem Value="Male"></asp:ListItem>
                                        
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Email ID*</label> &nbsp;
                                <span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="Username" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Username" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Password</label> &nbsp;
                                <span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>
</span>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Password" runat="server" placeholder="Password" TextMode="Password" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Confirm Password</label> &nbsp;
                                <span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" ControlToValidate="ConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
</span>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="ConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" ValidateRequestMode="Enabled"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <center>
                                        <asp:CompareValidator Display="Dynamic" ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Password and Confirm Password do not match!!" SetFocusOnError="True" ForeColor="Red"></asp:CompareValidator>
                                    </center>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Contact No</label> &nbsp;
                                <span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="MobileNumber" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
</span>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="MobileNumber" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Address" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block btn-md" ID="BtnSignUp" runat="server" Text="Sign Up" ValidateRequestMode="Enabled" OnClick="SignUpBtn" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <br />
</asp:Content>
