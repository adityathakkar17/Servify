<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffList.aspx.cs" Inherits="Project.StaffList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
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
                            <h4>Staff List</h4>
                        </center>
                    </div>
                </div>
                <hr class="mx-auto">
                <center>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Staff] WHERE ([IsVerified] = @IsVerified)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="IsVerified" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="StaffName" HeaderText="StaffName" SortExpression="StaffName" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                            <asp:BoundField DataField="ServiceId" HeaderText="ServiceId" SortExpression="ServiceId" />
                            <asp:BoundField DataField="IsVerified" HeaderText="IsVerified" SortExpression="IsVerified" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <br />
                    <br />
                    <center>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink CssClass="btn btn-primary ml-lg-2" ID="HyperLink1" NavigateUrl="~/Home.aspx" runat="server">Back to Home</asp:HyperLink>
                    </center>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
