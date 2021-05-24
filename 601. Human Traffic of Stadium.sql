SELECT *
FROM statium as s1 left join statium as s2 on (s1.id+1 = s2.id)
                   left join statium as s3 on (s1.id+2 = s3.id)
WHERE s1.people >= 100 and s2.people>=100 and s3.people >= 100
