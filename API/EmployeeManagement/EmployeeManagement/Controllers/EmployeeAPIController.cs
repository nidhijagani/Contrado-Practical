using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using EmployeeManagement.Service.Services.Employee;
using EmployeeManagement.Model.Model;

namespace EmployeeManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeAPIController : ControllerBase
    {
        IEmployeeService _employeeService;
        public EmployeeAPIController(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }

        /// <summary>
        /// Get Employee Details By EmployeeId
        /// </summary>
        /// <param name="employeeId">EmployeeId</param>
        /// <returns></returns>
        [Route("GetEmployeeDetailsByEmployeeId")] //api url to call
        [HttpGet] 
        public async Task<ApiBaseResponse<EmployeeModel>> GetEmployeeDetailsByEmployeeId(int employeeId)
        {
            return await _employeeService.GetEmployeeDetailsByEmployeeId(employeeId);
        }

        /// <summary>
        /// Get Employee List
        /// </summary>
        /// <returns></returns>
        [Route("GetEmployeeList")] //api url to call
        [HttpPost] 
        public async Task<ApiBaseResponse<List<EmployeeModel>>> GetEmployeeList(PaginationModel paginationModel)
        {
            return await _employeeService.GetEmployeeList(paginationModel);
        }

        /// <summary>
        /// Add Update Employee Detail
        /// </summary>
        /// <param name="employeeModel">EmployeeModel</param>
        /// <returns></returns>
        [Route("AddUpdateEmployeeDetail")] //api url to call
        [HttpPost] 
        public async Task<ApiBaseResponse<ResponseModel>> AddUpdateEmployeeDetail(EmployeeModel employeeModel)
        {
            return await _employeeService.AddUpdateEmployeeDetail(employeeModel);
        }

        /// <summary>
        /// Delete Employee
        /// </summary>
        /// <param name="EmployeeModel">employeeModel</param>
        /// <returns></returns>
        [Route("DeleteEmployee")] //api url to call
        [HttpPost]
        public async Task<ApiBaseResponse<ResponseModel>> DeleteEmployee(EmployeeModel employeeModel)
        {
            return await _employeeService.DeleteEmployee(employeeModel);
        }

    }
}
