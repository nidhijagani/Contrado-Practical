using EmployeeManagement.Model.Model;
using EmployeeManagement.Service.Services.Designation;
using EmployeeManagement.Service.Services.Employee;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DesignationAPIController : ControllerBase
    {
        IDesignationService _designationService;
        public DesignationAPIController(IDesignationService designationService)
        {
            _designationService = designationService;
        }

        /// <summary>
        /// Get Designation List
        /// </summary>
        /// <returns></returns>
        [Route("GetDesignationList")] //api url to call
        [HttpGet]
        public async Task<ApiBaseResponse<List<CommonModel>>> GetDesignationList(int departmentId)
        {
            return await _designationService.GetDesignationList(departmentId);
        }
    }
}
