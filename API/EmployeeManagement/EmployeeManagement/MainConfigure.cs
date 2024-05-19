using EmployeeManagement.Data.Repository.Department;
using EmployeeManagement.Data.Repository.Designation;
using EmployeeManagement.Data.Repository.Employee;
using EmployeeManagement.Service.Services.Department;
using EmployeeManagement.Service.Services.Designation;
using EmployeeManagement.Service.Services.Employee;

namespace EmployeeManagement
{
    public class MainConfigure
    {
        public static void Configure(IServiceCollection services)
        {
            // register Repositories for generate DI
            services.AddScoped<IEmployeeRepository, EmployeeRepository>();
            services.AddScoped<IDesignationRepository, DesignationRepository>();
            services.AddScoped<IDepartmentRepository, DepartmentRepository>();

            // register Services for generate DI
            services.AddScoped<IEmployeeService, EmployeeService>();
            services.AddScoped<IDesignationService, DesignationService>();
            services.AddScoped<IDepartmentService, DepartmentService>();
        }
    }
}
