select product from (
select f1.docid as f1_id, f2.docid as f2_id, f1.term as term, sum(f1.count*f2.count) as product
from Frequency as f1
inner join Frequency as f2
on f1.term=f2.term
group by f1.docid, f2.docid
)
where f1_id='10080_txt_crude' and f2_id='17035_txt_earn';
