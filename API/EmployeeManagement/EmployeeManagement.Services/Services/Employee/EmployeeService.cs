using EmployeeManagement.Data.Repository.Employee;
using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Service.Services.Employee
{
    public class EmployeeService : IEmployeeService
    {

        #region Fields
        private readonly IEmployeeRepository _repository;
        #endregion

        #region Constructor
        public EmployeeService(IEmployeeRepository repository)
        {
            _repository = repository;
        }
        #endregion

        public async Task<ApiBaseResponse<ResponseModel>> AddUpdateEmployeeDetail(EmployeeModel employeeModel)
        {
            return await _repository.AddUpdateEmployeeDetail(employeeModel);
        }

        public async Task<ApiBaseResponse<ResponseModel>> DeleteEmployee(EmployeeModel employeeModel)
        {
            return await _repository.DeleteEmployee(employeeModel);
        }

        public async Task<ApiBaseResponse<EmployeeModel>> GetEmployeeDetailsByEmployeeId(int employeeId)
        {
            return await _repository.GetEmployeeDetailsByEmployeeId(employeeId);
        }

        public async Task<ApiBaseResponse<List<EmployeeModel>>> GetEmployeeList(PaginationModel paginationModel)
        {
            return await _repository.GetEmployeeList(paginationModel);
        }
    }
}
