/**
 * Query per MySQL 5.7 db=common
 */

-- Query inserimento freighters
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, case when right(id,1)='F' then 0 else 1 end side,
'freighter',
case when right(id,1)='F' then 'base' else 'promoted' end type,spectral_type,mass,rad_hard,
json_object('promotion_colony', promotion_colony, 'load_limit', load_limit, 'factory_loading_only',factory_loading_only,
 'bonus_pivots',bonus_pivots,
  'provided_generator',provided_generator,
  'provided_reactor',provided_reactor,
  'ability',ability,
  'future',future) as details
from hf_freighters f;

-- Query inserimento bernals
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'bernal',
case when `type`='Bernal' then 'base' else 'promoted' end `type`,
null as spectral_type,mass,rad_hard,
json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
'powersat',powersat,
'required_generator',required_generator,
'required_therms',required_therms,
'ability',ability) as details
from hf_bernals t;

-- Query inserimento generators
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'generator',
case when type_p=1 and type_e =1 then 'P/E'
	when type_p=1 and type_e=0 then 'P'
	when type_p=0 and type_e=1 then 'E'
end `type`,
spectral_type,mass,rad_hard,
json_object('thrust_modifier', thrust_modifier, 'air_eater', air_eater, 'fuel_consumption_modifier',fuel_consumption_modifier,
'solar',solar,
'support_generator_p',support_generator_p,
'support_reactor_x',support_reactor_x,
'support_reactor_o',support_reactor_o,
'support_reactor_b',support_reactor_b,
'therms',therms,
'ability',ability) as details
-- t.*
from hf_generators t;

-- Query inserimento gwthruster
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'thruster', `type`,
-- case when `type`='GW and type_e =1 then 'P/E'
-- 	when type_p=1 and type_e=0 then 'P'
-- 	when type_p=0 and type_e=1 then 'E'
-- end `type`,
spectral_type,mass,rad_hard,
json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
'afterburn',afterburn,
'required_generator',required_generator,
'required_reactor',required_reactor,
'required_therms',required_therms,
-- json_object('thrust_modifier', thrust_modifier, 'air_eater', air_eater, 'fuel_consumption_modifier',fuel_consumption_modifier,
-- 'solar',solar,
-- 'support_generator_p',support_generator_p,
-- 'support_reactor_x',support_reactor_x,
-- 'support_reactor_o',support_reactor_o,
-- 'support_reactor_b',support_reactor_b,
-- 'therms',therms,
'future',future
-- 'ability',ability
) as details
-- t.*
from hf_gwthrusters t;

-- Query inserimento radiators
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'radiator', null `type`, -- `type`,
-- case when `type`='GW and type_e =1 then 'P/E'
-- 	when type_p=1 and type_e=0 then 'P'
-- 	when type_p=0 and type_e=1 then 'E'
-- end `type`,
spectral_type,
concat(mass_l,'/',mass_h) mass,
concat(rad_hard_l,'/',rad_hard_h) rad_hard, 
-- mass,rad_hard,
json_object('therms_l',therms_l,'therms_h',therms_h,
-- json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
-- 'afterburn',afterburn,
'required_generators',required_generators,
-- 'required_reactor',required_reactor,
-- 'required_therms',required_therms,
-- json_object('thrust_modifier', thrust_modifier, 'air_eater', air_eater, 'fuel_consumption_modifier',fuel_consumption_modifier,
-- 'solar',solar,
-- 'support_generator_p',support_generator_p,
-- 'support_reactor_x',support_reactor_x,
-- 'support_reactor_o',support_reactor_o,
-- 'support_reactor_b',support_reactor_b,
-- 'therms',therms,
-- 'future',future
'ability',ability
) as details
-- t.*
from hf_radiators t;

-- Query inserimento radiators
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'reactor', -- null `type`, -- `type`,
-- case when type_x=1 and type_o=1 and type_b=1 then 'X/O/B'
-- 	when type_p=1 and type_e=0 then 'P'
-- 	when type_p=0 and type_e=1 then 'E'
-- end `type`,
CONCAT_WS('/',
    CASE WHEN type_x THEN 'X' END,
    CASE WHEN type_o THEN 'O' end,
    CASE WHEN type_b THEN 'B' end
  ) as `type`,
spectral_type,
-- concat(mass_l,'/',mass_h) mass,
-- concat(rad_hard_l,'/',rad_hard_h) rad_hard, 
mass,rad_hard,
-- json_object('therms_l',therms_l,'therms_h',therms_h,
-- json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
-- 'afterburn',afterburn,
-- 'required_generators',required_generators,
-- 'required_reactor',required_reactor,
-- 'required_therms',required_therms,
json_object('thrust_modifier', thrust_modifier, 'air_eater', air_eater, 'fuel_consumption_modifier',fuel_consumption_modifier,
'required_generator',required_generator,
'required_reactor',required_reactor,
'therms',therms,
-- 'solar',solar,
-- 'support_generator_p',support_generator_p,
-- 'support_reactor_x',support_reactor_x,
-- 'support_reactor_o',support_reactor_o,
-- 'support_reactor_b',support_reactor_b,
-- 'therms',therms,
-- 'future',future
'ability',ability
) as details
-- t.*
from hf_reactors t;

-- Query inserimento refineries
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'refinery', null `type`, -- `type`,
-- case when type_x=1 and type_o=1 and type_b=1 then 'X/O/B'
-- 	when type_p=1 and type_e=0 then 'P'
-- 	when type_p=0 and type_e=1 then 'E'
-- end `type`,
-- CONCAT_WS('/',
--    CASE WHEN type_x THEN 'X' END,
--    CASE WHEN type_o THEN 'O' end,
--    CASE WHEN type_b THEN 'B' end
--  ) as `type`,
spectral_type,
-- concat(mass_l,'/',mass_h) mass,
-- concat(rad_hard_l,'/',rad_hard_h) rad_hard, 
mass,rad_hard,
-- json_object('therms_l',therms_l,'therms_h',therms_h,
-- json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
-- 'afterburn',afterburn,
-- 'required_generators',required_generators,
-- 'required_reactor',required_reactor,
-- 'required_therms',required_therms,
json_object('air_eater', air_eater, -- 'fuel_consumption_modifier',fuel_consumption_modifier,
'generator_e',generator_e,
'reactor_x',reactor_x,
'reactor_o',reactor_o,
'reactor_b',reactor_b,
-- 'required_generator',required_generator,
-- 'required_reactor',required_reactor,
-- 'therms',therms,
-- 'solar',solar,
-- 'support_generator_p',support_generator_p,
-- 'support_reactor_x',support_reactor_x,
-- 'support_reactor_o',support_reactor_o,
-- 'support_reactor_b',support_reactor_b,
-- 'therms',therms,
-- 'future',future
'ability',ability
) as details
-- t.*
from hf_refineries t;

-- Query inserimento robonauts
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'robonaut', -- null `type`, -- `type`,
case when isru_missile=1 then 'missile'
 	when isru_raygun=1 then 'raygun'
 	when isru_buggy=1 then 'buggy'
end `type`,
-- CONCAT_WS('/',
--    CASE WHEN type_x THEN 'X' END,
--    CASE WHEN type_o THEN 'O' end,
--    CASE WHEN type_b THEN 'B' end
--  ) as `type`,
spectral_type,
-- concat(mass_l,'/',mass_h) mass,
-- concat(rad_hard_l,'/',rad_hard_h) rad_hard, 
mass,rad_hard,
json_object('thrust',thrust,'fuel_consumption',fuel_consumption,
'fuel_type',fuel_type,
-- json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
'afterburn',afterburn,
'push',push,
-- 'required_generators',required_generators,
-- 'required_reactor',required_reactor,
-- 'required_therms',required_therms,
-- json_object('air_eater', air_eater, -- 'fuel_consumption_modifier',fuel_consumption_modifier,
'generator_p',generator_p,
'generator_e',generator_e,
'reactor_x',reactor_x,
'reactor_o',reactor_o,
'reactor_b',reactor_b,
-- 'required_generator',required_generator,
-- 'required_reactor',required_reactor,
'therms',therms,
'solar',solar,
'isru',isru,
-- 'support_generator_p',support_generator_p,
-- 'support_reactor_x',support_reactor_x,
-- 'support_reactor_o',support_reactor_o,
-- 'support_reactor_b',support_reactor_b,
-- 'therms',therms,
-- 'future',future
'ability',ability
) as details
-- t.*
from hf_robonauts t;

-- Query inserimento thrusters
insert into hf_all(id,name,side,component,`type`,spectral_type,mass,rad_hard,details) 
select id, name, 
case when right(id,1)='F' then 0 else 1 end side,
'thruster', 'base' `type`, -- `type`,
-- case when isru_missile=1 then 'missile'
-- 	when isru_raygun=1 then 'raygun'
-- 	when isru_buggy=1 then 'buggy'
-- end `type`,
-- CONCAT_WS('/',
--    CASE WHEN type_x THEN 'X' END,
--    CASE WHEN type_o THEN 'O' end,
--    CASE WHEN type_b THEN 'B' end
--  ) as `type`,
spectral_type,
-- concat(mass_l,'/',mass_h) mass,
-- concat(rad_hard_l,'/',rad_hard_h) rad_hard, 
mass,rad_hard,
json_object('thrust',thrust,'fuel_consumption',fuel_consumption,
'fuel_type',fuel_type,
'bonus_pivots',bonus_pivots,
-- json_object('promotion_colony', promotion_colony, 'thrust', thrust, 'fuel_consumption',fuel_consumption,
'afterburn',afterburn,
'push',push,
-- 'required_generators',required_generators,
-- 'required_reactor',required_reactor,
-- 'required_therms',required_therms,
-- json_object('air_eater', air_eater, -- 'fuel_consumption_modifier',fuel_consumption_modifier,
'generator_p',generator_p,
'generator_e',generator_e,
'reactor_x',reactor_x,
'reactor_o',reactor_o,
'reactor_b',reactor_b,
-- 'required_generator',required_generator,
-- 'required_reactor',required_reactor,
'therms',therms,
'solar',solar,
-- 'isru',isru,
-- 'support_generator_p',support_generator_p,
-- 'support_reactor_x',support_reactor_x,
-- 'support_reactor_o',support_reactor_o,
-- 'support_reactor_b',support_reactor_b,
-- 'future',future
'ability',ability
) as details
-- t.*
from hf_thrusters t;

update hf_all set module=2 where component='bernal'; 
update hf_all set module=1 where component='freighter'; 
update hf_all set module=1 where component='thruster' and `type` != 'base'; 


/**
 * Query per SQLite
 */
CREATE TABLE "patents" (
	id text primary key,
	name text,
	side integer,
	component text,
	"type" text,
	spectral_type text,
	mass text,
	rad_hard text,
	required text,
	module text,
	details text
);

