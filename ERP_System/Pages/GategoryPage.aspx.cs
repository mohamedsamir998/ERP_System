using ERP_System.Pages.DBTablesCode;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System.Pages
{
    public partial class GategoryPage : System.Web.UI.Page
    {
        private static readonly ImageConverter _imageConverter = new ImageConverter();

        ERP_ProjectEntities db = new ERP_ProjectEntities();
        private int CategoryCode = 0;
        byte[] ByteImage;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["ID"] == null)
            {
                Response.Redirect("LoginForm");
            }
            
            GridView();
        }

        public void ShowScript(string sentence)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sentence + "')", true);
        }
        public void GridView()
        {
            var query = from p in db.Categories
                        select new
                        {
                            p.Category_Id,
                            p.Category_Name,
                            p.Created_User_Id,
                            p.Created_Date,
                            p.Last_Modified_User_Id,
                            p.Last_Modified_Date
                        };
            CategoryGridView.DataSource = query.ToList();
            CategoryGridView.DataBind();
        }

        protected void InsertBtn_Click(object sender, EventArgs e)
        {
            try
            {
                CategoryCode = int.Parse(CategoryCodeTextBox.Text);
                if (db.Categories.Count(l => l.Category_Id == CategoryCode) == 1)
                {
                    ShowScript("Thie customer code already exists");
                }
                else
                {
                    if (!ImageUploader.HasFile)
                    {
                        Response.Write("No file Selected"); return;
                    }
                    else
                    {
                        Stream fs = ImageUploader.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs);
                        ByteImage = br.ReadBytes((Int32)fs.Length);
                    }
                    Category category = new Category();
                    category.Category_Id = int.Parse(CategoryCodeTextBox.Text);
                    category.Category_Name = CategoryNameTextBox.Text;
                    category.Created_User_Id = (int)Session["ID"];
                    category.Created_Date = DateTime.Now;
                    category.Category_Image = ByteImage;
                
                    db.Categories.Add(category);
                    db.SaveChanges();
                    
                    Response.Redirect("GategoryPage");
                }
            }
            catch (Exception excep)
            {
                ShowScript("Wrong Format");
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                CategoryCode = int.Parse(CategoryCodeTextBox.Text);
                var categoryData = db.Categories.First(l => l.Category_Id == CategoryCode);
                if (categoryData.Category_Name == CategoryNameTextBox.Text)
                {
                    ShowScript("You didnt edit any field");
                }
                else
                {
                    categoryData.Category_Id = int.Parse(CategoryCodeTextBox.Text);
                    categoryData.Category_Name = CategoryNameTextBox.Text;
                    categoryData.Last_Modified_User_Id = (int)Session["ID"];
                    db.SaveChanges();
                    ShowScript("Edited successfully");
                    GridView();
                }

            }
            catch (Exception excep)
            {
                if (db.Categories.Count(l => l.Category_Id == CategoryCode) == 0)
                {
                    ShowScript("This customer code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                CategoryCode = int.Parse(CategoryCodeTextBox.Text);
                db.Database.Log = Console.WriteLine;
                var category = db.Categories.Where(d => d.Category_Id == CategoryCode).First();
                db.Categories.Remove(category);
                db.SaveChanges();
                ShowScript("Deleted successfully");
                GridView();

            }
            catch (Exception exc)
            {
                if (db.Categories.Count(l => l.Category_Id == CategoryCode) == 0)
                {
                    ShowScript("This customer code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewSelectBtn_Click(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            CategoryCodeTextBox.Text = CategoryGridView.Rows[rowind].Cells[1].Text;
            CategoryNameTextBox.Text = CategoryGridView.Rows[rowind].Cells[2].Text;
            CreatedIDTextBox.Text = CategoryGridView.Rows[rowind].Cells[3].Text;
            CreatedDateTextBox.Text = CategoryGridView.Rows[rowind].Cells[4].Text;
            lastIDTextBox.Text = CategoryGridView.Rows[rowind].Cells[5].Text;
            lastDateTextBox.Text = CategoryGridView.Rows[rowind].Cells[6].Text;
            
            if(lastDateTextBox.Text == "&nbsp;")
            {
                lastDateTextBox.Text = "";
                lastIDTextBox.Text = "";
            }
        }

        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            CategoryCodeTextBox.Text = "";
            CategoryNameTextBox.Text = "";
            CreatedIDTextBox.Text = "";
            CreatedDateTextBox.Text = "";
            lastDateTextBox.Text = "";
            lastIDTextBox.Text = ""; 
        }
    }
}