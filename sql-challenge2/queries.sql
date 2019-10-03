/*List the following details of each employee: employee number, last name, first name, gender, and salary.*/

select employees.emp_no, last_name, first_name, gender, salary
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

/*List employees who were hired in 1986.*/

select employees.emp_no, hire_date
from employees
where DATE_PART('year', hire_date) = 1986;

/*List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.*/

select dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name, from_date, to_date
from dept_manager
inner join departments on dept_manager.dept_no = departments.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/

select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

/*List all employees whose first name is "Hercules" and last names begin with "B."*/

select first_name, last_name
from employees
where first_name='Hercules'
and last_name like 'B%';

/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/

select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

/*List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/

select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/

select count(last_name), last_name
from employees
GROUP BY last_name
ORDER BY count(last_name) DESC;