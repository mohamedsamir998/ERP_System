using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_System.Pages
{
    public partial class ProductsPage : System.Web.UI.Page
    {
        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        private int ProductCode = 0;
        private int unitid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = entities.Products.ToList();
            GridView1.DataBind();
            GridView2.DataSource = entities.Product_Unit.ToList();
            GridView2.DataBind();

        }

        protected void NewProductBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ProductCode = int.Parse(ProductCodeTextBox.Text);

                if (entities.Products.Count(l => l.Product_Code == ProductCode) == 1)
                {
                    ShowScript("This product code already exists");
                }
                else
                {
                    Product product = new Product();
                    product.Product_Code = int.Parse(ProductCodeTextBox.Text);
                    product.Product_Name = ProductNameBox.Text;
                    product.Unit_ID = int.Parse(UnitIdBox.Text);
                    product.Unit_In_Stock = int.Parse(UnitInStockBox.Text);
                    product.Unit_Cost = decimal.Parse(UnitCostBox.Text);
                    product.Unit_Price = decimal.Parse(UnitPriceBox.Text);
                    product.Discount = decimal.Parse(DiscountBox.Text);
                    product.Created_User_ID = (int)Session["ID"];
                    product.Created_Date = DateTime.Now;
                    entities.Products.Add(product);
                    entities.SaveChanges();
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

        protected void EditProductBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ProductCode = int.Parse(ProductCodeTextBox.Text);
                var ProductData = entities.Products.First(l => l.Product_Code == ProductCode);
                if (ProductData.Unit_Cost == decimal.Parse(UnitCostBox.Text) &&
                    ProductData.Unit_Price == decimal.Parse(UnitPriceBox.Text) &&
                    ProductData.Unit_In_Stock == int.Parse(UnitInStockBox.Text) &&
                    ProductData.Discount == decimal.Parse(DiscountBox.Text) &&
                    ProductData.Product_Name == ProductNameBox.Text)
                {
                    ShowScript("You didnt edit any field");
                }
                else
                {
                    ProductData.Product_Name = ProductNameBox.Text;
                    ProductData.Unit_Cost = decimal.Parse(UnitCostBox.Text);
                    ProductData.Unit_Price = decimal.Parse(UnitPriceBox.Text);
                    ProductData.Unit_In_Stock = int.Parse(UnitInStockBox.Text);
                    ProductData.Discount = decimal.Parse(DiscountBox.Text);
                    ProductData.Last_Modified_User_ID = (int)Session["ID"];
                    entities.SaveChanges();
                    ShowScript("Edited successfully");
                }
            }
            catch (Exception excep)
            {
                if (entities.Products.Count(l => l.Product_Code == ProductCode) == 0)
                {
                    ShowScript("This product code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }

        }

        protected void SearchProductBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ProductCode = int.Parse(ProductCodeTextBox.Text);
                var ProductData = entities.Products.First(l => l.Product_Code == ProductCode);
                ProductNameBox.Text = ProductData.Product_Name;
                CreatedonBox.Text = String.Concat(ProductData.Created_Date + "");
                var CreatedBy = entities.Users.First(l => l.User_Id == ProductData.Created_User_ID);
                CreatedbyBox.Text = CreatedBy.User_FullName;

                if (ProductData.Last_Modified_Date == null)
                {
                    LastModifiedbyBox.Text = "";
                    LastModifiedonBox.Text = "";
                }
                else
                {
                    var ModifiedBy = entities.Users.First(l => l.User_Id == ProductData.Last_Modified_User_ID);
                    LastModifiedbyBox.Text = ModifiedBy.User_FullName;
                    LastModifiedonBox.Text = String.Concat(ProductData.Last_Modified_Date + "");
                }

                UnitCostBox.Text = ProductData.Unit_Cost.ToString();
                UnitPriceBox.Text = ProductData.Unit_Price.ToString();
                UnitInStockBox.Text = ProductData.Unit_In_Stock.ToString();
                UnitIdBox.Text = ProductData.Unit_ID.ToString();
                DiscountBox.Text = ProductData.Discount.ToString();



            }
            catch (Exception excep)
            {
                if (entities.Products.Count(l => l.Product_Code == ProductCode) == 0)
                {
                    ShowScript("This Product code doesnt exist");
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
                ProductCode = int.Parse(ProductCodeTextBox.Text);
                entities.Database.Log = Console.WriteLine;
                var dep = entities.Products.Where(d => d.Product_Code == ProductCode).First();
                entities.Products.Remove(dep);
                entities.SaveChanges();
                ShowScript("Deleted successfully");
            }
            catch (Exception exc)
            {
                if (entities.Products.Count(l => l.Product_Code == ProductCode) == 0)
                {
                    ShowScript("This Product code doesnt exist");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }

        }



        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }
        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";

            MainView.ActiveViewIndex = 1;

        }
        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Initial";
            Tab3.CssClass = "Clicked";
            MainView.ActiveViewIndex = 2;
        }

        protected void NewProductUnitBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Product_Unit ProductUnit = new Product_Unit();
                //ProductUnit.Unit_Id = int.Parse(UnitIdTextBox.Text);
                ProductUnit.Unit_Name = UnitNmaeBox.Text;
                ProductUnit.Created_Date = DateTime.Now;
                ProductUnit.Created_User_ID = (int)Session["ID"];
                entities.Product_Unit.Add(ProductUnit);
                entities.SaveChanges();
                ShowScript(" inserted succefully");
            }
            catch (Exception Excep)
            {
                ShowScript("wrong Format");
            }
        }

        protected void EditUnitBtn_Click(object sender, EventArgs e)
        {
            try
            {

                unitid = int.Parse(UnitIdTextBox.Text);

                var unitdata = entities.Product_Unit.First(l => l.Unit_Id == unitid);
                if (unitdata.Unit_Name == UnitNmaeBox.Text)
                {
                    ShowScript("you didnt edit any field ");
                }
                else
                {
                    unitdata.Unit_Name = UnitNmaeBox.Text;
                    unitdata.Last_Modified_Date = DateTime.Now;
                    unitdata.Last_Modified_User_ID = (int)Session["ID"];

                    entities.SaveChanges();
                    ShowScript("edited succfuly");

                }
            }
            catch (Exception excep)
            {
                if (entities.Product_Unit.Count(l => l.Unit_Id == unitid) == 0)
                {
                    ShowScript("this Product unit doesnt exist");

                }
                else
                {
                    ShowScript("wrong format");
                }
            }

        }
        protected void SearchinProductsandProductUnit_Click(object sender, EventArgs e)
        {
            try
            {
                unitid = int.Parse(UnitIdBox.Text);
                var Query = from p in entities.Products
                            where p.Unit_ID == unitid
                            select p;

                var query = from i in entities.Product_Unit
                            where i.Unit_Id == unitid
                            select i;

                GridView1.DataSource = Query.ToList();
                GridView1.DataBind();
                GridView2.DataSource = query.ToList();
                GridView2.DataBind();
                var UnitName = entities.Product_Unit.First(o => o.Unit_Id == unitid);
                Label1.Text = UnitName.Unit_Name;
            }
            catch (Exception excep)
            {
                if ((entities.Product_Unit.Count(l => l.Unit_Id == unitid) == 0))
                {
                    ShowScript("This product Unit not  exist");
                }
                else if ((entities.Products.Count(l => l.Unit_ID == unitid) == 0))
                {
                    ShowScript("This product  not  exist ");
                }
                else
                {
                    ShowScript("Wrong Format");
                }
            }
        }

        protected void DeleteUnitBtn_Click(object sender, EventArgs e)
        {
            try
            {
                unitid = int.Parse(UnitIdTextBox.Text);
                entities.Database.Log = Console.WriteLine;
                var dep = entities.Product_Unit.Where(d => d.Unit_Id == unitid).First();
                entities.Product_Unit.Remove(dep);
                entities.SaveChanges();
                ShowScript("deleted succesfully");



            }
            catch (Exception excep)
            {
                if (entities.Product_Unit.Count(l => l.Unit_Id == unitid) == 0)
                {
                    ShowScript("this Product Unit doesnt exist");
                }
                else
                {
                    ShowScript("wrong Format");
                }
            }
        }
    }
}