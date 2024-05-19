namespace EmployeeManagement.Model.Model
{

    public class EmployeeModel : BaseModel
    {
        public int EmployeeId { get; set; }
        public string? EmpTagNumber { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? EmailAddress { get; set; }
        public string? Department { get; set; }
        public string? Designation { get; set; }
        public int? Age { get; set; }
        public DateTime? Birthdate { get; set; }
        public int? DepartmentId { get; set; }
        public int? DesignationId { get; set; }
        public int? TotalRecords { get; set; }
    }
}
