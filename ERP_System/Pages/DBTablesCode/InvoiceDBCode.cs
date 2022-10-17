using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ERP_System.Pages.DBTablesCode
{
    public class InvoiceDBCode
    {
        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        int InvoiceID;

        public void InsertIntoTable(string CustomerID, string TotalAmount, string status, int SessionID)
        {
            Invoice_Master invoice = new Invoice_Master();

            invoice.Customer_Id = int.Parse(CustomerID);
            invoice.Total_Amount = decimal.Parse(TotalAmount);
            if(status == "active")
            {
                invoice.Invoice_Status = true;
            }
            else
            {
                invoice.Invoice_Status = false;
            }
            invoice.Created_User_Id = SessionID;
            invoice.Created_Date = DateTime.Now;
            entities.Invoice_Master.Add(invoice);
            entities.SaveChanges();
        }

        public void EditIntoTable(int InvoiceID, int CustomerID, decimal TotalAmount, bool Status, int SessionID)
        {
            var InvoiceMasterData = entities.Invoice_Master.First(l => l.Invoice_Id == InvoiceID);

            InvoiceMasterData.Customer_Id = CustomerID;
            InvoiceMasterData.Total_Amount = TotalAmount;
            InvoiceMasterData.Invoice_Status = Status;
            InvoiceMasterData.Last_Modified_User_Id = SessionID;
            InvoiceMasterData.Last_Modified_Date = DateTime.Now;
            entities.SaveChanges();
        }

        public void DeleteFromTable(int InvoiceID)
        {
            this.InvoiceID = InvoiceID;
            entities.Database.Log = Console.WriteLine;
            var Invoice = entities.Invoice_Master.Where(d => d.Invoice_Id == this.InvoiceID).First();
            entities.Invoice_Master.Remove(Invoice);
            entities.SaveChanges();
        }

        public void InViewInsertIntoTable(string InvoiceId, string ProductId, string Quantity, string UnitPrice, decimal SubTotal, int SessionId)
        {
            Invoice_Details invoice = new Invoice_Details();

            invoice.Invoice_Id = int.Parse(InvoiceId);
            invoice.Product_Id = int.Parse(ProductId);
            invoice.Quantity = int.Parse(Quantity);
            invoice.Unit_Price = decimal.Parse(UnitPrice);
            invoice.Sub_Total = SubTotal;
            invoice.Created_Date = DateTime.Now;
            invoice.Created_User_Id = SessionId;

            entities.Invoice_Details.Add(invoice);
            entities.SaveChanges();
        }

    }
}