<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #services, #service1 {
            padding: 10px 0 40px 0;
        }

            #services .box, #service1 .box {
                padding: 20px;
                position: relative;
                overflow: hidden;
                border-radius: 10px;
                margin: 0 10px 40px 10px;
                background: #fff;
                box-shadow: 0 10px 29px 0 rgba(68, 88, 144, 0.1);
                transition: all 0.3s ease-in-out;
                text-align: center;
            }

                #services .box:hover, #service1 .box:hover {
                    transform: scale(1.1);
                }

            #services .title, #service1 .title {
                font-weight: 700;
                font-size: 18px;
                padding-top: 20px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="services" class="services section-bg mt-5">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h4>Services</h4>
                <%--<p>Always aim to constantly understand, create and retain value for everyone and all stakeholders. Managing the value created and constantly improving or having the mindset to improve will be key.</p>--%>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>
            <asp:Panel CssClass="row" ID="Panel1" runat="server">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" RepeatColumns="4" DataSourceID="SqlDataSource1">
                
                <ItemTemplate>
                         
                    <%--Id:
                    <asp:Label ID="IdLabel" runat="server" Text=--%>
                    <div  data-aos="zoom-in" data-aos-delay="100">
                        <div class="box">
                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/BookServices.aspx?Sid=" + Eval("Id") %>' runat="server">
                                <asp:Image ID="Image1" CssClass="img fluid" Height="100px" Width="150px" ImageUrl= '<%# "~/"+Eval("Image") %>' runat="server" />
                            </asp:HyperLink>
                        <h4 class="title"><asp:Label ID="ServiceNameLabel" runat="server" Text='<%# Eval("ServiceName") %>' /></h4>
                    </div>
                </div> 
                        
                </ItemTemplate>
            </asp:DataList>
            </asp:Panel>
            <%--<div class="row">
                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/amc-plan.png"></a>
                        <h4 class="title">AMC Plan</h4>
                    

                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/ele-icon.png"></a>
                        <h4 class="title">Electrician</h4>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/carpentry.png"></a>
                        <h4 class="title">Carpenter</h4>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/cctv.png"></a>
                        <h4 class="title">CCTV Security</h4>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/ac.jpeg"></a>
                        <h4 class="title">AC Service</h4>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/painting.png"></a>
                        <h4 class="title">Painter</h4>
                    </div>
                </div>

                <div class="col-md-3 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/plumbing.png"></a>
                        <h4 class="title">Plumber</h4>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="box">
                        <a href="#">
                            <img class="img fluid" src="images/painting.png"></a>
                        <h4 class="title">Painter</h4>
                    </div>
                </div>
            </div>


        </div>
            </div>--%>
        </div>
    </section>





</asp:Content>
