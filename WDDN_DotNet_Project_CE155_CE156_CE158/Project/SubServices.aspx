<%-- Final Sub Services Page --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="SubServices.aspx.cs" Inherits="Project.SubServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <img width="100" src="imgs/generaluser.png" class="auto-style1" />
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>SubServices Section</h4>
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
                                        <div class="form-group">
                                            <asp:DropDownList ID="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Sub Service Name</label>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" ControlToValidate="txtISname" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtISname" Text="" runat="server" placeholder="Sub Service Name" CausesValidation="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Sub Service Price</label>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" ControlToValidate="txtISprice" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtISprice" Text="" runat="server" placeholder="Price" CausesValidation="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Service Image</label>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" ControlToValidate="fuISImage" ForeColor="Red"></asp:RequiredFieldValidator></span>
                                        <div class="form-group">
                                            <asp:FileUpload ID="fuISImage" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col mx-auto">
                                        <center>
                                            <div class="form-group">
                                                <asp:Button class="btn btn-primary btn-block btn-md" ID="btnInsert" runat="server" OnClick="BtnInsert_Click" Text="Add SubService"></asp:Button>
                                            </div>
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" OnRowEditing="gv1_RowEditing" OnRowUpdating="gv1_RowUpdating" OnRowCancelingEdit="gv1_RowCancelingEdit" OnRowDeleting="gv1_RowDeleting"   CssClass="gridview" OnPageIndexChanging="gv1_PageIndexChanging"  AllowPaging="True" PageSize="4"  Width="789px" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="hdrow" />
                                <HeaderTemplate>
                                    <asp:Label ID="hlblsubsId" runat="server" Text="Id"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblsubsId" runat="server" Text='<%# Eval("Id") %>'>  
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="hdrow" />
                                <HeaderTemplate>
                                    <asp:Label ID="hlblsubsname" runat="server" Text="Name"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblsubsname" runat="server" Text='<%# Eval("SubServiceName") %>'>  
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtsubsname" runat="server" Text='<%# Eval("SubServiceName") %>'>  
                                    </asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="hdrow" />
                                <HeaderTemplate>
                                    <asp:Label ID="hlblprice" runat="server" Text="Price"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblprice" runat="server" Text='<%# Eval("CurrentPrice") %>'>  
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtprice" runat="server" Text='<%# Eval("CurrentPrice") %>'>  
                                    </asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="hdrow" />
                                <HeaderTemplate>
                                    <asp:Label ID="hlblimg" runat="server" Text="Image"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="img1" runat="server" ImageUrl='  
                                    <%# "~/"+Eval("Image") %>'
                                        Height="100px" Width="100px" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fu1" runat="server" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="hdrow" />
                                <ItemTemplate>
                                    <asp:Button ID="btnedit" class="btn btn-primary  btn-sm" runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" />
                                    <asp:Button ID="btndelete" class="btn btn-primary  btn-sm" runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="Update" CausesValidation="False" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" />

                                    <asp:Button ID="Button1" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                        <asp:Label ID="NoSubServices" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
        <a href=""><< Back to Home</a>
    </div>
    </div>
</asp:Content>
