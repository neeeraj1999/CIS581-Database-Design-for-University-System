-- Stored Procedure to update data in the tables after validation
-- Explanation: This Stored procedure updates the PersonInformation table after performing validation 
create procedure updatePersonInformationTable
	@PersonId int,
	@FirstName varchar(50),
	@LastName varchar(50),
	@Password varchar(50),
	@Cell int,
	@Email varchar(100)
as
begin
	-- Declaring variables
	declare @ExistingPersonId int

	-- Checking if the person exists
	select @ExistingPersonId = PersonId from PersonInformation where PersonId = @PersonId;

	if @ExistingPersonId is not null
	begin
		if @FirstName is not null and @LastName is not Null and @Password is not null
		begin
			update PersonInformation
			set
				FirstName = @FirstName,
				LastName = @LastName,
				Password = @Password,
				Cell = @Cell,
				Email = @Email
			where PersonId = @PersonId;
			print 'Update Successful'
		end
		else
		begin
			-- Cannot enter null values
			print 'Values cannot be null. Update failed.'
		end
	end
	else
	begin
		-- PersonId not found
		print 'PersonId does not exist in the PersonInformation table. Update failed.'
	end
end;



grant EXECUTE on npatil09.updatePersonInformationTable to Graders;
EXEC updatePersonInformationTable
    @personId = 1,
    @firstName = 'Jack',
    @lastName = 'Doe',
    @password = 'newpassword',
	@Cell = 123,
    @email = 'jack.doe@example.com';

grant select on npatil09.PersonInformation to Graders;
select * from npatil09.PersonInformation;