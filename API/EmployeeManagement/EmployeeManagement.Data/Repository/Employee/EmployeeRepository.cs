using Dapper;
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

namespace EmployeeManagement.Data.Repository.Employee
{
    public class EmployeeRepository : BaseRepository, IEmployeeRepository
    {

        #region Constructor
        public EmployeeRepository(IOptions<DataConfig> dataConfig) : base(dataConfig)
        {
        }
        #endregion

        #region Employee

        /// <summary>
        /// Get Employee List
        /// </summary>
        /// <returns></returns>
        public async Task<ApiBaseResponse<List<EmployeeModel>>> GetEmployeeList(PaginationModel paginationModel)
        {
            ApiBaseResponse<List<EmployeeModel>> responseModel = new ApiBaseResponse<List<EmployeeModel>> ();
            try
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@pageSize", paginationModel.PageSize, DbType.Int64);
                queryParameters.Add("@pageNumber", paginationModel.PageNumber, DbType.Int64);
                queryParameters.Add("@orderBy", paginationModel.OrderBy, DbType.String);
                queryParameters.Add("@sortBy", paginationModel.SortBy, DbType.String);
                queryParameters.Add("@searchValue", paginationModel.SearchValue, DbType.String);
                var employeeData = await QueryAsync<EmployeeModel>("GetEmployeeList", queryParameters
                    , commandType: CommandType.StoredProcedure);
                responseModel.Success = true;
                responseModel.Data = employeeData.ToList();
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

        /// <summary>
        /// Get Employee Details By EmployeeId
        /// </summary>
        /// <param name="employeeId">EmployeeId</param>
        /// <returns></returns>
        public async Task<ApiBaseResponse<EmployeeModel>> GetEmployeeDetailsByEmployeeId(int employeeId)
        {
            ApiBaseResponse<EmployeeModel> responseModel = new ApiBaseResponse<EmployeeModel>();
            try
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@employeeId", employeeId, DbType.Int64);
                var employeeData = await QueryAsync<EmployeeModel>("GetEmployeeDetailsByEmployeeId", queryParameters
                    , commandType: CommandType.StoredProcedure);
                responseModel.Success = true;
                responseModel.Data = employeeData.FirstOrDefault();
            }
            catch (Exception ex)
            {
                responseModel.Success = false;
                responseModel.Message = ex.Message;
            }
            return responseModel;
        }

        /// <summary>
        /// Add and Update Employee Details
        /// </summary>
        /// <param name="employeeModel">EmployeeModel</param>
        /// <returns></returns>
        public async Task<ApiBaseResponse<ResponseModel>> AddUpdateEmployeeDetail(EmployeeModel employeeModel)
        {
            ApiBaseResponse<ResponseModel> responseModel = new ApiBaseResponse<ResponseModel>();
            try
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@employeeId", employeeModel.EmployeeId);
                queryParameters.Add("@empTagNumber", employeeModel.EmpTagNumber);
                queryParameters.Add("@firstName", employeeModel.FirstName);
                queryParameters.Add("@lastName", employeeModel.LastName);
                queryParameters.Add("@emailAddress", employeeModel.EmailAddress);
                queryParameters.Add("@designationId", employeeModel.DesignationId);
                queryParameters.Add("@departmentId", employeeModel.DepartmentId);
                queryParameters.Add("@birthdate", employeeModel.Birthdate);
                queryParameters.Add("@createdBy", employeeModel.CreatedBy);
                queryParameters.Add("@isActive", employeeModel.IsActive);
                var responseData = await QueryFirstOrDefaultAsync<ResponseModel>("AddUpdateEmployeeDetail", queryParameters, commandType: CommandType.StoredProcedure);
                responseModel.Success = responseData.Success;
                responseModel.Message = responseData.Message;

            }
            catch (Exception ex)
            {
                responseModel.Success = false;
                responseModel.Message = ex.Message;
            }
            return responseModel;
        }

        /// <summary>
        /// Delete Employee
        /// </summary>
        /// <param name="employeeModel">EmployeeModel</param>
        /// <returns></returns>
        public async Task<ApiBaseResponse<ResponseModel>> DeleteEmployee(EmployeeModel employeeModel)
        {
            ApiBaseResponse<ResponseModel> responseModel = new ApiBaseResponse<ResponseModel>();
            try
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@employeeId", employeeModel.EmployeeId);
                queryParameters.Add("@updatedBy", employeeModel.UpdatedBy);
                var responseData = await QueryFirstOrDefaultAsync<ResponseModel>("DeleteEmployee", queryParameters, commandType: CommandType.StoredProcedure);
                responseModel.Success = true;
                responseModel.Message = responseData.Message;

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
