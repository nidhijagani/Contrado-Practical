using EmployeeManagement.Data.Repository.Department;
using EmployeeManagement.Data.Repository.Designation;
using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Service.Services.Department
{
    public class DepartmentService : IDepartmentService
    {
        #region Fields
        private readonly IDepartmentRepository _repository;
        #endregion

        #region Constructor
        public DepartmentService(IDepartmentRepository repository)
        {
            _repository = repository;
        }
        #endregion
        public async Task<ApiBaseResponse<List<CommonModel>>> GetDepartmentList()
        {
            return await _repository.GetDepartmentList();
        }
    }
}
