using EmployeeManagement.Model.Model;
using EmployeeManagement.Service.Services.Department;
using EmployeeManagement.Service.Services.Employee;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentAPIController : ControllerBase
    {
        IDepartmentService _departmentService;
        public DepartmentAPIController(IDepartmentService departmentService)
        {
            _departmentService = departmentService;
        }

        /// <summary>
        /// Get Department List
        /// </summary>
        /// <returns></returns>
        [Route("GetDepartmentList")] //api url to call
        [HttpGet]
        public async Task<ApiBaseResponse<List<CommonModel>>> GetDepartmentList()
        {
            return await _departmentService.GetDepartmentList();
        }

    }
}
