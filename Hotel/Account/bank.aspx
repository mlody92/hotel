<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="bank.aspx.cs" Inherits="Hotel.Account.bank" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">

    <div class="post">
        <div class="postheader">
            <h1>Bank</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                 <p>

                    <asp:Label ID="komunikatLabel" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                </p>
                <table>
                    <tr>
                        <td>
                            <p>Wybierz numer kredytu: </p>
                        </td>
                        <td>
                            <p>
                                <asp:DropDownList ID="numerDropDownList" runat="server">
                                    <asp:ListItem Text="Wybierz" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                            </p>

                        </td>
                        <td>
                            <p>
                                <asp:Label ID="numerLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Ilość: </p>
                        </td>
                        <td>
                            <p>
                                <asp:TextBox ID="iloscTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                            </p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="iloscLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr><tr>
                        <td>
                             
                        </td>
                           
                        <td>
                            <p>
                                <asp:LinkButton ID="zatwierdzLinkButton" runat="server" OnClick="zatwierdzLinkButton_Click">Zatwierdź</asp:LinkButton>
                            </p>
                        </td>
                        <td></td>
                    </tr>
                </table>
               
                <table>
                    <tr>
                        <td>
                            <p>Maksymalny kredyt (suma kredytów):</p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="maxLabel" runat="server" Text=""></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Suma Twoich kredytów:</p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="sumaLabel" runat="server" Text=""></asp:Label>
                            </p>
                        </td>
                    </tr>
                </table>


                <div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="allGridView" runat="server" DataSourceID="allSqlDataSource" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="kwota" HeaderText="kwota" SortExpression="kwota" />
                                <asp:BoundField DataField="odsetki" HeaderText="odsetki" SortExpression="odsetki" />
                                <asp:BoundField DataField="czas" HeaderText="czas" SortExpression="czas" />
                             </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="allSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [bank] WHERE [id_uzytkownika] = @id_uzytkownika AND czas>0">
                        </asp:SqlDataSource>
                    </p>
                </div>


                <p></p>

                <p>Dostępne kredyty:</p>
                <table class="bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Czas</th>
                            <th>Oprocentowanie</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>1</td>
                        <td>0,5 roku</td>
                        <td>20 %</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>1 rok</td>
                        <td>17 %</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>3 lata</td>
                        <td>15 %</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>5 lat</td>
                        <td>12 %</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>10 lat</td>
                        <td>10 %</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>15 lat</td>
                        <td>7 %</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="postfooter"></div>
    </div>
</asp:Content>
