using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(Database.string_connect);
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("select IMPOZIT,CAS,CASS from taxe where id=1", cnn);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        txtImpozitActualizare.Text = dr["IMPOZIT"].ToString();
                        txtCASActualizare.Text = dr["CAS"].ToString();
                        txtCASSActualizare.Text = dr["CASS"].ToString();
                    }
                    dr.Close();

                }
            }
            catch (Exception ex) { lblErrorMessage.Text = "Nu s-au putut afisa taxele (impozit,CAS,CASS)"; }
            finally { cnn.Close(); }
        }
        Autentificare.Visible = false;
    }

    protected void btnActualizareTaxe_Click(object sender, EventArgs e)
    {
        Autentificare.Visible = true;
    }

    protected void btnAuth_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text.Equals("admin") && txtPassword.Text.Equals("admin"))
        {
            try
            {
                cnn.Open();
                cmd = new SqlCommand("update taxe set impozit=@impozit, cas=@cas,cass=@cass where id=1", cnn);
                cmd.Parameters.AddWithValue("@impozit", float.Parse(txtImpozitActualizare.Text));
                cmd.Parameters.AddWithValue("@cas", float.Parse(txtCASActualizare.Text));
                cmd.Parameters.AddWithValue("@cass", float.Parse(txtCASSActualizare.Text));
                cmd.ExecuteNonQuery();
                lblTaxeActualizate.Text = "Taxele au fost actualizate";
            }
            catch (Exception ex) { lblErrorMessage.Text = "Eroare la actualizare taxelor"; }
            finally { cnn.Close(); Autentificare.Visible = false; }
        }
        else
        {
            lblErrorMessage.Text = "Eroare la autentificare pentru modificarea taxelor";
        }
    }
}
