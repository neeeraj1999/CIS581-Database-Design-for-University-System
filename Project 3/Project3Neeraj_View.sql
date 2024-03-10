--Explantion: This view shows every employee's name, ID, benefits type, benefits coverage, employee premium and employer premium
create view Benefits as
select
    pi.FirstName + ' ' + pi.LastName AS EmployeeName,
    ei.EmployeeId,
    bt.TypeName AS BenefitType,
    bc.CoverageDescription AS BenefitCoverage,
    eb.EmployeePremium,
    eb.EmployerPremium
FROM PersonInformation pi 
inner join EmployeeInfo ei ON pi.PersonId = ei.EmployeeId
inner join EmployeeBenefits eb on ei.EmployeeId = eb.EmployeeId
INNER JOIN BenefitType bt ON eb.BenefitTypeId = bt.BenefitTypeId
INNER JOIN BenefitCoverage BC ON eb.BenefitCoverId = bc.BenefitCoverId;

grant select on npatil09.Benefits to Graders;

select * from Benefits;