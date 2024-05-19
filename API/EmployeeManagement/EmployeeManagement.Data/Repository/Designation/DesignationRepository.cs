using Dapper;
using EmployeeManagement.Data.Repository.Employee;
using EmployeeManagement.Model;
using EmployeeManagement.Model.Model;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement.Data.Repository.Designation
{
    public class DesignationRepository : BaseRepository, IDesignationRepository
    {
        public DesignationRepository(IOptions<DataConfig> connectionString) : base(connectionString)
        {
        }

        #region Designation

        /// <summary>
        /// Get Designation List
        /// </summary>
        /// <returns></returns>
        public async Task<ApiBaseResponse<List<CommonModel>>> GetDesignationList(int departmentId)
        {
            ApiBaseResponse<List<CommonModel>> responseModel = new ApiBaseResponse<List<CommonModel>>();
            try
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@departmentId", departmentId, DbType.Int64);
                var designationData = await QueryAsync<CommonModel>("GetDesignationList", queryParameters
                    , commandType: CommandType.StoredProcedure);
                responseModel.Success = true;
                responseModel.Data = designationData.ToList();
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
