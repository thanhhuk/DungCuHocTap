using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web_DungCuHocTap.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required]
        public string AdminUsername { get; set; }

        [Required]
        [MinLength(6)]
        public string AdminPassword { get; set; }
    }
}