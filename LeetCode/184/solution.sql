Select D.Name as "Department", E.Name as "Employee", E.Salary as "Salary" from Employee E, Department D, (Select DepartmentId, Max(Salary) as "Max" from Employee group by DepartmentId) as S1 where E.DepartmentId = D.Id and D.Id = S1.DepartmentId and E.Salary = S1.Max;