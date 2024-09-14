CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name AS name, sizes.size AS size
  FROM dogs, sizes
  WHERE sizes.min < dogs.height AND dogs.height <= sizes.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT parents.child
  FROM parents, dogs
  WHERE parents.parent = dogs.name 
  ORDER BY dogs.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT parents1.child AS sibling1, parents2.child as sibling2
  FROM parents AS parents1, parents AS parents2
  WHERE parents1.parent = parents2.parent AND parents1.child < parents2.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 'The two siblings, ' || siblings.sibling1 || ' plus ' || siblings.sibling2 || ' have the same size: ' 
            || size_of_dogs1.size
  FROM siblings, size_of_dogs AS size_of_dogs1, size_of_dogs AS size_of_dogs2
  WHERE siblings.sibling1 = size_of_dogs1.name AND siblings.sibling2 = size_of_dogs2.name 
        AND size_of_dogs1.size = size_of_dogs2.size;



