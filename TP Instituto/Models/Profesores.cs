//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TP_Instituto.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Profesores
    {
        public int Legajo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public Nullable<System.DateTime> FecNac { get; set; }
        public Nullable<int> DNI { get; set; }
        public string Mail { get; set; }
        public Nullable<int> Tel { get; set; }
        public Nullable<int> Antig { get; set; }
    }
}