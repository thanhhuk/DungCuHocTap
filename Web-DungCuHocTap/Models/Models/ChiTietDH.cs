namespace Web_DungCuHocTap.Models.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietDH")]
    public partial class ChiTietDH
    {
        [Key]
        public int MaCTDH { get; set; }

        public int? SoLuong { get; set; }

        public int? MaDH { get; set; }

        public int? MaSP { get; set; }

        public int? MaMau { get; set; }

        public virtual DatHang DatHang { get; set; }

        public virtual Color Color { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
