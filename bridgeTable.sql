CREATE DATABASE myrecipies;

CREATE TABLE recipe (
    id SERIAL PRIMARY KEY,
    recipeName VARCHAR(55) 
);

CREATE TABLE ingredient (
    id SERIAL PRIMARY KEY,
    ingredientName VARCHAR(55) 
);

CREATE TABLE IngredientInRecipe (
    id SERIAL PRIMARY KEY,
    recipeId INTEGER,
    ingredientId INTEGER,
    FOREIGN KEY (recipeId) REFERENCES recipe(id),
    FOREIGN KEY (ingredientId) REFERENCES ingredient(id)
);

INSERT INTO recipe (recipeName) VALUES ('Pumpkin Pasties');

INSERT INTO recipe (recipeName) VALUES ('Pumpkin Tartlets');

INSERT INTO recipe (recipeName) VALUES ('Creamy Pumpkin Soup');


INSERT INTO ingredient (ingredientName) VALUES ('pumpkin puree');

INSERT INTO ingredient (ingredientName) VALUES ('sugar');

INSERT INTO ingredient (ingredientName) VALUES ('cinnamon');

INSERT INTO ingredient (ingredientName) VALUES ('nutmeg');

INSERT INTO ingredient (ingredientName) VALUES ('cloves');

INSERT INTO ingredient (ingredientName) VALUES ('Pastry dough');

INSERT INTO ingredient (ingredientName) VALUES ('Egg wash (1 egg beaten with a splash of milk)');

INSERT INTO ingredient (ingredientName) VALUES ('brown sugar');

INSERT INTO ingredient (ingredientName) VALUES ('ginger');

INSERT INTO ingredient (ingredientName) VALUES ('Mini tart shells');

INSERT INTO ingredient (ingredientName) VALUES ('Whipped cream for garnish');

INSERT INTO ingredient (ingredientName) VALUES ('onion, chopped');

INSERT INTO ingredient (ingredientName) VALUES ('garlic, minced');

INSERT INTO ingredient (ingredientName) VALUES ('vegetable broth');

INSERT INTO ingredient (ingredientName) VALUES ('heavy cream');

INSERT INTO ingredient (ingredientName) VALUES ('Salt and pepper to taste');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '1');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '2');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '3');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '4');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '5');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '6');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('1', '7');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '1');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '8');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '9');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '3');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '4');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '10');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('2', '11');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('3', '1');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('3', '12');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('3', '5');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('3', '14');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('3', '15');

INSERT INTO ingredientinrecipe (recipeId,ingredientId) VALUES ('3', '16');

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Pasties' AND b.ingredientname = 'cloves';

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Pasties' AND b.ingredientname = 'Pastry dough';

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Pasties' AND b.ingredientname = 'Egg wash (1 egg beaten with a splash of milk)';

INSERT INTO ingredientinrecipe (recipeid, ingredientid)
SELECT a.id, b.id
FROM recipe a
JOIN ingredient b 
ON a.recipeName = 'Pumpkin Tartlets' AND b.ingredientname = 'pumpkin puree';

näidis postgre user on default postgres ja parool S.....1
\l - andmebaaside list
\c andmebaasi nimi (connect andmebaasi)
\dt - data tables
PGPASSWORD=ihLn3ZybpapM6BOL1jevMabVjU4H3uUU psql -h dpg-clhqtm4ig7qc73cvdsk0-a.oregon-postgres.render.com -U myrecipes_qr1r_user myrecipes_qr1r
SELECT * FROM tabeli nimetus;  kuvab tabeli sisu

DROP TABLE ingredient CASCADE;

SELECT id, recipeName, instructions FROM recipe ORDER BY RANDOM() LIMIT 1; (SUVAISE RETSEPTI VALIK )
SELECT b.ingredientName FROM ingredient b INNER JOIN IngredientInRecipe c ON b.id = c.ingredientId WHERE c.recipeId = 1;

SELECT * from recipe;

DELETE from recipe WHERE id = 2;

SELECT a.recipeName, b.ingredientName FROM recipe a
INNER JOIN IngredientInRecipe c
ON a.id = c.recipeId
INNER JOIN ingredient b
ON b.id = c.ingredientId;


ALTER TABLE recipe ADD COLUMN instructions text;


SELECT a.recipeName, b.ingredientName FROM recipe a INNER JOIN IngredientInRecipe c ON a.id = c.recipeId INNER JOIN ingredient b ON b.id = c.ingredientId;

UPDATE recipe
SET instructions =
'<br>"Mix pumpkin puree, sugar, and spices in a bowl.",
<br>"Roll out the pastry dough and cut it into small circles.",
<br>"Place a spoonful of the pumpkin mixture in the center of each circle.",
<br>"Fold the dough over to create a half-moon shape and crimp the edges with a fork.",
<br>"Brush the pasties with egg wash.",
<br>"Bake at 375°F (190°C) for 20-25 minutes or until golden brown."'
WHERE id = 1;

UPDATE recipe
SET instructions =
'<br>"Mix pumpkin puree, brown sugar, and spices in a bowl.",
<br>"Spoon the mixture into mini tart shells.",
<br>"Bake at 350°F (175°C) for 15-20 minutes or until set.",
<br> "Let cool and garnish with whipped cream."'
WHERE id = 2;

UPDATE recipe
SET instructions =
'<br>"Sauté the onion and garlic in a pot until soft.",
<br>"Add the pumpkin puree and vegetable broth, and simmer for 20 minutes.",
<br>"Blend the soup until smooth, then return it to the pot.",
<br>"Stir in the heavy cream and season with salt and pepper.",
<br>"Heat through and serve."'
WHERE id = 3;

SELECT a.recipeName, a.instructions, b.ingredientName FROM recipe a INNER JOIN IngredientInRecipe c ON a.id = c.recipeId INNER JOIN ingredient b ON b.id = c.ingredientId WHERE a.recipeName = 'Pumpkin Tartlets';

localhost:3003/fullRecipes/search?recipeName=Pumpkin%20Tartlets

node -- server watch .js
npm i dotenv