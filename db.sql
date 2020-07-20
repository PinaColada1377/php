select DATE_FORMAT( time_reports.date, '%W'), group_concat(employees.name, ' (', x.total_hours, ' hours)' order by x.total_hours desc  SEPARATOR  ', ' LIMIT 3 )  
  from employees
  inner join time_reports on employees.id=time_reports.employee_id
  inner join 
    (
      select employee_id, round(hours,2) as total_hours 
        from time_reports group by employee_id
    )x on x.employee_id=time_reports.employee_id
  group by time_reports.date


