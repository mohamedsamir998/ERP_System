
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace ERP_System
{

using System;
    using System.Collections.Generic;
    
public partial class Invoice_Master
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Invoice_Master()
    {

        this.Invoice_Details = new HashSet<Invoice_Details>();

    }


    public int Invoice_Id { get; set; }

    public Nullable<int> Customer_Id { get; set; }

    public Nullable<decimal> Total_Amount { get; set; }

    public Nullable<bool> Invoice_Status { get; set; }

    public System.DateTime Created_Date { get; set; }

    public int Created_User_Id { get; set; }

    public Nullable<System.DateTime> Last_Modified_Date { get; set; }

    public Nullable<int> Last_Modified_User_Id { get; set; }



    public virtual Customer Customer { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Invoice_Details> Invoice_Details { get; set; }

    public virtual User User { get; set; }

    public virtual User User1 { get; set; }

}

}
