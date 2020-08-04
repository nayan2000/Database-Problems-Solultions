Select name as 'Name' from Candidate c,
(Select CandidateId from Vote group by CandidateId
order by Count(*) desc limit 1) s1
where c.id = s1.CandidateId;