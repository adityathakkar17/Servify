<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ApplicationRequest.aspx.cs" Inherits="Project.ApplicationRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" >
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="card">
                    <div class="card-body" >

                        <div class="row">
                            <div class="col-md-10 mx-auto">
                                <center>
                                    <img width="150" src="../images/OIP.jpeg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-10 mx-auto">
                                <center>
                                    <h3>Staff Application Requests</h3>
                                </center>

                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <center>
                                <div class="col">
                                    <%--<asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" DataKeyNames="Id">
                                        <Columns>

                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="hdrow" />
                                                <HeaderTemplate>
                                                    <asp:Label ID="hlbleid" runat="server" Text="Id"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbleid" runat="server" Text='<%# Eval("Id") %>'>  
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                            <asp:BoundField DataField="StaffName" HeaderText="StaffName" SortExpression="StaffName" />
                                            <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                                            <asp:BoundField DataField="ServiceId" HeaderText="ServiceId" SortExpression="ServiceId" />
                                            <asp:BoundField DataField="IsVerified" HeaderText="IsVerified" SortExpression="IsVerified" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnshow" CssClass="btn btn-primary  btn-sm" runat="server" Text="Confirm" CommandName="Select" CommandArgument='<%# Eval("Id")%>' CausesValidation="False" />
                                                    <asp:Button ID="btndelete" class="btn btn-primary  btn-sm" runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" />
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>--%>
                                    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"  CellPadding="3" GridLines="Vertical">
                                    <Columns>
                                        <asp:TemplateField>
                                        
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="lbleid" Visible="false" runat="server" Text='<%# Eval("Id") %>'>  
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnshow" CssClass="btn btn-primary  btn-sm" runat="server" Text="Confirm" CommandName="Select" CommandArgument='<%# Eval("Id")%>' CausesValidation="False" />
                                                    <asp:Button ID="btndelete" class="btn btn-primary  btn-sm" runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" />
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                        </Columns>
                                        
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    
                                        
                    </asp:GridView>
                                    

                                </div>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                <br />
                                <br />
                                <asp:HyperLink CssClass="btn btn-primary ml-lg-2" ID="HyperLink1" NavigateUrl="~/AdminHome.aspx" runat="server">Back to Home</asp:HyperLink>

                            </center>
                        </div>

                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
