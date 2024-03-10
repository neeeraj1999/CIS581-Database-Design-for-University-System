-- This function calculates the total compensation for an employee.
create function CalculateTotalCompensation(
	@EmployeeId int
)
returns decimal(10,2)
as
begin
	declare @TotalCompensation decimal(10,2);

	select @TotalCompensation = ei.AnnualSalary + isnull(eb.EmployeePremium, 0) + isnull(eb.EmployerPremium, 0)
	from EmployeeInfo ei
	left join EmployeeBenefits eb on ei.EmployeeId = eb.EmployeeId
	where ei.EmployeeId = @EmployeeId;

	return isnull(@TotalCompensation, 0)
end;

grant exec on npatil09.CalculateTotalCompensation to Graders;

select npatil09.CalculateTotalCompensation(3) as TotalCompensation;

grant select on npatil09.EmployeeInfo to Graders;
grant select on npatil09.EmployeeBenefits to Graders;
select * from EmployeeInfo;
select * from EmployeeBenefits;