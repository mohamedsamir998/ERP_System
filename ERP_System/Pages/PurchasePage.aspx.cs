using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System.Pages
{
    public partial class PurchasePage : System.Web.UI.Page
    {
        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        private int PurchasedId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("LoginForm");
            }

            if (!IsPostBack)
            {
                PurchasedDetailsBtn.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
            }

          
            SupplierIdTB.ReadOnly = true;
            TotalAmountTB.ReadOnly = true;
            //StatusTB.ReadOnly = true;

        }
        Purchase_Master purchase_master = new Purchase_Master();
        protected void NewPurchasedBtn_Click(object sender, EventArgs e)
        {
            try
            {
               
                if (entities.Purchase_Master.Count(l => l.Purchase_Master_Id == PurchasedId) == 1)
                {
                    ShowScript("Thie Purchased id already exists");
                    
                    SupplierIdTB.ReadOnly = false;
                    TotalAmountTB.ReadOnly = false;
                    //StatusTB.ReadOnly = false;
                }
                else
                {


                
                    purchase_master.Supplier_Id = int.Parse(SupplierIdTB.Text);
                    purchase_master.Total_Amount = decimal.Parse(TotalAmountTB.Text);

                    purchase_master.Purchase_Status = checkStatusDropDown(DropDownList1.SelectedValue);

                    purchase_master.Created_User_Id = (int)Session["ID"];
                    purchase_master.Created_Date = DateTime.Now;
                    entities.Purchase_Master.Add(purchase_master);
                    entities.SaveChanges();
                    ShowScript("Inserted successfully");
                    NewPurchasedBtn.Visible = false;
                }
            }
            catch (Exception excep)
            {
                ShowScript("Wrong Format");
               
                SupplierIdTB.ReadOnly = false;
                TotalAmountTB.ReadOnly = false;
                //StatusTB.ReadOnly = false;
            }
        }
        private bool checkStatusDropDown(string status)
        {
            if (status == "active")
            {
                //purchase_master.Purchase_Status = true;
                return true;
            }
            else
            {
                //purchase_master.Purchase_Status = false;
                return false;
            }

        }
        public void ShowScript(string sentence)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sentence + "')", true);

        }

        protected void EditPurchasedBtn_Click(object sender, EventArgs e)
        {
            try
            {
                PurchasedId = int.Parse(PurchasedIdTB.Text);
                var PurchasedData = entities.Purchase_Master.First(l => l.Purchase_Master_Id == PurchasedId);

                if (PurchasedData.Purchase_Master_Id == int.Parse(PurchasedIdTB.Text) &&
                    PurchasedData.Total_Amount == decimal.Parse(TotalAmountTB.Text) &&
                    PurchasedData.Purchase_Status == checkStatusDropDown(DropDownList1.SelectedValue))
                {
                    ShowScript("You did not edit any field");
                }
                else
                {
                    PurchasedData.Purchase_Master_Id = int.Parse(PurchasedIdTB.Text);
                    PurchasedData.Total_Amount = decimal.Parse(TotalAmountTB.Text);
                    PurchasedData.Purchase_Status = checkStatusDropDown(DropDownList1.SelectedValue);

                    PurchasedData.Last_Modified_User_Id = (int)Session["ID"];
                    entities.SaveChanges();
                    ShowScript("Edited successfully");
                    EditPurchasedBtn.Visible = false;

                }

            }
            catch (Exception excep)
            {
                if (entities.Purchase_Master.Count(l => l.Purchase_Master_Id == PurchasedId) == 0)
                {
                    ShowScript("This purchased id does not exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void DeletePurchasedBtn_Click(object sender, EventArgs e)
        {
            try
            {
                PurchasedId = int.Parse(PurchasedIdTB.Text);
                entities.Database.Log = Console.WriteLine;
                var Pur = entities.Purchase_Master.Where(d => d.Purchase_Master_Id == PurchasedId).First();
                entities.Purchase_Master.Remove(Pur);
                entities.SaveChanges();
                ShowScript("Deleted successfully");
                PurchasedIdTB.Text = "";
                SupplierIdTB.Text = "";
                TotalAmountTB.Text = "";

                CreatedDateTB.Text = "";
                CreadtedUserIdTB.Text = "";
                LastModDateTB.Text = "";
                LastModUserIdTB.Text = "";


            }
            catch (Exception exc)
            {
                if (entities.Purchase_Master.Count(l => l.Purchase_Master_Id == PurchasedId) == 0)
                {
                    ShowScript("This vendor code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void SearchPurIdBtn_Click(object sender, EventArgs e)
        {
            try
            {
                PurchasedId = int.Parse(PurchasedIdTB.Text);
                var PurData = entities.Purchase_Master.First(d => d.Purchase_Master_Id == PurchasedId);
               
                SupplierIdTB.Text = PurData.Supplier_Id.ToString();
                TotalAmountTB.Text = PurData.Total_Amount.ToString();

                if (PurData.Purchase_Status == true)
                    DropDownList1.SelectedValue = "Active";
                else
                    DropDownList1.SelectedValue = "InActive";


                var CreatedBy = entities.Users.First(l => l.User_Id == PurData.Created_User_Id);
                CreadtedUserIdTB.Text = CreatedBy.User_FullName;
                CreatedDateTB.Text = PurData.Created_Date.ToString();



                if (PurData.Last_Modified_Date == null)
                {
                    LastModDateTB.Text = "";
                    LastModUserIdTB.Text = "";
                }
                else
                {
                    var ModifiedBy = entities.Users.First(l => l.User_Id == PurData.Last_Modified_User_Id);
                    LastModUserIdTB.Text = ModifiedBy.User_FullName;
                    LastModDateTB.Text = String.Concat(PurData.Last_Modified_Date + "");
                }


               
                SupplierIdTB.ReadOnly = true;
                TotalAmountTB.ReadOnly = true;
                //StatusTB.ReadOnly = true;

            }
            catch (Exception exc)
            {
                if (entities.Purchase_Master.Count(l => l.Purchase_Master_Id == PurchasedId) == 0)
                {
                    ShowScript("Thie purchased id  does not exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }

            }
        }

        protected void NewEditBtn_Click(object sender, EventArgs e)
        {
           
            SupplierIdTB.ReadOnly = true;
            TotalAmountTB.ReadOnly = true;
            //StatusTB.ReadOnly = true;
            EditPurchasedBtn.Visible = true;
        }

        protected void NewInsertBtn_Click(object sender, EventArgs e)
        {
           
            SupplierIdTB.ReadOnly = false;
            TotalAmountTB.ReadOnly = false;
            //StatusTB.ReadOnly = false;

           
            SupplierIdTB.Text = "";
            TotalAmountTB.Text = "";
            //StatusTB.Text = "";
            CreatedDateTB.Text = "";
            CreadtedUserIdTB.Text = "";
            LastModDateTB.Text = "";
            LastModUserIdTB.Text = "";

            NewPurchasedBtn.Visible = true;
        }

        protected void PurchasedDetailsBtn_Click(object sender, EventArgs e)
        {
            PurchasedDetailsBtn.CssClass = "Clicked";
            AddPurProductBtn.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }

        protected void AddPurProductBtn_Click(object sender, EventArgs e)
        {
            PurchasedDetailsBtn.CssClass = "Initial";
            AddPurProductBtn.CssClass = "Clicked";
            MainView.ActiveViewIndex = 1;
        }

        protected void PurchasedIdTB_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        private void ClearData()
        {
            ProductIdTB.Text = "";
            QuantityTB.Text = "";
            UnitPriceTB.Text = "";

        }

        protected void Clear_fields_Click(object sender, EventArgs e)
        {
            ClearData();
        }

        protected void InsertNewProductBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (PurchasedIdTB.Text == "")
                {
                    ShowScript("Cant insert in empty purchased master");
                }
                else
                {
                    Purchase_Details purchaseDetails = new Purchase_Details();
                    purchaseDetails.Purchase_Master_Id = int.Parse(PurchasedIdTB.Text);
                    purchaseDetails.Product_Id = int.Parse(ProductIdTB.Text);
                    purchaseDetails.Quantity = int.Parse(QuantityTB.Text);
                    purchaseDetails.Unit_Price = decimal.Parse(UnitPriceTB.Text);

                    decimal subTotal = decimal.Parse(UnitPriceTB.Text) * decimal.Parse(QuantityTB.Text);
                    purchaseDetails.Sub_Total = subTotal;

                    purchaseDetails.Created_Date = DateTime.Now;
                    purchaseDetails.Created_User_Id = (int)Session["ID"];
                    entities.Purchase_Details.Add(purchaseDetails);

                    entities.SaveChanges();

                    ShowScript("Inserted successfully");
                    GridView1.DataBind();

                }
            }
            catch (Exception excep)
            {
                ShowScript(excep.Message.ToString());
            }
        }
    }
}