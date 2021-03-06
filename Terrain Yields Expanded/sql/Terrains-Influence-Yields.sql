-- Define new requirement set for desert adjacency

--INSERT INTO Requirements (RequirementId, RequirementType,Inverse) 
--VALUES ('REQUIRES_PLOT_ADJACENT_TO_DESERT_PLAIN', 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES', 0),
--	   ('REQUIRES_PLOT_ADJACENT_TO_DESERT_HILL', 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES', 0),
--	   ('REQUIRES_PLOT_ADJACENT_TO_DESERT',	'REQUIREMENT_REQUIREMENTSET_IS_MET', 0);

--INSERT INTO RequirementArguments (RequirementId, Name, Value)
--VALUES	('REQUIRES_PLOT_ADJACENT_TO_DESERT_PLAIN', 'TerrainType', 'TERRAIN_DESERT'),
--		('REQUIRES_PLOT_ADJACENT_TO_DESERT_HILL', 'TerrainType', 'TERRAIN_DESERT_HILLS'),
--		('REQUIRES_PLOT_ADJACENT_TO_DESERT', 'RequirementSetId', 'PLOT_IS_ADJACENT_TO_DESERT_REQUIREMENT');

--INSERT OR IGNORE INTO RequirementSets
--		(RequirementSetId,RequirementSetType)
--VALUES	('PLOT_IS_ADJACENT_TO_DESERT_REQUIREMENT','REQUIREMENTSET_TEST_ANY');
--
--INSERT OR IGNORE INTO RequirementSetRequirements
--		(RequirementSetId, RequirementId)
--VALUES  ('PLOT_IS_ADJACENT_TO_DESERT_REQUIREMENT','REQUIRES_PLOT_ADJACENT_TO_DESERT_PLAIN'),
--		('PLOT_IS_ADJACENT_TO_DESERT_REQUIREMENT','REQUIRES_PLOT_ADJACENT_TO_DESERT_HILL');

-- Requirement for tundra adjacency

--INSERT INTO Requirements (RequirementId, RequirementType, Inverse) 
--VALUES ('REQUIRES_PLOT_ADJACENT_TO_TUNDRA_PLAIN', 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES', 0),
--	   ('REQUIRES_PLOT_ADJACENT_TO_TUNDRA_HILL', 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES', 0),
--	   ('REQUIRES_PLOT_ADJACENT_TO_TUNDRA',	'REQUIREMENT_REQUIREMENTSET_IS_MET', 0);

--INSERT INTO RequirementArguments (RequirementId, Name, Value)
--VALUES	('REQUIRES_PLOT_ADJACENT_TO_TUNDRA_PLAIN', 'TerrainType', 'TERRAIN_TUNDRA'),
--		('REQUIRES_PLOT_ADJACENT_TO_TUNDRA_HILL', 'TerrainType', 'TERRAIN_TUNDRA_HILLS'),
--		('REQUIRES_PLOT_ADJACENT_TO_TUNDRA', 'RequirementSetId', 'PLOT_IS_ADJACENT_TO_TUNDRA_REQUIREMENT');

--INSERT OR IGNORE INTO RequirementSets
--		(RequirementSetId,RequirementSetType)
--VALUES	('PLOT_IS_ADJACENT_TO_TUNDRA_REQUIREMENT','REQUIREMENTSET_TEST_ANY');

--INSERT OR IGNORE INTO RequirementSetRequirements
--		(RequirementSetId, RequirementId)
--VALUES  ('PLOT_IS_ADJACENT_TO_TUNDRA_REQUIREMENT','REQUIRES_PLOT_ADJACENT_TO_TUNDRA_PLAIN'),
--		('PLOT_IS_ADJACENT_TO_TUNDRA_REQUIREMENT','REQUIRES_PLOT_ADJACENT_TO_TUNDRA_HILL');

-- Requirement for snow adjacency
-- INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) 
-- VALUES ('REQUIRES_PLOT_ADJACENT_TO_SNOW_PLAIN', 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES', 0),
-- 	   ('REQUIRES_PLOT_ADJACENT_TO_SNOW_HILL', 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES', 0),
-- 	   ('REQUIRES_PLOT_ADJACENT_TO_SNOW',	'REQUIREMENT_REQUIREMENTSET_IS_MET', 0);

-- INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
-- VALUES	('REQUIRES_PLOT_ADJACENT_TO_SNOW_PLAIN', 'TerrainType', 'TERRAIN_SNOW'),
-- 		('REQUIRES_PLOT_ADJACENT_TO_SNOW_HILL', 'TerrainType', 'TERRAIN_SNOW_HILLS'),
-- 		('REQUIRES_PLOT_ADJACENT_TO_SNOW', 'RequirementSetId', 'PLOT_IS_ADJACENT_TO_SNOW_REQUIREMENT');

-- INSERT OR IGNORE INTO RequirementSets
-- 		(RequirementSetId,RequirementSetType)
-- VALUES	('PLOT_IS_ADJACENT_TO_SNOW_REQUIREMENT','REQUIREMENTSET_TEST_ANY');

-- INSERT OR IGNORE INTO RequirementSetRequirements
-- 		(RequirementSetId, RequirementId)
-- VALUES  ('PLOT_IS_ADJACENT_TO_SNOW_REQUIREMENT','REQUIRES_PLOT_ADJACENT_TO_SNOW_PLAIN'),
-- 		('PLOT_IS_ADJACENT_TO_SNOW_REQUIREMENT','REQUIRES_PLOT_ADJACENT_TO_SNOW_HILL');

-- Requirements
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) 
VALUES	('REQUIRES_PLOT_IS_NOT_LAKE', 'REQUIREMENT_PLOT_IS_LAKE', 1),
		('REQUIRES_PLOT_IS_TERRAIN_AROUND_LAKE', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0),
		('REQUIRES_PLOT_IS_ADJACENT_TO_RIVER', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0),
		('REQUIRES_PLOT_IS_LAND_ADACENT_TO_COAST', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0);

INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,RequirementSetType)
VALUES	('PLOT_IS_COAST_TERRAIN_REQUIREMENTS','REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_TERRAIN_AROUND_LAKE_REQUIREMENTS','REQUIREMENTSET_TEST_ALL'),
		('PLOT_WATER_FOOD_BOOST_REQUIREMENTS','REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES	('REQUIRES_PLOT_IS_TERRAIN_AROUND_LAKE', 'RequirementSetId', 'PLOT_IS_TERRAIN_AROUND_LAKE_REQUIREMENTS'),
		('REQUIRES_PLOT_IS_ADJACENT_TO_RIVER', 'RequirementSetId', 'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS'),
		('REQUIRES_PLOT_IS_LAND_ADACENT_TO_COAST', 'RequirementSetId', 'PLOT_IS_COAST_TERRAIN_REQUIREMENTS');

INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId, RequirementId)
VALUES  ('PLOT_IS_COAST_TERRAIN_REQUIREMENTS','PLOT_IS_COASTAL_LAND'),
		('PLOT_IS_TERRAIN_AROUND_LAKE_REQUIREMENTS','REQUIRES_PLOT_ADJACENT_TO_LAKE'),
		('PLOT_IS_TERRAIN_AROUND_LAKE_REQUIREMENTS','REQUIRES_PLOT_IS_NOT_LAKE'),
		('PLOT_WATER_FOOD_BOOST_REQUIREMENTS','REQUIRES_PLOT_IS_TERRAIN_AROUND_LAKE'),
		('PLOT_WATER_FOOD_BOOST_REQUIREMENTS','REQUIRES_PLOT_IS_ADJACENT_TO_RIVER'),
		('PLOT_WATER_FOOD_BOOST_REQUIREMENTS','REQUIRES_PLOT_IS_LAND_ADACENT_TO_COAST');

-- River , Coast and lakes add some food on adjacents tiles
INSERT OR IGNORE INTO GameModifiers
		(ModifierId)
VALUES	('WATER_FOOD_BOOST');

INSERT OR IGNORE INTO Modifiers
		(ModifierId, ModifierType,SubjectRequirementSetId)
VALUES	('WATER_FOOD_BOOST', 'MODIFIER_GAME_ADJUST_PLOT_YIELD', 'PLOT_WATER_FOOD_BOOST_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId, Name, Value)
VALUES	('WATER_FOOD_BOOST', 'Amount' , 1),
		('WATER_FOOD_BOOST', 'YieldType' , 'YIELD_FOOD');

-- Mountain give production on adjacents tiles
INSERT OR IGNORE INTO GameModifiers
		(ModifierId)
VALUES	('MOUNTAIN_PROD_BOOST');

INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,RequirementSetType)
VALUES	('PLOT_IS_ADJACENT_TO_MOUNTAIN_REQUIREMENTS','REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId, RequirementId)
VALUES  ('PLOT_IS_ADJACENT_TO_MOUNTAIN_REQUIREMENTS','REQUIRES_PLOT_ADJACENT_TO_MOUNTAIN');

INSERT OR IGNORE INTO Modifiers
		(ModifierId, ModifierType,SubjectRequirementSetId, Repeatable)
VALUES  ('MOUNTAIN_PROD_BOOST', 'MODIFIER_GAME_ADJUST_PLOT_YIELD', 'PLOT_IS_ADJACENT_TO_MOUNTAIN_REQUIREMENTS',0);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId, Name, Value)
VALUES	('MOUNTAIN_PROD_BOOST', 'Amount' , 1),
		('MOUNTAIN_PROD_BOOST', 'YieldType' , 'YIELD_PRODUCTION');