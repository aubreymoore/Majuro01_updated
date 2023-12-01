-- create_tables3.sql
-- Aubrey Moore 2023-11-22

CREATE TABLE images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    imagefile TEXT NOT NULL UNIQUE,
    geometry
);
SELECT RecoverGeometryColumn('images', 'geometry', 4326, 'POINT', 'XY');

CREATE TABLE boxes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   
    score REAL,
    damage_level INTEGER,
    ulx INTEGER,
    uly INTEGER,
    lrx INTEGER,
    lry INTEGER, 
    images_id INTEGER,
    geometry,
    FOREIGN KEY(images_id) REFERENCES images(id)
);
SELECT RecoverGeometryColumn('boxes', 'geometry', -1, 'POLYGON', 'XY');

CREATE TABLE polygons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  
    score REAL,
    polygon TEXT,
    ulx INTEGER,
    uly INTEGER,
    lrx INTEGER,
    lry INTEGER, 
    images_id INTEGER,
    geometry,
    FOREIGN KEY(images_id) REFERENCES images(id)
);
SELECT RecoverGeometryColumn('polygons', 'geometry', -1, 'POLYGON', 'XY');

CREATE TABLE intersections (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  
    boxes_id INTEGER,
    polygons_id INTEGER,
    FOREIGN KEY(boxes_id) REFERENCES boxes(id),
    FOREIGN KEY(polygons_id) REFERENCES polygons(id)
);
