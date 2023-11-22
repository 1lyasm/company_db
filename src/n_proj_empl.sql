select
    project.pname as pname,
    count(works_on.essn) as n_empl
from
    works_on,
    project
where
    works_on.pno = project.pnumber
group by
    project.pnumber
order by
    n_empl