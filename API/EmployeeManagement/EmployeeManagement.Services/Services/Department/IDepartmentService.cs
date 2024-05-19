using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Service.Services.Department
{
    public interface IDepartmentService
    {
        Task<ApiBaseResponse<List<CommonModel>>> GetDepartmentList();
    }
}
