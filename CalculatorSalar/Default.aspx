<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center;color:white" >
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/tax-icon.png" Height="160" Width="160" />
        <p style="font-size: 30px"><%: DateTime.Now.ToShortDateString() %> </p>
        <div id="clock" style="font-size: 30px"></div>
    </div>
    <div style="font-size:20px;color:white;padding-left:4em">
        <br /><br /><br /><br />
        <p>Aplicatie de calculare al salariului avand o baza de date de angajati<br />
            Continutul aplicatiei:</p>
        <ul>
            <li><b>Pagina principala:</b><p class="subparagraph_text">Pagina principala contine toate detaliile despre aplicatie</p>
            </li>
            <li><b>Pagina de adaugare angajati:</b><p>In aceasta pagina puteti sa adaugati un angajat nou in baza de date</p></li>
            <li><b>Pagina de afisare angajati</b><p>In aceasta pagina puteti vizualiza angajatii in baza de date</p></li>
            <li><b>Pagina de actualizare taxe</b><p>In aceasta pagina puteti sa actualizati valorile taxelor</p></li>
        </ul>
    </div>












    <script type="text/javascript">
        function updateClock() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();

            hours = hours < 10 ? '0' + hours : hours;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            seconds = seconds < 10 ? '0' + seconds : seconds;

            var timeString = hours + ':' + minutes + ':' + seconds;
            document.getElementById('clock').innerHTML = timeString;
        }

        setInterval(updateClock, 1000);

        updateClock();
    </script>
</asp:Content>

