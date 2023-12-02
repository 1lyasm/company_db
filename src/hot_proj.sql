select
    project.pname,
    sum(works_on.hours) as tot_hours
from
    works_on, project
where
    works_on.pno = project.pnumber
group by
    project.pnumber
order by
    tot_hours desc
limit
    1