using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Service.Services.Employee
{
    public interface IEmployeeService
    {
        Task<ApiBaseResponse<List<EmployeeModel>>> GetEmployeeList(PaginationModel paginationModel);
        Task<ApiBaseResponse<EmployeeModel>> GetEmployeeDetailsByEmployeeId(int employeeId);
        Task<ApiBaseResponse<ResponseModel>> AddUpdateEmployeeDetail(EmployeeModel employeeModel);
        Task<ApiBaseResponse<ResponseModel>> DeleteEmployee(EmployeeModel employeeModel);
    }
}
