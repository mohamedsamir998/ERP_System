
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
    
public partial class Product_Unit
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Product_Unit()
    {

        this.Products = new HashSet<Product>();

    }


    public int Unit_Id { get; set; }

    public string Unit_Name { get; set; }

    public System.DateTime Created_Date { get; set; }

    public int Created_User_ID { get; set; }

    public Nullable<System.DateTime> Last_Modified_Date { get; set; }

    public Nullable<int> Last_Modified_User_ID { get; set; }



    public virtual User User { get; set; }

    public virtual User User1 { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Product> Products { get; set; }

}

}
