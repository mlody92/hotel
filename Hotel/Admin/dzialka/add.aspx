<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="Hotel.Admin.hotels.add" %>
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
            Dodaj działkę
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                         <p>Nazwa działki: </p>
                    </td>
                    <td>
                        <p><asp:TextBox ID="nameTextBox" runat="server" Width="127px"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Atrakcyjność: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="atrakcyjnoscDropDownList" runat="server" DataSourceID="atrakcyjnoscSqlDataSource" DataTextField="nazwa" DataValueField="id"></asp:DropDownList>
                           <asp:SqlDataSource ID="atrakcyjnoscSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [atrakcyjnosc]"></asp:SqlDataSource>
                        </p>
                    </td>
                     <td>
                        <asp:Label ID="atrLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                         <p>Cena: </p>
                    </td>
                    <td>
                        <p><asp:TextBox ID="cenaTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="cenaLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                         <p>Rodzaj hotelu: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="hotelDropDownList" runat="server" DataSourceID="hotelSqlDataSource" DataTextField="rodzaj" DataValueField="id"></asp:DropDownList>
                           <asp:SqlDataSource ID="hotelSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [rodzaj_hotelu]"></asp:SqlDataSource>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="rodzajLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                         <p>Województwo: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="wojDropDownList" runat="server" DataSourceID="wojSqlDataSource" DataTextField="nazwa" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                           <asp:SqlDataSource ID="wojSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [wojewodztwo]"></asp:SqlDataSource>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="wojLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                         <p>Miasto: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="miastoDropDownList" runat="server" DataSourceID="miastoSqlDataSource" DataTextField="nazwa" DataValueField="id"></asp:DropDownList>
                           <asp:SqlDataSource ID="miastoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [nazwa], [id], [id_wojewodztwo] FROM [miasto] WHERE ([id_wojewodztwo] = @id_wojewodztwo)">
                               <SelectParameters>
                                    <asp:ControlParameter ControlID="wojDropDownList" DefaultValue="-1" Name="id_wojewodztwo" PropertyName="SelectedValue" Type="Int32" />
                               </SelectParameters>
                            </asp:SqlDataSource>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="miastoLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>

            </table>
            <p><asp:LinkButton ID="addHotelLinkButton" runat="server" OnClick="addHotelLinkButton_Click">Zapisz</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
           </div>
        <div class="panel-footer">
             <p>
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>



</asp:Content>
