using EmployeeManagement.Data.Repository.Designation;
using EmployeeManagement.Model;
using EmployeeManagement.Model.Model;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Data.Repository.Department
{
    public class DepartmentRepository : BaseRepository, IDepartmentRepository
    {
        public DepartmentRepository(IOptions<DataConfig> connectionString) : base(connectionString)
        {
        }

        #region Department

        /// <summary>
        /// Get Department List
        /// </summary>
        /// <returns></returns>
        public async Task<ApiBaseResponse<List<CommonModel>>> GetDepartmentList()
        {
            ApiBaseResponse<List<CommonModel>> responseModel = new ApiBaseResponse<List<CommonModel>>();
            try
            {
                var departmentData = await QueryAsync<CommonModel>("GetDepartmentList");
                responseModel.Success = true;
                responseModel.Data = departmentData.ToList();
                if (responseModel.Data.Count == 0)
                {
                    responseModel.Message = "Data not found!!";
                }
            }
            catch (Exception ex)
            {
                responseModel.Success = false;
                responseModel.Message = ex.Message;
            }
            return responseModel;
        }

        #endregion

    }
}
