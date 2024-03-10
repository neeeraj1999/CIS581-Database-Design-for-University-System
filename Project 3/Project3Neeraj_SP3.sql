-- Stored Procedure to delete data from a table
-- The following Stored Procedure deletes data from EmployeeBenefits table

create procedure DeleteEmployeeBenefits
	@EmployeeId int
as
begin
	-- checking if the PersonId exists
	if exists(select 1 from EmployeeBenefits where EmployeeId = @EmployeeId)
	begin
		-- Deleting the record
		delete from EmployeeBenefits where EmployeeId = @EmployeeId;
		print 'Delete successful.'
	end
	else
	begin
		-- PersonId not found
		print 'EmployeeId does not exist in the table. Delete failed.';
	end
end;

grant execute on npatil09.DeleteEmployeeBenefits to Graders;

exec npatil09.DeleteEmployeeBenefits 6;

grant select on npatil09.EmployeeBenefits to Graders;
select * from npatil09.EmployeeBenefits;