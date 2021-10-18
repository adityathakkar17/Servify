<%@ Page Title="" Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Site1.Master" CodeBehind="BookServices.aspx.cs" Inherits="Project.BookServices" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="lib/bootstrap/js/bootstrap.esm.min.js"></script>
    <style>
        /* Button used to open the chat form - fixed at the bottom of the page */

        .open-button {
            background-color: black;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.9;
            position: fixed;
            bottom: 550px;
            right: 28px;
            width: 280px;
        }

        /* The popup chat - hidden by default */
        .chat-popup {
            position: absolute;
            bottom: 150px;
            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 300px;
            padding: 10px;
            background-color: white;
        }

            /* Full-width textarea */
            .form-container textarea {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
                resize: none;
                min-height: 200px;
            }

                /* When the textarea gets focus, do something */
                .form-container textarea:focus {
                    background-color: #ddd;
                    outline: none;
                }

            /* Set a style for the submit/send button */
            .form-container .btn {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom: 10px;
                opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: red;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <asp:Button CssClass="open-button" ID="Cart" runat="server" Text="Cart" Visible="false" OnClick="Cart_Click" />
        <asp:Panel CssClass="chat-popup" ID="MyCartList" Visible="false" runat="server">
            <asp:Panel CssClass="form-container" ID="CartForm" runat="server">
                <h1>Cart</h1>
                <asp:Label ID="Label1" runat="server" Text="SubServices"></asp:Label>
                <br />
                <textarea id="SS" placeholder="Type message.." name="msg" runat="server"></textarea>
                <asp:Button ID="btnBook" CssClass="btn" runat="server" Text="Book" OnClick="btnBook_Click" />
                <asp:Button ID="btnCancel" CssClass="btn cancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
    <br />
    <br />
    <br />
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [ServiceName] FROM [Service]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="Id">
        </asp:DropDownList>
        <br />--%>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SubService] WHERE ([ServiceId] = @ServiceId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ServiceId" QueryStringField="Sid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel CssClass="col-md-4 mx-auto" ID="Panel2" runat="server">
        
    <asp:DataList ID="DataList1" CssClass="text-center" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" OnItemCommand="DataList1_ItemCommand" Width="500px">

        <ItemTemplate>
            <div class="row">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">

                                    <asp:Image ID="Image1" ImageUrl='<%# "~/"+ Eval("Image") %>' Height="100px" Width="100px" runat="server" />
                                </div>
                                <%--<asp:HiddenField ID="HiddenFieldId" Value='<%# Eval("Id") %>' runat="server" />--%>
                                <asp:Label ID="IdLabel" Visible="false" runat="server" Text='<%# Eval("Id") %>' />
                                <div class="col">
                                    <p>
                                        <asp:Label ID="SubServiceNameLabel" runat="server" Text='<%# Eval("SubServiceName") %>' />
                                    </p>
                                    <p>
                                        <small>
                                            <b>
                                                <asp:Label ID="CurrentPriceLabel" runat="server" Text='<%# Eval("CurrentPrice") %>' /></b>
                                        </small>
                                    </p>
                                </div>
                                <div class="col">
                                    <asp:Button ID="Button1" class="btn btn-primary btn-block btn-md" Width="105px" runat="server" Text="Add to Cart" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        </ItemTemplate>

    </asp:DataList>
        
        <br />
        <br />
        <center>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:HyperLink CssClass="btn btn-primary ml-lg-2" ID="HyperLink1" NavigateUrl="~/Home.aspx" runat="server">Back to Home</asp:HyperLink>
        </center>    
    </asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
