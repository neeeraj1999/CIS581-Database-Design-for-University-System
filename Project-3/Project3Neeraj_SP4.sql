-- Stored Procedure that performs a business action
-- Explanation: The following Stored Procedure processes employee benefits and updates the EmployeeBenefits table
create procedure ProcessEmployeeBenefits
as
begin
	--Declaring variables
	declare @EmployeeId int;
	declare @AnnualSalary decimal(10, 2);
	declare @BenefitTypeId int;
	declare @BenefitCoverId int;
	declare @EmployeePremium decimal(10,2);
	declare @EmployerPremium decimal(10,2);

	--Declaring cursor to iterate over EmployeeBenefits
	declare benefitCursor cursor for
		select
			eb.EmployeeId,
			ei.AnnualSalary,
			eb.BenefitTypeId,
			eb.BenefitCoverId,
			eb.EmployeePremium,
			eb.EmployerPremium
		from EmployeeBenefits eb
		join EmployeeInfo ei on eb.EmployeeId = ei.EmployeeId;

	-- Opening the cursor
	open benefitCursor;

	--fetching the first row
	fetch next from benefitCursor into
		@EmployeeId,
		@AnnualSalary,
		@BenefitTypeId,
		@BenefitCoverId,
		@EmployeePremium,
		@EmployerPremium;

	--Processing each employee benefit
	while @@FETCH_STATUS = 0
	begin
		-- Performing business logic, in this case, adjusting premium based on salary
		if @AnnualSalary > 78000
		begin
			set @EmployeePremium = @EmployeePremium * 1.13; -- increasing employee premium by 13%
			set @EmployerPremium = @EmployerPremium * 1.09; -- increasing employer premium by 9%
		end

		-- Updating the EmployeeBenefits table with the adjusted premiums
		update EmployeeBenefits
		set
			EmployeePremium = @EmployeePremium,
			EmployerPremium = @EmployerPremium
		where
			EmployeeId = @EmployeeId and
			BenefitTypeId = @BenefitTypeId and
			BenefitCoverId = @BenefitCoverId;

		-- fetching the next row
		fetch next from benefitCursor into
			@EmployeeId,
			@AnnualSalary,
			@BenefitTypeId,
			@BenefitCoverId,
			@EmployeePremium,
			@EmployerPremium;
	end

	-- Closing and deallocating the cursor
	close benefitCursor;
	deallocate benefitCursor;
end;

grant execute on npatil09.ProcessEmployeeBenefits to Graders;
exec npatil09.ProcessEmployeeBenefits;

grant select on npatil09.EmployeeInfo to Graders;
grant select on npatil09.EmployeeBenefits to Graders;
select * from npatil09.EmployeeInfo;
select * from npatil09.EmployeeBenefits;