namespace Web_DungCuHocTap.Models.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietDHs = new HashSet<ChiTietDH>();
            ChiTietSPs = new HashSet<ChiTietSP>();
        }

        [Key]
        public int MaSP { get; set; }

        [Required]
        [StringLength(255)]
        public string TenSP { get; set; }

        public decimal GiaSP { get; set; }

        public string MotaSP { get; set; }

        public string AnhSP_1 { get; set; }

        public string AnhSP_2 { get; set; }

        public int? Rating { get; set; }

        public DateTime? NgayTao { get; set; }

        public bool? TrangThaiSP { get; set; }

        public int MaLoai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDH> ChiTietDHs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietSP> ChiTietSPs { get; set; }

        public virtual Loai Loai { get; set; }
    }
}
