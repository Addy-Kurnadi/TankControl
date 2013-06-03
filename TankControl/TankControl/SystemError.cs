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
    public partial class SystemError
    {
        public int id { get; set; }
        public Nullable<int> errorLevel { get; set; }
        public string errorDesc { get; set; }
        public string errorLocation { get; set; }
        public Nullable<System.DateTime> errorDate { get; set; }

        public static void Log(string errorDesc,int errorlvl)
        {
            SystemError sys = new SystemError();
            sys.errorDate = DateTime.Now;
            sys.errorDesc = errorDesc;
            sys.errorLevel = errorlvl;

            using (TankControlEntities tce = new TankControlEntities())
            {
                try
                {
                    tce.SystemErrors.Add(sys);
                    tce.SaveChanges();
                }
                catch (System.Data.EntityException)
                {

                }
                catch (Exception ex)
                {

                }
            }
        }
    }
    
}
