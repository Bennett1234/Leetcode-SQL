select Email
from Person
group by Email
having count(Email) >=2
