use CourseP418

select *
from Students

create view vw_getStudentsByAge
as
select *  from Students where [Age]>25

select * from vw_getStudentsByAge




create view vw_joinStudentDatas
as
select st.Fullname as 'Student', ct.Name as 'City' from Students st 
inner join Cities ct
on st.CityId=ct.Id
join Countries co
on ct.CountryId = co.Id

select * from vw_joinStudentDatas



create function dbo.getShowWord()
returns nvarchar (50)
as
begin
return 'P418'
end




select dbo.getShowWord()

declare @result nvarchar (50) = (select dbo.getShowWord())

print @result



create function dbo.ShowWordWithParametr(@text nvarchar (50))
returns nvarchar (50)
as
begin
  return @text
end


select dbo.ShowWordWithParametr('Salam')




create function dbo.getStudentsAvgAgeByIds(@id int)
returns int
as
begin
  declare @count int = (select COUNT (*) from Students where [Id]> @id) 
  declare @sumAge int = (select SUM (Age) from Students where [Id]> @id) 
  return @sumAge/@count
end


select dbo.getStudentsAvgAgeByIds(2)




create function dbo.getStudentsAverageAgeByIds(@id int)
returns int
as
begin
  return (select AVG (Age) from Students where [Id]> @id) 
   
end


select dbo.getStudentsAverageAgeByIds(2)





declare @avgAge int = (select dbo.getStudentsAverageAgeByIds(2))

select * from GetStudentsByConditiion(@avgAge)


create function dbo.GetStudentsByConditiion(@avgAge int)
returns table
as
return (select * from Students where [Age]>@avgage)




-- create procedure usp_showText
-- as
-- print 'salam'


-- exec usp_showText

-- usp_showText




-- create procedure usp_showTextWidthParametr
-- @text nvarchar(50)
-- as
-- print @text

-- usp_showTextWidthParametr 'salam'





-- create procedure usp_deleteEmployeeById
-- @id int
-- as
-- delete from  Employees where [Id] = @id


-- select * from Employees


-- exec usp_deleteEmployeeById 5



create function dbo.getEmployeesByAvgAges()
returns int
as
begin
return (select AVG(Age) from Employees)
end



create procedure usp_deleteEmployeesByAge
as
begin
declare @avgAge int = (select dbo.getEmployeesByAvgAges())
delete from Employees where [Age] > @avgAge
end


exec usp_deleteEmployeesByAge 

select * from Employees

