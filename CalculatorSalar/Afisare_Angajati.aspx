<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Afisare_Angajati.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" DataKeyNames="NR_CRT" DataSourceID="SqlDataSource1" ForeColor="Black" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="NR_CRT" HeaderText="NR_CRT" InsertVisible="False" ReadOnly="True" SortExpression="NR_CRT" />
                <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                <asp:BoundField DataField="PRENUME" HeaderText="PRENUME" SortExpression="PRENUME" />
                <asp:BoundField DataField="FUNCTIE" HeaderText="FUNCTIE" SortExpression="FUNCTIE" />
                <asp:BoundField DataField="SALAR_BAZA" HeaderText="SALAR_BAZA" SortExpression="SALAR_BAZA" />
                <asp:BoundField DataField="SPOR" HeaderText="SPOR" SortExpression="SPOR" />
                <asp:BoundField DataField="PREMII_BRUTE" HeaderText="PREMII_BRUTE" SortExpression="PREMII_BRUTE" />
                <asp:BoundField DataField="TOTAL_BRUT" HeaderText="TOTAL_BRUT" SortExpression="TOTAL_BRUT" />
                <asp:BoundField DataField="BRUT_IMPOZABIL" HeaderText="BRUT_IMPOZABIL" SortExpression="BRUT_IMPOZABIL" />
                <asp:BoundField DataField="IMPOZIT" HeaderText="IMPOZIT" SortExpression="IMPOZIT" />
                <asp:BoundField DataField="CAS" HeaderText="CAS" SortExpression="CAS" />
                <asp:BoundField DataField="CASS" HeaderText="CASS" SortExpression="CASS" />
                <asp:BoundField DataField="RETINERI" HeaderText="RETINERI" SortExpression="RETINERI" />
                <asp:BoundField DataField="VIRAT_CARD" HeaderText="VIRAT_CARD" SortExpression="VIRAT_CARD" />
            </Columns>
            <FooterStyle BackColor="Black" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CalculatorSalarConnectionString1 %>" SelectCommand="SELECT [NR_CRT], [NUME], [PRENUME], [FUNCTIE], [SALAR_BAZA], [SPOR], [PREMII_BRUTE], [TOTAL_BRUT], [BRUT_IMPOZABIL], [IMPOZIT], [CAS], [CASS], [RETINERI], [VIRAT_CARD] FROM [Angajati]"></asp:SqlDataSource>
    </div>
</asp:Content>

