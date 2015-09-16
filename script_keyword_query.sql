select max(product) from(
select f1.docid as f1_id,f2.docid as f2_id,sum(f1.count*f2.count) as product from (
(select * from Frequency 
union
select 'q' as docid, 'washington' as term, 1 as count
union
select 'q' as docid, 'taxes' as term,1 as count
union
select 'q' as docid, 'treasury' as term, 1 as count
) as f1
inner join( 
select * from Frequency 
union
select 'q' as docid, 'washington' as term, 1 as count
union
select 'q' as docid, 'taxes' as term,1 as count
union
select 'q' as docid, 'treasury' as term, 1 as count
) as f2
on f1.docid='q' and f1.term=f2.term
)
group by f1_id,f2_id
order by product
);

