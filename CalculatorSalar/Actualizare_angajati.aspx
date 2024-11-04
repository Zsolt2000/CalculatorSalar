<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Actualizare_angajati.aspx.cs" Inherits="Default2"  UnobtrusiveValidationMode="None"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NR_CRT" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="Black" ForeColor="Black" HorizontalAlign="Center"  AutoGenerateSelectButton="True" OnRowCommand="GridView1_RowCommand">
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
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CalculatorSalarConnectionString1 %>" SelectCommand="SELECT [NR_CRT], [NUME], [PRENUME], [FUNCTIE], [SALAR_BAZA], [SPOR], [PREMII_BRUTE], [TOTAL_BRUT], [BRUT_IMPOZABIL], [IMPOZIT], [CAS], [CASS], [RETINERI], [VIRAT_CARD] FROM [Angajati]"></asp:SqlDataSource>
    <br />
    <br />

    <asp:Label ID="lblCautaAngajat" runat="server" Text="Cauta angajatul:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtCautaAngajat" runat="server"></asp:TextBox>
    <asp:Button ID="btnCautaAngajat" runat="server" Text="Cauta angajat"  OnClick="btnCautaAngajat_Click" CausesValidation="false"/>
    <br />
    <br />
    <asp:Label ID="lblNume" runat="server" Text="Nume: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNume" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtNume" CssClass="validator_text"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="lblPrenume" runat="server" Text="Prenume: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtPrenume" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrenume" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtPrenume" CssClass="validator_text"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="lblFunctie" runat="server" Text="Functie: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtFunctie" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorFunctie" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtFunctie" CssClass="validator_text"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="lblSalarBaza" runat="server" Text="Salar baza: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtSalarBaza" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSalarBaza" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtSalarBaza" CssClass="validator_text"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="CompareValidatorSalarBaza" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtSalarBaza" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Label ID="lblSpor" runat="server" Text="Spor: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtSpor" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSpor" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtSpor" CssClass="validator_text"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="CompareValidatorSpor" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtSpor" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Label ID="lblPremiiBrute" runat="server" Text="Premii brute: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtPremiiBrute" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorPremiiBrute" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtPremiiBrute" CssClass="validator_text"></asp:RequiredFieldValidator>
 <asp:CompareValidator ID="CompareValidatorPremiiBrute" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtPremiiBrute" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Label ID="lblRetineri" runat="server" Text="Retineri: " CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtRetineri" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRetineri" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtRetineri" CssClass="validator_text"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="CompareValidatorRetineri" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtRetineri" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />
    <asp:Button ID="btnActualizare" runat="server" Text="Actualizare" OnClick="btnActualizare_Click" />
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="false"/>
    <br />
    <br />

    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label><asp:Label ID="lblAngajatActualizat" runat="server" Text="" ForeColor="Green"></asp:Label>
</asp:Content>

