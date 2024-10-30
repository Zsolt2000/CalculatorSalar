using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(Database.string_connect);
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("select taxe.IMPOZIT,taxe.CAS,taxe.CASS from taxe where id=1", cnn);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    txtImpozit.Text = dr["IMPOZIT"].ToString();
                    txtCAS.Text = dr["CAS"].ToString();
                    txtCASS.Text = dr["CASS"].ToString();
                }
                dr.Close();

            }
        }
        catch (Exception ex) { lblErrorMessage.Text = "Nu s-au putut afisa taxele (impozit,CAS,CASS)";lblErrorMessage.ForeColor = Color.Red; }
        finally { cnn.Close(); }
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand("insert into angajati ([NUME],[PRENUME],[FUNCTIE],[SALAR_BAZA],[SPOR],[PREMII_BRUTE],[RETINERI],[TAXA_ID]) values (@nume,@prenume,@functie,@salar_baza,@spor,@premii_brute,@retineri,1)", cnn);
            cmd.Parameters.AddWithValue("@nume",txtNume.Text);
            cmd.Parameters.AddWithValue("@prenume",txtPrenume.Text);
            cmd.Parameters.AddWithValue("@functie",txtFunctie.Text);
            cmd.Parameters.AddWithValue("@salar_baza",int.Parse(txtSalarBaza.Text));
            cmd.Parameters.AddWithValue("@spor",int.Parse(txtSpor.Text));
            cmd.Parameters.AddWithValue("@premii_brute",int.Parse(txtPremiiBrute.Text));
            cmd.Parameters.AddWithValue("@retineri",int.Parse(txtRetineri.Text));
            cmd.ExecuteNonQuery();
            lblAngajatAdaugat.Visible = true;
            lblAngajatAdaugat.Text = "Angajatul " + txtNume.Text + " " + txtPrenume.Text + " a fost adaugat cu succes!";
            lblAngajatAdaugat.ForeColor = Color.Green;

        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "Eroare la adaugarea angajatului!";
        }
        finally
        {
            cnn.Close();
        }
    }
}