using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(Database.string_connect);
    SqlCommand cmd;
    SqlDataReader dr;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblAngajatAdaugat.Visible = false;
        float impozit, cas, cass;
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
        catch (Exception ex) { lblErrorMessage.Text = "Nu s-au putut afisa taxele (impozit,CAS,CASS)"; }
        finally { cnn.Close(); }
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand("insert into angajati ([NUME],[PRENUME],[FUNCTIE],[SALAR_BAZA],[SPOR],[PREMII_BRUTE],[RETINERI]) values (@nume,@prenume,@functie,@salar_baza,@spor,@premii_brute,@retineri)", cnn);
            cmd.Parameters.AddWithValue("@nume",txtNume.Text);
            cmd.Parameters.AddWithValue("@prenume",txtPrenume.Text);
            cmd.Parameters.AddWithValue("@functie",txtFunctie.Text);
            cmd.Parameters.AddWithValue("@salar_baza",int.Parse(txtSalarBaza.Text));
            cmd.Parameters.AddWithValue("@spor",int.Parse(txtSpor.Text));
            cmd.Parameters.AddWithValue("@premii_brute",int.Parse(txtPremiiBrute.Text));
            cmd.Parameters.AddWithValue("@retineri",int.Parse(txtRetineri.Text));
            cmd.ExecuteNonQuery();
            lblAngajatAdaugat.Visible = true;

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