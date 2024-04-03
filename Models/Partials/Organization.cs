using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EduInstitutesApp.Models
{
    public partial class Organization
    {
        public string GetPhoto
        {
            get
            {
                if (Photo is null)
                    return null;
                return Directory.GetCurrentDirectory() + @"\Images\" + Photo.Trim();
            }
        }

    }
}
