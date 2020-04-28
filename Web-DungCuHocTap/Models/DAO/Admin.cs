namespace Web_DungCuHocTap.Models.DAO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Admin")]
    public partial class Admin
    {
        [Key]
        public int MaAdmin { get; set; }

        [Required]
        [StringLength(255)]
        public string AdminUserName { get; set; }

        [Required]
        [StringLength(255)]
        public string AdminPassword { get; set; }

        [StringLength(255)]
        public string TenAdmin { get; set; }

        public DateTime? NgayTao { get; set; }
    }
}
