using EmployeeManagement.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Data.Repository.Designation
{
    public interface IDesignationRepository
    {
        Task<ApiBaseResponse<List<CommonModel>>> GetDesignationList(int departmentId);
    }
}
