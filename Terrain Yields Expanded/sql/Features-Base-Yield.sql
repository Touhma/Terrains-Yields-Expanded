DELETE FROM Feature_YieldChanges;

INSERT OR IGNORE INTO Feature_YieldChanges
		(FeatureType,YieldType,YieldChange)
VALUES	
-- Oasis
		('FEATURE_OASIS','YIELD_FOOD',3),
-- Marsh
		('FEATURE_MARSH','YIELD_FOOD',1),
		('FEATURE_MARSH','YIELD_PRODUCTION',1),
-- Reefs 
		('FEATURE_REEF','YIELD_FOOD',1),
		('FEATURE_REEF','YIELD_SCIENCE',3),
-- Geothermal
		('FEATURE_GEOTHERMAL_FISSURE','YIELD_SCIENCE',3),
		('FEATURE_GEOTHERMAL_FISSURE','YIELD_PRODUCTION',1),
-- Jungle
		('FEATURE_JUNGLE','YIELD_FOOD',2),
-- Forest
		('FEATURE_FOREST','YIELD_PRODUCTION',2),
-- FoodPlains
		('FEATURE_FLOODPLAINS','YIELD_FOOD',2),
		('FEATURE_FLOODPLAINS_GRASSLAND','YIELD_FOOD',1),
		('FEATURE_FLOODPLAINS_PLAINS','YIELD_PRODUCTION',1),
-- Volcanic Soil 
		('FEATURE_VOLCANIC_SOIL','YIELD_FOOD',2),
		('FEATURE_VOLCANIC_SOIL','YIELD_PRODUCTION',1);
		
-- Natural Wonders 
INSERT OR IGNORE INTO Feature_YieldChanges
		(FeatureType,YieldType,YieldChange)
VALUES	('FEATURE_BARRIER_REEF','YIELD_FOOD',3),
		('FEATURE_BARRIER_REEF','YIELD_SCIENCE',2),
		('FEATURE_BARRIER_REEF','YIELD_GOLD',1),
		('FEATURE_CHOCOLATEHILLS','YIELD_PRODUCTION',2),
		('FEATURE_CHOCOLATEHILLS','YIELD_FOOD',1),
		('FEATURE_CHOCOLATEHILLS','YIELD_SCIENCE',1),
		('FEATURE_CLIFFS_DOVER','YIELD_CULTURE',3),
		('FEATURE_CLIFFS_DOVER','YIELD_GOLD',2),
		('FEATURE_CRATER_LAKE','YIELD_SCIENCE',1),
		('FEATURE_CRATER_LAKE','YIELD_FAITH',4),
		('FEATURE_DEAD_SEA','YIELD_CULTURE',2),
		('FEATURE_DEAD_SEA','YIELD_FAITH',2),
		('FEATURE_EYE_OF_THE_SAHARA','YIELD_PRODUCTION',2),
		('FEATURE_EYE_OF_THE_SAHARA','YIELD_SCIENCE',1),
		('FEATURE_FOUNTAIN_OF_YOUTH','YIELD_SCIENCE',4),
		('FEATURE_FOUNTAIN_OF_YOUTH','YIELD_FAITH',4),
		('FEATURE_GOBUSTAN','YIELD_PRODUCTION',1),
		('FEATURE_GOBUSTAN','YIELD_CULTURE',3),
		('FEATURE_HA_LONG_BAY','YIELD_PRODUCTION',1),
		('FEATURE_HA_LONG_BAY','YIELD_FOOD',3),
		('FEATURE_HA_LONG_BAY','YIELD_CULTURE',1),
		('FEATURE_LAKE_RETBA','YIELD_PRODUCTION',1),
		('FEATURE_LAKE_RETBA','YIELD_GOLD',2),
		('FEATURE_LAKE_RETBA','YIELD_CULTURE',2),
		('FEATURE_PANTANAL','YIELD_FOOD',2),
		('FEATURE_PANTANAL','YIELD_CULTURE',2),
		('FEATURE_WHITEDESERT','YIELD_SCIENCE',1),
		('FEATURE_WHITEDESERT','YIELD_CULTURE',1),
		('FEATURE_WHITEDESERT','YIELD_GOLD',4),		
		('FEATURE_UBSUNUR_HOLLOW','YIELD_FOOD',1),
		('FEATURE_UBSUNUR_HOLLOW','YIELD_PRODUCTION',1),
		('FEATURE_UBSUNUR_HOLLOW','YIELD_FAITH',2);

--INSERT OR IGNORE INTO Feature_YieldChanges
--			(FeatureType,YieldType,YieldChange)
--VALUES	('FEATURE_BARRIER_REEF','YIELD_FOOD',3),
--			('FEATURE_BARRIER_REEF','YIELD_SCIENCE',2),
--			('FEATURE_BARRIER_REEF','YIELD_GOLD',1),
--			('FEATURE_CHOCOLATEHILLS','YIELD_PRODUCTION',2),
--			('FEATURE_CHOCOLATEHILLS','YIELD_FOOD',1),
--			('FEATURE_CHOCOLATEHILLS','YIELD_CULTURE',2),
--			('FEATURE_CLIFFS_DOVER','YIELD_CULTURE',3),
--			('FEATURE_CLIFFS_DOVER','YIELD_FOOD',1),
--			('FEATURE_CLIFFS_DOVER','YIELD_GOLD',1),
--			('FEATURE_CRATER_LAKE','YIELD_SCIENCE',1),
--			('FEATURE_CRATER_LAKE','YIELD_FAITH',4),
--			('FEATURE_DEAD_SEA','YIELD_CULTURE',2),
--			('FEATURE_DEAD_SEA','YIELD_FAITH',2),
--			('FEATURE_DEAD_SEA','YIELD_GOLD',1),
--			('FEATURE_EYE_OF_THE_SAHARA','YIELD_PRODUCTION',2),
--			('FEATURE_EYE_OF_THE_SAHARA','YIELD_SCIENCE',2),
--			('FEATURE_EYE_OF_THE_SAHARA','YIELD_GOLD',1),
--			('FEATURE_FOUNTAIN_OF_YOUTH','YIELD_SCIENCE',3),
--			('FEATURE_FOUNTAIN_OF_YOUTH','YIELD_FAITH',2),
--			('FEATURE_GOBUSTAN','YIELD_SCIENCE',1),
--			('FEATURE_GOBUSTAN','YIELD_PRODUCTION',1),
--			('FEATURE_GOBUSTAN','YIELD_CULTURE',3),
--			('FEATURE_HA_LONG_BAY','YIELD_PRODUCTION',1),
--			('FEATURE_HA_LONG_BAY','YIELD_FOOD',2),
--			('FEATURE_HA_LONG_BAY','YIELD_CULTURE',2),
--			('FEATURE_LAKE_RETBA','YIELD_PRODUCTION',1),
--			('FEATURE_LAKE_RETBA','YIELD_GOLD',2),
--			('FEATURE_LAKE_RETBA','YIELD_CULTURE',2),
--			('FEATURE_PANTANAL','YIELD_FOOD',3),
--			('FEATURE_PANTANAL','YIELD_CULTURE',2),
--			('FEATURE_WHITEDESERT','YIELD_SCIENCE',1),
--			('FEATURE_WHITEDESERT','YIELD_CULTURE',1),
--			('FEATURE_WHITEDESERT','YIELD_GOLD',3),		
--			('FEATURE_UBSUNUR_HOLLOW','YIELD_FOOD',1),
--			('FEATURE_UBSUNUR_HOLLOW','YIELD_PRODUCTION',2),
--			('FEATURE_UBSUNUR_HOLLOW','YIELD_FAITH',2);
		