using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
            GridView1.Columns[15].Visible = false;
        }
        else
        {

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
                adapter.Fill(dt);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
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

            // Check if the checkbox state was stored in ViewState
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
            }
        }

        ViewState["CheckBoxStates"] = checkboxStates;
    }

    protected void checkAngajatCurent_CheckedChanged(object sender, EventArgs e)
    {
        SaveCheckBoxStates();


        //Ascunde coloana de stergere
        bool anyChecked = false;
        if (ViewState["CheckBoxStates"] != null)
        {
            Dictionary<int, bool> checkboxStates = (Dictionary<int, bool>)ViewState["CheckBoxStates"];
            anyChecked = checkboxStates.Values.Contains(true);
        }
        GridView1.Columns[15].Visible = anyChecked;
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        Dictionary<int, bool> checkboxStates = (Dictionary<int, bool>)ViewState["CheckBoxStates"];
        if (e.CommandName == "Stergere")
        {
            if (checkboxStates[rowIndex])
            {
                //Adaugat stergere in DB
                GridView1.Rows[rowIndex].Visible = false;
            }
            else { lblEroare.Text = "Se pot sterge doar angajatii selectati!"; }
        }
    }
}