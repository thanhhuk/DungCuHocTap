namespace Web_DungCuHocTap.Models.DAO
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietSP")]
    public partial class ChiTietSP
    {
        [Key]
        public int MaCTSP { get; set; }

        public int? MaSP { get; set; }

        public int? MaNCC { get; set; }

        public virtual NhaCC NhaCC { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
