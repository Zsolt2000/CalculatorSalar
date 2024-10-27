<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Adaugare_Angajati.aspx.cs" Inherits="Default3" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="text-align: center; color: white; font-size: 30px">Adaugare angajati</p>

    <asp:Label ID="Label1" runat="server" Text="Nume:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNume" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtNume" CssClass="validator_text"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="Label2" runat="server" Text="Prenume:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtPrenume" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrenume" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtPrenume" CssClass="validator_text"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="Label3" runat="server" Text="Functie:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtFunctie" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFunctie" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtFunctie" CssClass="validator_text" ></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="Label4" runat="server" Text="Salar Baza:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtSalarBaza" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSalarBaza" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtSalarBaza" CssClass="validator_text"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidatorSalarBaza" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtSalarBaza" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Label ID="Label5" runat="server" Text="Spor:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtSpor" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSpor" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtSpor" CssClass="validator_text"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidatorSpor" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtSpor" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Label ID="Label6" runat="server" Text="Premii Brute:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtPremiiBrute" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPremiiBrute" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtPremiiBrute" CssClass="validator_text"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidatorPremiiBrute" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtPremiiBrute" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Label ID="Label7" runat="server" Text="Impozit(10%):" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtImpozit" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
    <br />
    <br />

    <asp:Label ID="Label8" runat="server" Text="CAS (25%):" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtCAS" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
    <br />
    <br />

    <asp:Label ID="Label9" runat="server" Text="CASS (10%):" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtCASS" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
    <br />
    <br />

    <asp:Label ID="Label10" runat="server" Text="Retineri:" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtRetineri" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRetineri" runat="server" ErrorMessage="Nu lasati campul gol!" ControlToValidate="txtRetineri" CssClass="validator_text"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidatorRetineri" runat="server" ErrorMessage="Introduceti doar valori intregi!" ControlToValidate="txtRetineri" Operator="DataTypeCheck" Type="Integer" CssClass="validator_text"></asp:CompareValidator>
    <br />
    <br />

    <asp:Button ID="btnAdaugaAngajat" runat="server" Text="Adauga angajat" OnClick="Button1_Click" />
    <asp:Label ID="lblAngajatAdaugat" runat="server" CssClass="label_spacing"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>





</asp:Content>

