using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_DungCuHocTap.Models.Models;

namespace Web_DungCuHocTap.Models
{
    public class CartModel
    {
        public SanPham SP { get; set; }
        public int Quantity { get; set; }
    }
}