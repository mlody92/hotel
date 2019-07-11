<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manageUsers.aspx.cs" Inherits="Hotel.Admin.users.manageUsers" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="messageContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taskContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="alertsContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="pageContentPlaceHolder" runat="server">

    <div class="box">
        <header>
            <h5>Do akceptacji</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable1" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable1" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="doAkceptacjiSqlDataSource" AllowPaging="True" DataKeyNames="id" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                        <ControlStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="konto" HeaderText="konto" SortExpression="konto">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="uprawnienie" HeaderText="uprawnienie" SortExpression="uprawnienie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="zatwierdz" Text="Zatwierdź" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="doAkceptacjiSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id], [login], [uprawnienie], [imie], [nazwisko], [konto], [status] FROM [uzytkownik] WHERE ([status]  LIKE '%' + @status + '%') ORDER BY [id]" DeleteCommand="DELETE FROM uzytkownik WHERE (id = @id)" UpdateCommand="UPDATE uzytkownik SET login = @login, uprawnienie = @uprawnienie, imie = @imie, nazwisko = @nazwisko, konto = @konto WHERE (id = @id)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="do akceptacji" Name="status" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>









        <header>
            <h5>Użytkownicy - aktywni</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable2" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable2" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataSourceID="uzytkownicySqlDataSource">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                        <ControlStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="konto" HeaderText="konto" SortExpression="konto">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="uprawnienie" HeaderText="uprawnienie" SortExpression="uprawnienie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="zablokuj" Text="Zablokuj" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="uzytkownicySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id], [login], [uprawnienie], [imie], [nazwisko], [konto], [status] FROM [uzytkownik] WHERE ([uprawnienie] NOT LIKE '%' + @uprawnienie + '%') AND  ([status] LIKE '%' + @status + '%')ORDER BY [id]" DeleteCommand="DELETE FROM uzytkownik WHERE (id = @id)" UpdateCommand="UPDATE uzytkownik SET login = @login, uprawnienie = @uprawnienie, imie = @imie, nazwisko = @nazwisko, konto = @konto, status = @status where id=@id">
                <SelectParameters>
                    <asp:Parameter DefaultValue="admin" Name="uprawnienie" Type="String" />
                    <asp:Parameter DefaultValue="aktywny" Name="status" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>




        <header>
            <h5>Administratorzy</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable3" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable3" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="administratorzySqlDataSource" AllowPaging="True" DataKeyNames="id" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                        <ControlStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="konto" HeaderText="konto" SortExpression="konto">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="uprawnienie" HeaderText="uprawnienie" SortExpression="uprawnienie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                     <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="administratorzySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id], [login], [uprawnienie], [imie], [nazwisko], [konto], [status] FROM [uzytkownik] WHERE ([uprawnienie] LIKE '%' + @uprawnienie + '%') AND ([status] LIKE '%' + @status + '%') ORDER BY [id]" DeleteCommand="DELETE FROM uzytkownik where id=@id" UpdateCommand="UPDATE uzytkownik SET login = @login, uprawnienie = @uprawnienie, imie = @imie, nazwisko = @nazwisko, konto = @konto, status = @status where id=@id">
                <SelectParameters>
                    <asp:Parameter DefaultValue="admin" Name="uprawnienie" Type="String" />
                    <asp:Parameter DefaultValue="aktywny" Name="status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>



        <header>
            <h5>Użytkownicy - zablokowani</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable4" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable4" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="zablokowaniSqlDataSource" AllowPaging="True" DataKeyNames="id" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                        <ControlStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="konto" HeaderText="konto" SortExpression="konto">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="uprawnienie" HeaderText="uprawnienie" SortExpression="uprawnienie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="odblokuj" Text="Odblokuj" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="zablokowaniSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id], [login], [uprawnienie], [imie], [nazwisko], [konto], [status] FROM [uzytkownik] WHERE ([status] LIKE '%' + @status + '%')ORDER BY [id]" DeleteCommand="DELETE FROM uzytkownik WHERE (id = @id)" UpdateCommand="UPDATE uzytkownik SET login = @login, uprawnienie = @uprawnienie, imie = @imie, nazwisko = @nazwisko, konto = @konto, status = @status where id=@id">
                <SelectParameters>
                    <asp:Parameter DefaultValue="zablokowany" Name="status" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
