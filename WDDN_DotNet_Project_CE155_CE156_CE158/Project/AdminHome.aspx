<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Project.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .col-md-4-s{
            width : 250px;
            height : 300px;
            border : double;
            border-block-color : red;
            float : left ;
            margin : 00px 80px ;
            transition : 1s;
            /*#5f687b*/
            background-color : white;
        }

        .col-md-4-s:hover{
            transform :scale(1.1);
            box-shadow :2px 2px 2px #000;
            z-index : auto ;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container" style="width: 90%;
            margin: 0px auto;
            display: flex;
            justify-content: center;
            color: black;">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <center>
                                <h2>Admin Features</h2>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <hr />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4-s">
                            <center>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/StaffList.aspx" runat="server"><img  width="150px" src="../images/technician.png" class="img-fluid"/></asp:HyperLink>
                                <h4>Expert Technician</h4>
                                <p class="text-justify">
                                    From switch replacement to complete home renovation, we provide expert hands to every home complication.
                                </p>
                            </center>
                        </div>

                        <div class="col-md-4-s">
                            <center>
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Services.aspx" runat="server"><img width=150px src="../images/services-demand.png" class="img-fluid"/></asp:HyperLink>
                                
                                <h4>Services</h4>
                                <p class="text-justify">
                                    ADD , MODIFY , VIEW 
                                    Serving 24x7 to our customer is our top motto . Now get services at your door anytime, anywhere.
                                </p>
                            </center>
                        </div>

                        <div class="col-md-4-s">
                            <center>
                                <asp:HyperLink ID="HyperLink3" NavigateUrl="~/SubServices.aspx" runat="server"><img width=150px src="../images/prices.png" class="img-fluid"/></asp:HyperLink>
                                <h4>SubServices</h4>
                                <p class="text-justify">
                                    Serving 24x7 to our customer is our top motto . Now get services at your door anytime, anywhere.
                                </p>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <section>
        <div class="container" style="width: 90%;
            margin: 0px auto;
            display: flex;
            justify-content: center;
            color: black;">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4-s">
                            <center>
                                <asp:HyperLink ID="HyperLink4" NavigateUrl="~/ApplicationRequest.aspx" runat="server"><img  width="150" src="../images/technician.png" class="img-fluid"/></asp:HyperLink>
                                <h4>Application Request Of Staff</h4>
                                <p class="text-justify">
                                    View all Application requests of Staff willing to join the Company.
                                </p>
                            </center>
                        </div>

                        <div class="col-md-4-s">
                            <center>
                                <asp:HyperLink ID="HyperLink5" NavigateUrl="~/CustomerList.aspx" runat="server"><img width="150" src="../images/services-demand.png" class="img-fluid"/></asp:HyperLink>
                                <h4>Customer List</h4>
                                <p class="text-justify">
                                    View the entire List Of Customers .
                                </p>
                            </center>
                        </div>

                        <div class="col-md-4-s">
                            <center>
                                <asp:HyperLink ID="HyperLink6" NavigateUrl="~/PaymentHistory.aspx" runat="server"><img width=150px src="../images/prices.png" class="img-fluid"/></asp:HyperLink>
                                <h4>Payment History </h4>
                                <p class="text-justify">
                                    Easy booking, On-time service delivery, cutting edge resolution through expert hands on Pocket friendly cost.
                                </p>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <br />
    <br />
</asp:Content>
