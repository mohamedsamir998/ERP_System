using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ERP_System.Pages.DBTablesCode
{
    public class CustomersDBCode
    {
        ERP_ProjectEntities entities = new ERP_ProjectEntities();
        private int CustomerCode = 0;

        public void InsertIntoTable(string CustomerCode, string CustomerName, string CustomerContact, string CustomerAddress, int SessionID )
        {
            Customer customer = new Customer();
            customer.Customer_Code = int.Parse(CustomerCode);
            customer.Customer_Name = CustomerName;
            customer.Customer_Contact = CustomerContact;
            customer.Address = CustomerAddress;
            customer.Created_User_Id = SessionID;
            customer.Created_Date = DateTime.Now;
            entities.Customers.Add(customer);
            entities.SaveChanges();     
        }

        public void EditIntoTable(string CustomerCode, string CustomerName, string CustomerContact, string CustomerAddress, int SessionID)
        {
            this.CustomerCode = int.Parse(CustomerCode);
            var CustomerData = entities.Customers.First(l => l.Customer_Code == this.CustomerCode);
            
            CustomerData.Customer_Name = CustomerName;
            CustomerData.Customer_Contact = CustomerContact;
            CustomerData.Address = CustomerAddress;
            CustomerData.Last_Modified_User_id = SessionID;
            entities.SaveChanges();
          
        }

        public void DeleteFromTable(string CustomerCode)
        {
            this.CustomerCode = int.Parse(CustomerCode);
            entities.Database.Log = Console.WriteLine;
            var Customer = entities.Customers.Where(d => d.Customer_Code == this.CustomerCode).First();
            entities.Customers.Remove(Customer);
            entities.SaveChanges();
        }

    }
}