with src_listings as(
  select *
  from {{ ref('src_listings') }} )
select listing_id, listing_name, case when MINIMUM_NIGHTS is null then 1 when MINIMUM_NIGHTS = 0 then 1 else MINIMUM_NIGHTS end as minimum_nights, host_id, replace(price_str, '$', '')::NUMBER(10, 2) AS price, created_at, updated_at
from src_listings