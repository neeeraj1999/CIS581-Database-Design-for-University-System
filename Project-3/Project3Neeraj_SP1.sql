--Stored Procedure to use cursors
--Explanation: Following Stored Procedure fetches the employees' names and their corresponding job descriptions

create procedure GetEmployeesAndJobs
as
begin
	-- declaring variables
	declare @EmployeeId int;
	declare @FirstName varchar(50);
	declare @LastName varchar(50);
	declare @JobDescription varchar(255);

	-- declaring and opening the cursor
	declare employeeCursor cursor for
	select pi.PersonId, pi.FirstName, pi.LastName, jd.JobDescription
	from PersonInformation pi
	inner join EmployeeInfo ei on pi.PersonId = ei.EmployeeId
	inner join EmployeeandJobs ej on ei.EmployeeId = ej.EmployeeId
	inner join JobDescription jd on ej.JobId = jd.JobId;

	open employeeCursor;

	-- fetch the first row
	fetch next from employeeCursor into @EmployeeId, @FirstName, @LastName, @JobDescription;

	-- iterate over the cursor
	while @@FETCH_STATUS = 0
	begin
		-- displaying the employee name and job description to console
		print 'Employee Name: ' + @FirstName + ' ' + @LastName + ', Job Description: ' + @JobDescription;

		-- fetching the next row
		fetch next from employeeCursor into @EmployeeId, @FirstName, @LastName, @JobDescription;
	end;

	-- closing and deallocating the cursor
	close employeeCursor;
	deallocate employeeCursor;
end;


grant EXECUTE on npatil09.GetEmployeesAndJobs to Graders;
EXEC npatil09.GetEmployeesAndJobs;

grant select on npatil09.PersonInformation to Graders;
grant select on npatil09.EmployeeInfo to Graders;
grant select on npatil09.EmployeeandJobs to Graders;
grant select on npatil09.JobDescription to Graders;
select * from npatil09.PersonInformation;
select * from npatil09.EmployeeInfo;
select * from npatil09.EmployeeandJobs;
select * from npatil09.JobDescription