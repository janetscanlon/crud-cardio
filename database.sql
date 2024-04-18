-- These two lines make it so that every single SQL query in
-- this file can be ran all at once to "reset" the database:
DROP TRIGGER IF EXISTS "on_things_update" ON "things";
DROP TABLE IF EXISTS "books";

-- Table Schema Template:
CREATE TABLE "books" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(500) NOT NULL,
  "pages" INTEGER,
  "completed" BOOLEAN DEFAULT FALSE
);

-- Seed Data Template:
INSERT INTO "books"
  ("title","pages", "completed")
  VALUES
  ('The Crimson Moth', 400, true),
  ('What Is Dark Within Me', 300, false);
  
-- Creates a trigger that handles the updated_at magic:
  -- https://x-team.com/blog/automatic-timestamps-with-postgresql/
CREATE OR REPLACE FUNCTION set_updated_at_to_now()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER on_things_update
BEFORE UPDATE ON "things"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at_to_now();
