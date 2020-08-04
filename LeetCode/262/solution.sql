Select cancelled.Date as "Day", cast(cast(coalesce(cancelled.Cancelled,0) as decimal)/total.Total as decimal(10, 2)) as "Cancellation Rate"
from
(Select T.Request_at as "Date", Count(*) as "Cancelled" from 
Trips T
join Users U1 on T.Client_Id = U1.Users_Id and U1.Banned = 'No'
join Users U2 on T.Driver_Id = U2.Users_Id and U2.Banned = 'No' 
where T.status IN ('cancelled_by_driver', 'cancelled_by_client')
group by T.Request_At)
cancelled left join
(Select T.Request_at as "Date", Count(*) as "Total" from 
Trips T
join Users U1 on T.Client_Id = U1.Users_Id and U1.Banned = 'No'
join Users U2 on T.Driver_Id = U2.Users_Id and U2.Banned = 'No'
group by T.Request_At) total
on cancelled.Date = total.Date
where cancelled.Date >= '2013-10-01'
and cancelled.Date <= '2013-10-03';