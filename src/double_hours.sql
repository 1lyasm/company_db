with proj_hours as (select
    works_on.pno,
    sum(works_on.hours) as tot_hours
from
    works_on
group by
    works_on.pno
)
select
    project.pname,
    proj_hours.pno,
    proj_hours.tot_hours
from
    proj_hours, project
where
    project.pnumber = proj_hours.pno and
    proj_hours.tot_hours >= (
        select
            avg(works_on.hours)
        from
            works_on
    ) * 2
