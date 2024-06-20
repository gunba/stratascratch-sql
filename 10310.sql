with cte as
(
    select 
        assignment1+assignment2+assignment3 as score
    from 
        box_scores
)
select max(score) - min(score) as difference_in_scores from cte