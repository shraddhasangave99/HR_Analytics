# CREATE & SELECT DATABASE
use newschema;
/*KPI_1- Average Attrition rate for all Departments*/
SELECT Department,
       concat(format(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100,2),"%") AS Average_Attrition_Rate
FROM  newschema.`hr data1`
GROUP BY Department;

/*KPI_2- Average Hourly rate of Male Research Scientist*/
SELECT Job_Role, Gender,
       format(AVG(Hourly_Rate),2) AS Average_Hourly_Rate
FROM newschema.`hr data1` where Job_Role='Research Scientist' and Gender='Male';

/*KPI_3- Attrition rate Vs Monthly income stats*/
SELECT Department,
concat(format(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100,2),"%") AS Average_Attrition_Rate,
sum(Monthly_Income) as Monthly_Income
FROM newschema.`hr data1`
GROUP BY Department;

/*KPI_4- Average working years for each Department*/
SELECT Department,
format(AVG(Total_Working_Years),2) AS Average_Working_Years
FROM newschema.`hr data1`
GROUP BY Department;

/*KPI_5- Departmentwise No of Employees*/
select Department, count(Employee_Number) as Employee_numbers
FROM newschema.`hr data1`
GROUP BY Department;

/*KPI_6- Count of Employees based on Educational Fields*/
select Education_Field, count(Employee_Number) as Employee_numbers
FROM newschema.`hr data1`
GROUP BY Education_Field;

/*KPI_7- Job Role Vs Work life balance*/
select Job_Role, format(AVG(Work_Life_Balance),2) as avg_Work_Life_Balance
FROM newschema.`hr data1`
GROUP BY Job_Role;

/*KPI_8- Attrition rate Vs Year since last promotion relation*/
select Years_Since_Last_Promotion, concat(format(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100,2),"%") AS Average_Attrition_Rate
FROM newschema.`hr data1`
group by Years_Since_Last_Promotion;

/*KPI_9- Gender based Employee Number*/
select Gender, count(Employee_Number) as Emp_Num,
case when Gender="Female" then concat(format((count(Employee_Number)/(select count(Employee_Number) from newschema.`hr data1`)*100),0),"%")
     when Gender="Male" then concat(format((count(Employee_Number)/(select count(Employee_Number) from newschema.`hr data1`)*100),0),"%")
     end as Employee_Percentage
FROM newschema.`hr data1`
group by Gender;

/*KPI_10- Deptarment / Job Role wise job satisfaction*/
select Job_Role, format(AVG(Job_Satisfaction),2) as avg_Job_Satisfaction
FROM newschema.`hr data1`
GROUP BY Job_Role;











