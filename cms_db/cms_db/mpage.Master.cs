using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;

namespace cms_db
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Tobtob
            SqlConnection conn = new SqlConnection(@"data source = DESKTOP-6CQP77U;  integrated security = true; database = cms_db");
            try
            {
                  conn.Open();
                  SqlCommand cmd = new SqlCommand("SELECT header_title, header_logo FROM site_header, site_structure WHERE structure_id = 1", conn);
                  SqlDataReader rdr = cmd.ExecuteReader();
                  rdr.Read();
                  ImageLogo.ImageUrl = "~/pictures/" + rdr["header_logo"].ToString();
                  LabelTitle.Text = rdr["header_title"].ToString();

            }
            catch (Exception ex)
            {
               // LabelMessage.Text = ex.Message;
            }
            finally
            {
                 conn.Close();
            }

            //Tobtob
            SqlConnection conn2 = new SqlConnection(@"data source = DESKTOP-6CQP77U;  integrated security = true; database = cms_db");
            try
            {
                conn2.Open();
                SqlCommand cmd = new SqlCommand("SELECT footer_description FROM site_footer, site_structure WHERE structure_id = 1", conn2);
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();

                Labeldesc.Text = rdr["footer_description"].ToString();

            }
            catch (Exception ex)
            {
                // labelmessage.Text = ex.Message;
            }
            finally
            {
                conn2.Close();
            }
        }

    }
}