using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Font = iTextSharp.text.Font;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(Database.string_connect);
    SqlCommand cmd;
    SqlDataReader dr;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.Columns[15].Visible = false;
            GridView1.Columns[16].Visible = false;
        }
    }
    protected void btnCautaAngajat_Click(object sender, EventArgs e)
    {
        if (txtCautaAngajat.Text == String.Empty)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
        else
        {
            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("select nr_crt,nume,prenume,functie,salar_baza,spor,premii_brute,total_brut,brut_impozabil,impozit,cas,cass,retineri,virat_card from angajati where nume=@nume or prenume=@prenume", cnn);
                cmd.Parameters.AddWithValue("@nume", txtCautaAngajat.Text.Trim());
                cmd.Parameters.AddWithValue("@prenume", txtCautaAngajat.Text.Trim());
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                if (adapter.Fill(dt) != 0)
                {
                    GridView1.DataSourceID = null;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                    lblEroare.Text = "Nu s-a gasit angajatul cu numele:" + txtCautaAngajat.Text;
            }
            catch (Exception ex) { }
            finally { cnn.Close(); }
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chk = (CheckBox)e.Row.FindControl("checkAngajatCurent");
            if (ViewState["CheckBoxStates"] != null)
            {
                Dictionary<int, bool> checkboxStates = (Dictionary<int, bool>)ViewState["CheckBoxStates"];
                int rowIndex = e.Row.RowIndex;
                if (checkboxStates.ContainsKey(rowIndex))
                {
                    chk.Checked = checkboxStates[rowIndex];
                }
            }
        }
    }

    protected void SaveCheckBoxStates()
    {
        Dictionary<int, bool> checkboxStates = new Dictionary<int, bool>();

        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chk = (CheckBox)row.FindControl("checkAngajatCurent");
                checkboxStates[row.RowIndex] = chk.Checked;
                GridView1.Columns[15].Visible = true;
                GridView1.Columns[16].Visible = true;
            }
        }

        ViewState["CheckBoxStates"] = checkboxStates;
    }

    protected void checkAngajatCurent_CheckedChanged(object sender, EventArgs e)
    {
        SaveCheckBoxStates();

        bool anyChecked = false;
        if (ViewState["CheckBoxStates"] != null)
        {
            Dictionary<int, bool> checkboxStates = (Dictionary<int, bool>)ViewState["CheckBoxStates"];
            anyChecked = checkboxStates.Values.Contains(true);
        }
        GridView1.Columns[15].Visible = anyChecked;
        GridView1.Columns[16].Visible = anyChecked;
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        Dictionary<int, bool> checkboxStates = (Dictionary<int, bool>)ViewState["CheckBoxStates"];
        if (e.CommandName == "Stergere")
        {
            if (checkboxStates[rowIndex])
            {
                DeleteFromDB(rowIndex);
            }
            else { lblEroare.Text = "Se pot sterge doar angajatii selectati!"; }
        }
        if (e.CommandName == "Raport")
        {
            GeneratePDFForEmployee(Convert.ToInt32(e.CommandArgument));
        }
    }

    private void GeneratePDFForEmployee(int rowIndex)
    {

        GridViewRow selectedRow = GridView1.Rows[rowIndex];
        Document pdfDocument = new Document(PageSize.A3, 20f, 20f, 20f, 20f);
        MemoryStream memoryStream = new MemoryStream();
        PdfWriter.GetInstance(pdfDocument, memoryStream);
        pdfDocument.Open();
        Paragraph title = new Paragraph("Fluturas de plata angajat " + selectedRow.Cells[2].Text + " " + selectedRow.Cells[3].Text, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
        pdfDocument.Add(title);
        pdfDocument.Add(new Paragraph("\n"));
        PdfPTable pdfTable = new PdfPTable(selectedRow.Cells.Count - 3);
        int numberOfValidHeaders = 15;
        for (int i = 2; i < numberOfValidHeaders; i++)
        {
            Paragraph pg = new Paragraph(GridView1.HeaderRow.Cells[i].Text + ": " + selectedRow.Cells[i].Text);
            pdfDocument.Add(pg);
        }
        pdfDocument.Close();
        Response.ContentType = "application/pdf";
        Response.AppendHeader("content-disposition", "attachment;filename=fluturas_angajat_" + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + ".pdf");
        Response.OutputStream.Write(memoryStream.GetBuffer(), 0, memoryStream.GetBuffer().Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();
        Response.End();
    }

    protected void DeleteFromDB(int index)
    {
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("delete from angajati where nr_crt=@nr_crt", cnn);
            cmd.Parameters.AddWithValue("@nr_crt", Convert.ToInt32(GridView1.Rows[index].Cells[1].Text));
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            lblEroare.Text = "Angajatul a fost sters";
        }
        catch (Exception ex)
        {
            lblEroare.Text = "Eroare la stergerea angajatului";
        }
        finally { cnn.Close(); }
    }

    protected void btnGenerareStatDePlata_Click(object sender, EventArgs e)
    {

        int numberOfValidHeaders = 15;
        Dictionary<string, int> sumsOfValues = new Dictionary<string, int>();
        Document pdfDocument = new Document(PageSize.A2, 20f, 20f, 20f, 20f);
        PdfPTable pdfTable = new PdfPTable(numberOfValidHeaders - 2);
        PdfWriter.GetInstance(pdfDocument, Response.OutputStream);
        pdfDocument.Open();
        Paragraph title = new Paragraph("Stat de plata angajati", new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
        pdfDocument.Add(title);
        pdfDocument.Add(new Paragraph("\n"));

        for (int i = 2; i < numberOfValidHeaders; i++)
        {
            PdfPCell pdfCell = new PdfPCell(new Phrase(GridView1.HeaderRow.Cells[i].Text, new Font(Font.FontFamily.HELVETICA, 10f, Font.BOLD)));
            pdfTable.AddCell(pdfCell);
        }
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            for (int j = 2; j < numberOfValidHeaders; j++)
            {
                PdfPCell pdfCell = new PdfPCell(new Phrase(GridView1.Rows[i].Cells[j].Text));
                pdfTable.AddCell(pdfCell);
            }

        }
        pdfDocument.Add(pdfTable);
        pdfDocument.Add(new Paragraph("\n\n\n"));
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("select sum(SALAR_BAZA) as 'sumaSalarBaza',sum(PREMII_BRUTE) as 'sumaPremiiBrute',sum(TOTAL_BRUT) as 'sumaTotalBrut',sum(BRUT_IMPOZABIL) as 'sumaBrutImpozabil',sum(IMPOZIT) as 'sumaImpozit',sum(CAS) as 'sumaCAS',sum(CASS) as 'sumaCASS',sum(RETINERI) as 'sumaRetineri',sum(VIRAT_CARD) as 'sumaViratCard' from angajati", cnn);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    sumsOfValues.Add("Suma Salar Baza: ", Convert.ToInt32(dr["sumaSalarBaza"]));
                    sumsOfValues.Add("Suma Premii Brute: ", Convert.ToInt32(dr["sumaPremiiBrute"]));
                    sumsOfValues.Add("Suma Total Brut: ", Convert.ToInt32(dr["sumaTotalBrut"]));
                    sumsOfValues.Add("Suma Brut Impozabil: ", Convert.ToInt32(dr["sumaBrutImpozabil"]));
                    sumsOfValues.Add("Suma Impozit: ", Convert.ToInt32(dr["sumaImpozit"]));
                    sumsOfValues.Add("Suma CAS: ", Convert.ToInt32(dr["sumaCAS"]));
                    sumsOfValues.Add("Suma CASS: ", Convert.ToInt32(dr["sumaCASS"]));
                    sumsOfValues.Add("Suma Retineri: ", Convert.ToInt32(dr["sumaRetineri"]));
                    sumsOfValues.Add("Suma Virat Card: ", Convert.ToInt32(dr["sumaViratCard"]));
                }
            }
        }
        catch
        {
            lblEroare.Text = "Eroare la accesarea bazei de date";
        }
        finally
        {
            cnn.Close();
        }
        foreach (var item in sumsOfValues)
        {
            Paragraph pg = new Paragraph(item.Key + item.Value);
            pdfDocument.Add(pg);
        }

        pdfDocument.Close();

        Response.ContentType = "application/pdf";
        Response.AppendHeader("content-disposition", "attachment;filename=stat_de_plata_angajati_" + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + ".pdf");
        Response.Write(pdfDocument);
        Response.Flush();
        Response.End();
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Afisare_Angajati.aspx");
    }
}
