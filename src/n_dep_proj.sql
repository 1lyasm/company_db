select
    project.dnum as dnum,
    count(*) as n_proj
from
    project
group by
    project.dnum