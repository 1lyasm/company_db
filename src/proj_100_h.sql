select
    project.pname as pname,
    sum(works_on.hours) as tot_hours
from
    works_on,
    project
where
    project.pnumber = works_on.pno
group by
    project.pname, project.pnumber
having 
    sum(works_on.hours) > 100
