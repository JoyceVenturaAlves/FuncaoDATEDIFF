-- Criando a função datediff no postgreSQL
create function datediff(unidade varchar, data_inicial date, data_final date)
returns integer
language sql

as 

$$
	select
		case 
			when unidade in ('d','day','days') then (data_final - data_inicial)
			when unidade in ('w','week','weeks') then (data_final - data_inicial) / 7
			when unidade in ('m','month','months') then (data_final - data_inicial) / 30
			when unidade in ('y','year','years') then (data_final - data_inicial) / 365
			end as diferenca
			
$$

-- Usando a função datediff
select datediff('y', '2018-06-01', current_date)