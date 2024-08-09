-- ---------------------------------- Erzeugung
CREATE INDEX ix_actor_firstName ON Actor(first_name);

CREATE INDEX ix_actor_fn_ln ON Actor(first_name,last_Name);

-- ---------------------------------- SUCHE ONHE INDEX / SUCHE MIT INDEX
SELECT	*
FROM	Actor;		-- 52790

SELECT	first_Name
FROM	Actor; 		-- 38080

SELECT	first_Name
		,last_Name
FROM	Actor; 		-- 32290		mit IX

SELECT	last_Name
		,first_Name
FROM	Actor; 		-- 39240		ohne IX



drop index idx_actor_last_name ON actor;