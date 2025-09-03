#Första frågan
select 
    c.name as firstName,
    c.lastname as lastName,
    i.name as itemName,
    i.size as itemSize,
    i.color as itemColor,
    b.name as brand,
    oi.count as quantity
from customer c
join orders o on c.id = o.customerId
join orderItems oi on o.id = oi.orderId
join item i on oi.itemId = i.id
join brand b on i.brand = b.id
where b.name = 'SweetPants'
  and i.color = 'Black'
  and i.name like 'Runner'
  and i.size = 'S'
order by quantity desc;

#Andra frågan
select 
    c.name as category,
    count(ic.itemId) as quantity
from categories c
left join itemCategories ic on c.id = ic.categoryId
group by c.id, c.name
order by quantity desc;

#Tredje frågan
select
    date_format(oi.created, '%Y-%m') as month,
    sum(oi.count * i.cost) as totalSales
from orderItems oi
join item i on oi.itemId = i.id
group by date_format(oi.created, '%Y-%m')
order by totalSales desc
limit 1;


    