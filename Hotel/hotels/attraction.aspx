<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="attraction.aspx.cs" Inherits="Hotel.hotels.attraction" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
    <div class="post">
        <div class="postheader">
            <h1>Zbuduj atrakcję</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <div>
                    <p>
                        <asp:Label ID="komunikatLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                    </p>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="allhoteleGridView" runat="server" DataSourceID="attrSqlDataSource" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" InsertVisible="False" ReadOnly="True" SortExpression="nazwa" />
                                <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt" />
                                <asp:BoundField DataField="koszt_miesieczny" HeaderText="koszt_miesieczny" SortExpression="koszt_miesieczny" />

                                <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="zbuduj" Text="Zbuduj" CommandArgument='<%#Eval("id")+","+Eval("koszt")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="attrSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT atrakcja.id, atrakcja.nazwa, atrakcja.koszt, atrakcja.koszt_miesieczny FROM atrakcja INNER JOIN rodzaj_hotelu ON atrakcja.rodzaj_hotelu = rodzaj_hotelu.id INNER JOIN dzialka ON rodzaj_hotelu.id = dzialka.rodzaj_hotelu INNER JOIN dzialka_user ON dzialka.id = dzialka_user.dzialka_id WHERE (dzialka_user.id = @dzialka_user)"></asp:SqlDataSource>
                    </p>
                </div>

            </div>
        </div>
        <div class="postfooter"></div>

    </div>

</asp:Content>
