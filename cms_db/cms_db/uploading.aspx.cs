using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

namespace cms_db
{
    public partial class uploading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadThisFile(FileUpload upload)
        {
            if (upload.HasFile)
            {
                string theFileName = Path.Combine(Server.MapPath("~/pictures"), upload.FileName);
                if (File.Exists(theFileName))
                {
                    File.Delete(theFileName);
                }
                upload.SaveAs(theFileName);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          UploadThisFile(FileUpload1);
        }
    }
}