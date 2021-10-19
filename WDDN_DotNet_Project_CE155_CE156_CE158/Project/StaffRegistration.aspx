<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="StaffRegistration.aspx.cs" Inherits="Project.StaffRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            width: 100%;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            border-radius: 0.25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-12 mx-auto">
             <div class="card">
                 <div class="card-body">

                     <div class="row">
                         <div class="col-md-6 mx-auto">
                             <center>
                                 <img width=150px src="images/OIP.jpeg" />
                             </center>                         

                         </div>
                     </div>

                     <div class="row">
                         <div class="col-md-6 mx-auto">
                             <center>
                                 <h3>Staff Registration</h3>
                             </center>                         

                         </div>
                     </div>
                    <hr />                       
                     <div class="row">
                         <div class="col-md-3">
                             <label>Name*</label>
                             <%--<span><asp:RequiredFieldValidator ID="RequiredName" ControlToValidate="Name" runat="server" ForeColor="Red" ErrorMessage="Please Enter Your Name"></asp:RequiredFieldValidator></span>--%>
                             <div class="form-group">
                                 <asp:TextBox required="true" ID="Name" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
                             </div>
                         </div>

                         <div class="col-md-3">
                             <label>Email Address*</label>
                             <span><%--<asp:RequiredFieldValidator ID="RequiredUsername" ControlToValidate="Username" runat="server" ForeColor="Red" ErrorMessage="Please Enter Your Username"></asp:RequiredFieldValidator>--%></span>
                             <div class="form-group">
                                 <asp:TextBox ID="Username" required="true"  CssClass="form-control" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                             </div>
                              <asp:RegularExpressionValidator ID="RegularEmail" runat="server" ControlToValidate="Username" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ErrorMessage="Please Enter Valid Email Address"></asp:RegularExpressionValidator>

                         </div>
                          <div class="col-md-3">
                             <label>Mobile Number*</label>
                             <span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Enter 10 digit number" ControlToValidate="Mnumber" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></span>
                             <div class="form-group">
                                 
                                 <asp:TextBox CssClass="form-control" required="true"  ID="Mnumber" runat="server" placeholder="Mobile Number" MaxLength="10"></asp:TextBox>
                             </div>
                         </div>
                        
                   
                          <div class="col-md-3 ">
                             <label>Applying for : *</label><br />
                             <asp:DropDownList ID="ServicesList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="Id" Height="48px" Width="214px"></asp:DropDownList>

                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [ServiceName] FROM [Service] "></asp:SqlDataSource>
                         </div>                 
                         
                     </div>
                   
                     <div class="row">

                             <center>
                             <div class="col-md-6 mx-auto ">
                                 <asp:Button ID="Submit" class="btn btn-primary btn-group" runat="server" Text="Get In Touch" OnClick="Button1_Click" />
                             </div>
                             </center>
                        </div>


                 </div>
             </div>
         </div>
      </div>
   </div>
    <br />
</asp:Content>
