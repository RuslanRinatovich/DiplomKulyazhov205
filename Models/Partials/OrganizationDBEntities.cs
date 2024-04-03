using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EduInstitutesApp.Models
{

        public partial class OrganizationDBEntities : DbContext
        {
            private static OrganizationDBEntities _context;
            /// <summary>
            /// Метод возвращающий контекст подключения
            /// </summary>
            /// <returns></returns>
            public static OrganizationDBEntities GetContext()
            {
                if (_context == null)
                {
                    _context = new OrganizationDBEntities();
                }
                return _context;
            }
        }
    }

