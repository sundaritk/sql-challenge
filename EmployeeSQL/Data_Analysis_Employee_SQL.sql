--List the following details of each employee: employee number, last name, first name, gender, and salary

select emp.emp_no, last_name, first_name, gender, salary 
from employees AS emp
inner join salaries AS sal on emp.emp_no=sal.emp_no;

--List employees who were hired in 1986

select * 
from employees where EXTRACT(YEAR FROM hire_date)=1986;

/*List the manager of each department with the following information: department number, department name, 
the manager's employee number, last name, first name, and start and end employment dates */

select deptm.dept_no, dept_name, emp.emp_no, last_name, first_name, hire_date, from_date, to_date 
from dept_manager AS deptm inner join employees AS emp on deptm.emp_no = emp.emp_no 
inner join departments AS depts on deptm.dept_no=depts.dept_no

/* List the department of each employee with the following information: 
employee number, last name, first name, and department name */

select emp.emp_no, last_name, first_name, dept_name 
from employees AS emp
inner join dept_emp AS depte on emp.emp_no=depte.emp_no 
inner join departments AS depts on depte.dept_no=depts.dept_no 
order by emp.emp_no

--List all employees whose first name is "Hercules" and last names begin with "B"

select *
from employees where first_name = 'Hercules' and last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name

select emp.emp_no, last_name, first_name, dept_name 
from employees AS emp
inner join dept_emp AS depte on emp.emp_no=depte.emp_no 
inner join departments AS depts on depte.dept_no=depts.dept_no AND depts.dept_name= 'Sales' 
order by emp.emp_no

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name */

select emp.emp_no, last_name, first_name, dept_name 
from employees AS emp 
inner join dept_emp AS depte on emp.emp_no=depte.emp_no 
inner join departments AS depts on depte.dept_no=depts.dept_no 
where depts.dept_name IN ('Sales', 'Development')
order by emp.emp_no

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

select last_name, count(last_name) AS "SameLastName"
from employees
group by last_name
order by "SameLastName" desc;