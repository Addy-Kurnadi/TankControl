//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace TankControl
{
    public partial class Recipe
    {
        public Recipe()
        {
            this.Histories = new HashSet<History>();
        }
    
        public int id { get; set; }
        public Nullable<double> el1 { get; set; }
        public Nullable<double> el2 { get; set; }
        public Nullable<double> el3 { get; set; }
        public Nullable<double> el4 { get; set; }
        public Nullable<double> el5 { get; set; }
        public Nullable<double> el6 { get; set; }
        public Nullable<double> el7 { get; set; }
        public Nullable<double> tol_el1 { get; set; }
        public Nullable<double> tol_el2 { get; set; }
        public Nullable<double> tol_el3 { get; set; }
        public Nullable<double> tol_el4 { get; set; }
        public Nullable<double> tol_el5 { get; set; }
        public Nullable<double> tol_el6 { get; set; }
        public Nullable<double> tol_el7 { get; set; }
        public Nullable<double> switch_el1 { get; set; }
        public Nullable<double> switch_el2 { get; set; }
        public Nullable<int> runtime { get; set; }
    
        public virtual ICollection<History> Histories { get; set; }
    }
    
}
