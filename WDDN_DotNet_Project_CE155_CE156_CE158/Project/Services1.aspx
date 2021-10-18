<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Services1.aspx.cs" Inherits="Project.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

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
                    <h4>Services Section</h4>
                </center>
            </div>
        </div>
        <hr class="mx-auto">

        <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Service Name</label>
                                    <span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="ServiceName" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="ServiceName" runat="server" placeholder="Service Name" CausesValidation="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Service Image</label>
                                    <span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="ServiceImage" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                    <div class="form-group">
                                        <asp:FileUpload ID="ServiceImage" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col mx-auto">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button class="btn btn-primary btn-block btn-md" ID="BtnAddService" runat="server" Text="Add Service" ValidateRequestMode="Enabled" OnClick="BtnAddService_Click" />
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7 mx-auto">
                    <!--<div class="card">
                        <div class="card-body">-->
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" DeleteCommand="DELETE FROM [Service] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Service] ([ServiceName], [Image]) VALUES (@ServiceName, @Image)" SelectCommand="SELECT * FROM [Service]" UpdateCommand="UPDATE [Service] SET [ServiceName] = @ServiceName, [Image] = @Image WHERE [Id] = @Id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ServiceName" Type="String" />
                                            <asp:Parameter Name="Image" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ServiceName" Type="String" />
                                            <asp:Parameter Name="Image" Type="String" />
                                            <asp:Parameter Name="Id" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mx-auto">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="544px">
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                            <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
                                            <asp:ImageField DataImageUrlField="Image" HeaderText="SImage">
                                                <ControlStyle Height="75px" Width="75px" />
                                            </asp:ImageField>
                                        </Columns>                                       
                                    </asp:GridView>
                                </div>
                            </div>
                            <br />
                    
                            </div>
                        <!--</div>
                    </div>-->

                </div>
            </div>   
        <a href=""><< Back to Home</a>
    </div>
    

            

            
             

   
</asp:Content>
