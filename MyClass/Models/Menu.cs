using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyClass.Models
{
    [Table("Menus")]
    public class Menu
    {
        [Key]
         public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public String Link { get; set; }
        public int? ParentId { get; set; }
        public int? Order { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedAt { get; set; }

        public int? UpdateBy { get; set; }
        public DateTime? UpdateAt { get; set; }
        public int? Status { get; set; }
    }
}
