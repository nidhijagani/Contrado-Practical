using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Service.Services.Designation
{
    public interface IDesignationService
    {
        Task<ApiBaseResponse<List<CommonModel>>> GetDesignationList(int departmentId);
    }
}
