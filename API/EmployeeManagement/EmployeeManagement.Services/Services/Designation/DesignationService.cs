using EmployeeManagement.Data.Repository.Designation;
using EmployeeManagement.Data.Repository.Employee;
using EmployeeManagement.Model.Model;
using EmployeeManagement.Service.Services.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Service.Services.Designation
{
    public class DesignationService : IDesignationService
    {

        #region Fields
        private readonly IDesignationRepository _repository;
        #endregion

        #region Constructor
        public DesignationService(IDesignationRepository repository)
        {
            _repository = repository;
        }
        #endregion
        public async Task<ApiBaseResponse<List<CommonModel>>> GetDesignationList(int departmentId)
        {
            return await _repository.GetDesignationList(departmentId);
        }
    }
}
