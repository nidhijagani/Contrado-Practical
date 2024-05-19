using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Data.Repository.Department
{
    public interface IDepartmentRepository
    {
        Task<ApiBaseResponse<List<CommonModel>>> GetDepartmentList();
    }
}
