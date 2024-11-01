using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(Database.string_connect);
    SqlCommand cmd;
    SqlDataReader dr;
    int nr_crt;

    protected void Page_Load(object sender, EventArgs e)
    {

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
                    lblError.Text = "Nu s-a gasit angajatul cu numele:" + txtCautaAngajat.Text;
            }
            catch (Exception ex) { }
            finally { cnn.Close(); }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName =="Select")
        {
            int rowIndex=Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow= GridView1.Rows[rowIndex];
            txtNume.Text= selectedRow.Cells[2].Text;
            txtPrenume.Text= selectedRow.Cells[3].Text;
            txtFunctie.Text= selectedRow.Cells[4].Text;
            txtSalarBaza.Text= selectedRow.Cells[5].Text;
            txtSpor.Text= selectedRow.Cells[6].Text;
            txtPremiiBrute.Text= selectedRow.Cells[7].Text;
            txtRetineri.Text= selectedRow.Cells[13].Text;
            Session["nr_crt"]=Convert.ToInt32(selectedRow.Cells[1].Text);
        }

    }

    protected void btnActualizare_Click(object sender, EventArgs e)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand("update angajati set nume=@nume, prenume=@prenume,functie=@functie,salar_baza=@salarbaza,spor=@spor,premii_brute=@premiibrute,retineri=@retineri where nr_crt=" + Session["nr_crt"], cnn);
            cmd.Parameters.AddWithValue("@nume", txtNume.Text);
            cmd.Parameters.AddWithValue("@prenume", txtPrenume.Text);
            cmd.Parameters.AddWithValue("@functie", txtFunctie.Text);
            cmd.Parameters.AddWithValue("@salarbaza", Convert.ToInt32(txtSalarBaza.Text));
            cmd.Parameters.AddWithValue("@spor", Convert.ToInt32(txtSpor.Text));
            cmd.Parameters.AddWithValue("@premiibrute", Convert.ToInt32(txtPremiiBrute.Text));
            cmd.Parameters.AddWithValue("@retineri", Convert.ToInt32(txtRetineri.Text));
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            lblAngajatActualizat.Text = "Angajatul a fost actualizat!";
        }
        catch (Exception ex) { lblError.Text = "Eroare la actualizare taxelor"; }
        finally { cnn.Close(); }
    }
}