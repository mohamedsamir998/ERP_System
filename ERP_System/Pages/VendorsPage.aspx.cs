using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System.Pages
{
    public partial class VendorsPage : System.Web.UI.Page
    {

        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        private int VendorCode = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("LoginForm");
            }
            VendorCodeTB0.ReadOnly = true;
            VendorNameTB.ReadOnly = true;
            VendorEmailTB.ReadOnly = true;
            VendorContactTB.ReadOnly = true;
            VendorAddressTB.ReadOnly = true;
        }

        protected void NewVendorBtn_Click(object sender, EventArgs e)
        {
            try
            {
                VendorCode = int.Parse(VendorCodeTB0.Text);
                if (entities.Suppliers.Count(l => l.Supplier_Code == VendorCode) == 1)
                {
                    ShowScript("Thie vendor code already exists");
                    VendorCodeTB0.ReadOnly = false;
                    VendorNameTB.ReadOnly = false;
                    VendorEmailTB.ReadOnly = false;
                    VendorContactTB.ReadOnly = false;
                    VendorAddressTB.ReadOnly = false;
                    //EditVendorBtn.Visible = true;
                }
                else
                {
                    Supplier supplier = new Supplier();
                    supplier.Supplier_Code = int.Parse(VendorCodeTB0.Text);
                    supplier.Supplier_Name = VendorNameTB.Text;
                    supplier.Email = VendorEmailTB.Text;
                    supplier.Supplier_Contact = VendorContactTB.Text;
                    supplier.Supplier_Address = VendorAddressTB.Text;
                    supplier.Created_User_Id = (int)Session["ID"];
                    supplier.Created_date = DateTime.Now;
                    entities.Suppliers.Add(supplier);
                    entities.SaveChanges();
                    ShowScript("Inserted successfully");
                    NewVendorBtn.Visible = false;
                }
            }
            catch (Exception excep)
            {
                ShowScript("Wrong Format");
            }
        }


        public void ShowScript(string sentence)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sentence + "')", true);

        }

        protected void EditVendorBtn_Click(object sender, EventArgs e)
        {
            try
            {
                VendorCode = int.Parse(VendorCodeTB.Text);
                var VendorData = entities.Suppliers.First(l => l.Supplier_Code == VendorCode);
                if (VendorData.Supplier_Contact == VendorCodeTB.Text &&
                    VendorData.Supplier_Address == VendorAddressTB.Text &&
                    VendorData.Supplier_Name == VendorNameTB.Text &&
                    VendorData.Email == VendorEmailTB.Text)
                {
                    ShowScript("You didnt edit any field");
                }
                else
                {
                    VendorData.Supplier_Name = VendorNameTB.Text;
                    VendorData.Email = VendorEmailTB.Text;
                    VendorData.Supplier_Contact = VendorContactTB.Text;
                    VendorData.Supplier_Address = VendorAddressTB.Text;
                    VendorData.Last_Modified_User_Id = (int)Session["ID"];
                    entities.SaveChanges();
                    ShowScript("Edited successfully");
                    EditVendorBtn.Visible = false;
                }

            }
            catch (Exception excep)
            {
                if (entities.Suppliers.Count(l => l.Supplier_Code == VendorCode) == 0)
                {
                    ShowScript("This vendor code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void DeleteVendorBtn_Click(object sender, EventArgs e)
        {
            try
            {
                VendorCode = int.Parse(VendorCodeTB.Text);
                entities.Database.Log = Console.WriteLine;
                var dep = entities.Suppliers.Where(d => d.Supplier_Code == VendorCode).First();
                entities.Suppliers.Remove(dep);
                entities.SaveChanges();
                ShowScript("Deleted successfully");
                VendorAddressTB.Text = "";
                VendorCodeTB0.Text = "";
                VendorContactTB.Text = "";
                VendorNameTB.Text = "";
                VendorEmailTB.Text = "";
                LastModByTB.Text = "";
                LastModOnTB.Text = "";
                CreatedByTB.Text = "";
                CreatedOnTB.Text = "";

            }
            catch (Exception exc)
            {
                if (entities.Suppliers.Count(l => l.Supplier_Code == VendorCode) == 0)
                {
                    ShowScript("This vendor code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void SearchCoodeBtn_Click(object sender, EventArgs e)
        {
            try
            {
                VendorCode = int.Parse(VendorCodeTB.Text);
                var VendorData = entities.Suppliers.First(l => l.Supplier_Code == VendorCode);
                VendorCodeTB0.Text = VendorCodeTB.Text;
                VendorNameTB.Text = VendorData.Supplier_Name;
                VendorEmailTB.Text = VendorData.Email;
                CreatedOnTB.Text = String.Concat(VendorData.Created_date + "");
                var CreatedBy = entities.Users.First(l => l.User_Id == VendorData.Created_User_Id);
                CreatedByTB.Text = CreatedBy.User_FullName;
                //StatusTextBox.Text = "Active";
                VendorContactTB.Text = VendorData.Supplier_Contact;
                VendorAddressTB.Text = VendorData.Supplier_Address;

                if (VendorData.Last_Modified_Date == null)
                {
                    LastModByTB.Text = "";
                    LastModOnTB.Text = "";
                }
                else
                {
                    var ModifiedBy = entities.Users.First(l => l.User_Id == VendorData.Last_Modified_User_Id);
                    LastModByTB.Text = ModifiedBy.User_FullName;
                    LastModOnTB.Text = String.Concat(VendorData.Last_Modified_Date + "");
                }


                VendorCodeTB0.ReadOnly = true;
                VendorNameTB.ReadOnly = true;
                VendorEmailTB.ReadOnly = true;
                VendorContactTB.ReadOnly = true;
                VendorAddressTB.ReadOnly = true;

            }
            catch (Exception exc)
            {
                if (entities.Suppliers.Count(l => l.Supplier_Code == VendorCode) == 0)
                {
                    ShowScript("Thie vendor code doesnt exists");
                }
                else
                {
                    ShowScript("Wrong Format");
                }

            }
        }

        protected void NewEditBtn_Click(object sender, EventArgs e)
        {
            //VendorCodeTB0.ReadOnly = false;
            VendorNameTB.ReadOnly = false;
            VendorEmailTB.ReadOnly = false;
            VendorContactTB.ReadOnly = false;
            VendorAddressTB.ReadOnly = false;
            EditVendorBtn.Visible = true;

        }

        protected void NewInsertBtn_Click(object sender, EventArgs e)
        {
            VendorCodeTB0.ReadOnly = false;
            VendorNameTB.ReadOnly = false;
            VendorEmailTB.ReadOnly = false;
            VendorContactTB.ReadOnly = false;
            VendorAddressTB.ReadOnly = false;
            VendorAddressTB.Text = "";
            VendorCodeTB0.Text = "";
            VendorContactTB.Text = "";
            VendorNameTB.Text = "";
            VendorEmailTB.Text = "";
            LastModByTB.Text = "";
            LastModOnTB.Text = "";
            CreatedByTB.Text = "";
            CreatedOnTB.Text = "";
            NewVendorBtn.Visible = true;
        }
    }
}