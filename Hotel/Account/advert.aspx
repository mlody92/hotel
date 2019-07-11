<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="advert.aspx.cs" Inherits="Hotel.Account.advert" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">

    <div class="post">
        <div class="postheader">
            <h1>Reklama</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <p>

                    <asp:Label ID="komunikatLabel" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Twoje reklamy"></asp:Label>
                </p>

                <div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="allGridView" runat="server" DataSourceID="allSqlDataSource" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                                <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk" />
                                <asp:BoundField DataField="czas" HeaderText="czas" SortExpression="czas" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="allSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT reklama.nazwa, user_reklama.czas, reklama.zysk FROM user_reklama INNER JOIN reklama ON user_reklama.reklama_id = reklama.id WHERE user_reklama.user_id=@user_id AND user_reklama.czas>0"></asp:SqlDataSource>
                    </p>
                </div>
                <br />
                <p>
                    <asp:Label ID="Label2" runat="server" Text="Dostępne reklamy"></asp:Label>
                </p>

                <div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                                <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk" />
                                <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt" />
                                <asp:BoundField DataField="czas" HeaderText="czas" SortExpression="czas" />
                                <asp:TemplateField ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="reklama" Text="Wykup" CommandArgument='<%#Eval("id")+","+Eval("koszt")+","+Eval("czas")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM reklama"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
        </div>
        <div class="postfooter"></div>
    </div>
</asp:Content>
