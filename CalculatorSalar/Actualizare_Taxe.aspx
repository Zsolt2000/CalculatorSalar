<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Actualizare_Taxe.aspx.cs" Inherits="Default2" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblTaxeCurente" runat="server" CssClass="validator_text"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:Label ID="Label1" runat="server" Text="Impozit" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtImpozitActualizare" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="CompareValidatorImpozit" runat="server" ErrorMessage="Introduceti doar valori intre 0 si 0,9!" ControlToValidate="txtImpozitActualizare" Operator="DataTypeCheck" Type="" CssClass="validator_text" ValidationExpression="[0].[0-9]*"></asp:RegularExpressionValidator>
    <br />
    <br />

    <asp:Label ID="Label2" runat="server" Text="CAS" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtCASActualizare" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="CompareValidatorCAS" runat="server" ErrorMessage="Introduceti doar valori intre 0,1 si 0,9!" ControlToValidate="txtCASActualizare" Operator="DataTypeCheck" Type="Double" CssClass="validator_text" ValidationExpression="[0].[0-9]*"></asp:RegularExpressionValidator>
    <br />
    <br />

    <asp:Label ID="Label3" runat="server" Text="CASS" CssClass="label_spacing"></asp:Label>
    <asp:TextBox ID="txtCASSActualizare" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="CompareValidatorCASS" runat="server" ErrorMessage="Introduceti doar valori intre 0,1 si 0,9!" ControlToValidate="txtCASSActualizare" Operator="DataTypeCheck" Type="Double" CssClass="validator_text" ValidationExpression="[0].[0-9]*"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Button ID="btnActualizareTaxe" runat="server" Text="Actualizare Taxe" OnClick="btnActualizareTaxe_Click" />
    <br />
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>

