using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Data.Repository.Employee
{
    public interface IEmployeeRepository
    {
        Task<ApiBaseResponse<List<EmployeeModel>>> GetEmployeeList(PaginationModel paginationModel);
        Task<ApiBaseResponse<EmployeeModel>> GetEmployeeDetailsByEmployeeId(int employeeId);
        Task<ApiBaseResponse<ResponseModel>> AddUpdateEmployeeDetail(EmployeeModel employeeModel);
        Task<ApiBaseResponse<ResponseModel>> DeleteEmployee(EmployeeModel employeeModel);
    }
}
