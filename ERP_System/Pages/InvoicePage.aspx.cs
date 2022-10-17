using ERP_System.Pages.DBTablesCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System.Pages
{
    public partial class InvoicePage : System.Web.UI.Page
    {
        InvoiceDBCode invoiceDBCode = new InvoiceDBCode();
        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        int InvoiceID;
        bool InvoiceStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["ID"] == null)
            {
                Response.Redirect("LoginForm");
            }
            
            if (!IsPostBack)
            {
                GridView1.DataBind();
                InvoiceDetailsTab.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
            }
        }

        protected void InvoiceDetailesTab_Click(object sender, EventArgs e)
        {
            InvoiceDetailsTab.CssClass = "Clicked";
            InvoiceDetailsInfoTab.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }
        protected void InvoiceDetailsInfoTab_Click(object sender, EventArgs e)
        {
            InvoiceDetailsTab.CssClass = "Initial";
            InvoiceDetailsInfoTab.CssClass = "Clicked";
            MainView.ActiveViewIndex = 1;
        }
        protected void InvoiceIDTextBox_TextChanged(object sender, EventArgs e)
        {
            try
            {
                GridView1.DataBind();
            }catch(Exception excep)
            {
                ShowScript("Please enter a valid data");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void InsertBtn_Click(object sender, EventArgs e)
        {
            InsertInTable();
        }
        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            SearchInTable();
        }
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateTable();
        }
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            DeleteFromTable();
        }
        protected void ClearFieldsBtn_Click(object sender, EventArgs e)
        {
            ClearData();
        }
        protected void InViewInsertBtn_Click(object sender, EventArgs e)
        {
            InViewInsert();
        }

        public void ShowScript(string sentence)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sentence + "')", true);

        }
        private void ClearData()
        {
            InvoiceIDTextBox.Text = "";
            CustomerIdTextBox.Text = "";
            TotalAmountTextBox.Text = "";
            StatusDropDown.SelectedIndex = 1;
            CreatedByTextBox.Text = "";
            CreatedOnTextBox.Text = "";
            LastModifiedByTextBox.Text = "";
            LastModifiedOnTextBox.Text = "";
        }
        
        private void UpdateTable()
        {
            try
            {
                InvoiceID = int.Parse(InvoiceIDTextBox.Text);
                if (StatusDropDown.SelectedValue == "active")
                {
                    InvoiceStatus = true;
                }
                else
                {
                    InvoiceStatus = false;
                }

                var InvoiceMaster = entities.Invoice_Master.First(l => l.Invoice_Id == InvoiceID);
                if (InvoiceMaster.Invoice_Status == InvoiceStatus &&
                    InvoiceMaster.Customer_Id == int.Parse(CustomerIdTextBox.Text) &&
                    InvoiceMaster.Total_Amount == decimal.Parse(TotalAmountTextBox.Text)
                    )
                {
                    ShowScript("You didnt edit any field");
                }
                else
                {
                    invoiceDBCode.EditIntoTable(InvoiceID,
                        int.Parse(CustomerIdTextBox.Text),
                        decimal.Parse(TotalAmountTextBox.Text),
                        InvoiceStatus,
                        (int)Session["ID"]
                        );
                    ShowScript("Edited successfully");
                }
            }
            catch (Exception excep)
            {
                if (entities.Invoice_Master.Count(l => l.Invoice_Id == InvoiceID) == 0)
                {
                    ShowScript("This customer code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }
        private void SearchInTable()
        {
            try
            {
                InvoiceID = int.Parse(InvoiceIDTextBox.Text);
                var InvoiceMasterData = entities.Invoice_Master.First(l => l.Invoice_Id == InvoiceID);
                if (InvoiceMasterData.Customer_Id == null)
                {
                    CustomerIdTextBox.Text = "";
                }
                else
                {
                    CustomerIdTextBox.Text = InvoiceMasterData.Customer_Id.ToString();
                }
                CreatedOnTextBox.Text = String.Concat(InvoiceMasterData.Created_Date + "");
                var CreatedBy = entities.Users.First(l => l.User_Id == InvoiceMasterData.Created_User_Id);
                CreatedByTextBox.Text = CreatedBy.User_FullName;
                TotalAmountTextBox.Text = InvoiceMasterData.Total_Amount.ToString();
                if (InvoiceMasterData.Invoice_Status == true)
                {
                    StatusDropDown.SelectedValue = "active";
                }
                else
                {
                    StatusDropDown.SelectedValue = "inactive";
                }

                if (InvoiceMasterData.Last_Modified_Date == null)
                {
                    LastModifiedByTextBox.Text = "";
                    LastModifiedOnTextBox.Text = "";
                }
                else
                {
                    var ModifiedBy = entities.Users.First(l => l.User_Id == InvoiceMasterData.Last_Modified_User_Id);
                    LastModifiedByTextBox.Text = ModifiedBy.User_FullName;
                    LastModifiedOnTextBox.Text = String.Concat(InvoiceMasterData.Last_Modified_Date + "");
                }

            }
            catch (Exception exc)
            {
                if (entities.Invoice_Master.Count(l => l.Invoice_Id == InvoiceID) == 0)
                {
                    ShowScript("This Invoice ID doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }
        private void InsertInTable()
        {
            try
            {
                invoiceDBCode.InsertIntoTable(CustomerIdTextBox.Text,
                    TotalAmountTextBox.Text,
                    StatusDropDown.SelectedValue,
                    (int)Session["ID"]);

                ClearData();
                ShowScript("Inserted Successfully");
            }
            catch (Exception excep)
            {
                ShowScript(excep.Message.ToString());
            }
        }
        private void DeleteFromTable()
        {
            try
            {
                InvoiceID = int.Parse(InvoiceIDTextBox.Text);
                invoiceDBCode.DeleteFromTable(InvoiceID);
                ClearData();
                ShowScript("Deleted successfully");
            }
            catch (Exception exc)
            {
                if (entities.Invoice_Master.Count(l => l.Invoice_Id == InvoiceID) == 0)
                {
                    ShowScript("This Invoice ID doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        private void InViewInsert()
        {
            try
            {
                int productId = int.Parse(ProductIdTextBox.Text);
                var products = entities.Products.First(l => l.Product_ID ==  productId);
                if (InvoiceIDTextBox.Text == "")
                {
                    ShowScript("Cant insert in empty Invoice");
                }else if ( int.Parse(QuantityTextBox.Text) > products.Unit_In_Stock)
                {
                    if (products.Unit_In_Stock == 0)
                    {
                        ShowScript(String.Concat("There is no units left for this product"));
                    }
                    else if (products.Unit_In_Stock == 1)
                    {
                        ShowScript(String.Concat("There is only " + products.Unit_In_Stock + " units left for this product"));
                    }
                    else
                    {
                        ShowScript(String.Concat("There are only " + products.Unit_In_Stock + " units left for this product"));
                    }
                }
                else
                {
                    decimal SubTotal;
                    SubTotal = int.Parse(QuantityTextBox.Text) * decimal.Parse(UnitPriceTextBox.Text);
                    invoiceDBCode.InViewInsertIntoTable(InvoiceIDTextBox.Text,
                        ProductIdTextBox.Text,
                        QuantityTextBox.Text,
                        UnitPriceTextBox.Text,
                        SubTotal,
                        (int)Session["ID"]);
                    ClearData();
                    ShowScript("Inserted Successfully");
                }
            }
            catch (Exception excep)
            {
                ShowScript(excep.Message.ToString());
            }
        }

        protected void InViewClearFieldsBtn_Click(object sender, EventArgs e)
        {
            ProductIdTextBox.Text = "";
            QuantityTextBox.Text = "";
            UnitPriceTextBox.Text = "";
        }

    }
}