namespace Web_DungCuHocTap.Models.DAO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DatHang")]
    public partial class DatHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DatHang()
        {
            ChiTietDHs = new HashSet<ChiTietDH>();
        }

        [Key]
        public int MaDH { get; set; }

        public DateTime? NgayDatHang { get; set; }

        public DateTime? NgayGiaoHang { get; set; }

        public decimal? TongTien { get; set; }

        public int? MaKH { get; set; }

        public int? MaGG { get; set; }

        public int? MaTT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDH> ChiTietDHs { get; set; }

        public virtual GiamGia GiamGia { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual TrangThaiDH TrangThaiDH { get; set; }
    }
}
