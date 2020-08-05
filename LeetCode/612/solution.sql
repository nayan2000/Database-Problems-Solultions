select min(round(sqrt(power(t1.x-t2.x,2) + power(t1.y-t2.y,2)),2)) shortest
from point_2d t1
cross join point_2d t2
on !(t1.x = t2.x and t1.y=t2.y);