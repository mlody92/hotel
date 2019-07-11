<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="Hotel.Admin.rooms.manage" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="messageContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taskContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="alertsContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="pageContentPlaceHolder" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading">
            Dodaj pokój
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Rodzaj pokoju: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="nameTextBox" runat="server" Width="127px"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Koszt: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="kosztTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="kosztLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Zysk za nocleg/dzień: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="zyskTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="zyskLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Stopien atrakcyjnosci: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="stopienDropDownList" runat="server" DataSourceID="stopienSqlDataSource" DataTextField="nazwa" DataValueField="id"></asp:DropDownList>
                            <asp:SqlDataSource ID="stopienSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [atrakcyjnosc]"></asp:SqlDataSource>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Rodzaj pracownika: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="rodzajDropDownList" runat="server" DataSourceID="rodzajSqlDataSource" DataTextField="stanowisko" DataValueField="id"></asp:DropDownList>
                            <asp:SqlDataSource ID="rodzajSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [pracownik]"></asp:SqlDataSource>
                        </p>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="addLinkButton" runat="server" OnClick="addLinkButton_Click">Zapisz</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
        </div>
    </div>



    <div class="box">
        <header>
            <h5>Pokoje - nieaktywne</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <p>
            <asp:Label ID="komunikat2Label" runat="server" Text="" Visible="false"></asp:Label>
        </p>
        <div id="sortableTable" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="nieaktywnyPokojSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj"></asp:BoundField>
                    <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt"></asp:BoundField>
                    <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk"></asp:BoundField>
                    <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa"></asp:BoundField>
                    <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko"></asp:BoundField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="aktywuj" Text="Aktywuj" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="nieaktywnyPokojSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pokoj.id, pokoj.rodzaj, pokoj.koszt, pokoj.zysk, pokoj.status, atrakcyjnosc.nazwa, pracownik.stanowisko FROM pokoj INNER JOIN atrakcyjnosc ON pokoj.atrakcyjnosc_id = atrakcyjnosc.id INNER JOIN pracownik ON pracownik.id = pokoj.id_pracownik WHERE (pokoj.status LIKE '%' + @status + '%')">
                <SelectParameters>
                    <asp:Parameter DefaultValue="nieaktywny" Name="status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>





    <div class="box">
        <header>
            <h5>Pokoje - aktywne</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable2" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <p>
            <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
        </p>
        <div id="sortableTable2" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="aktywnePokojSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj"></asp:BoundField>
                    <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt"></asp:BoundField>
                    <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk"></asp:BoundField>
                    <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa"></asp:BoundField>
                    <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko"></asp:BoundField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="dezaktywuj" Text="Dezaktywuj" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="aktywnePokojSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pokoj.id, pokoj.rodzaj, pokoj.koszt, pokoj.zysk, pokoj.status, atrakcyjnosc.nazwa, pracownik.stanowisko FROM pokoj INNER JOIN atrakcyjnosc ON pokoj.atrakcyjnosc_id = atrakcyjnosc.id INNER JOIN pracownik ON pracownik.id = pokoj.id_pracownik WHERE (pokoj.status LIKE @status + '%')">
                <SelectParameters>
                    <asp:Parameter DefaultValue="aktywny" Name="status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
