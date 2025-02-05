config {
  type:"operations",
  hasOutput: true,
  tags: ["tag_do_fluxo"]
}

MERGE INTO `tabela_destino` AS t2
USING (
  SELECT * FROM `tabela_de_comparação`
  UNION ALL
  SELECT * , 
  'my_brand' as brand,
  cast(null as string) as bussines_vertical  
  FROM `tabela_de_comparação`
) AS t1
ON  (t1.date IS NOT NULL AND t2.date IS NOT NULL) AND
(t1.date = t2.date) AND  (t1.account = t2.account) AND
(t1.campaign_name = t2.campaign_name) AND (t1.brand = t2.brand)

WHEN MATCHED THEN

  UPDATE SET 
  t2.impressions = t1.impressions, 
  t2.clicks = t1.clicks,
  t2.cost = t1.cost,
  t2.partner = t1.partner,
  t2.type = t1.type,
  t2.revised_campaign_name = t1.revised_campaign_name,
  t2.brand  = t1.brand,
  t2.business_vertical = t1.business_vertical

WHEN NOT MATCHED BY TARGET THEN

  INSERT (
    date,
    account,
    campaign_name,
    impressions,
    clicks,
    cost,
    partner,
    type,
    revised_campaign_name,
    brand,
    business_vertical) 
  VALUES ( t1.date,
    t1.account,
    t1.campaign_name,
    t1.impressions,
    t1.clicks,
    t1.cost,
    t1.partner,
    t1.type,
    t1.revised_campaign_name,
    t1.brand,
    t1.business_vertical
  );