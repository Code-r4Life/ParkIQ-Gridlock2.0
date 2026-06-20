CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE violations (

    id TEXT PRIMARY KEY,

    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,

    location TEXT,

    vehicle_number TEXT,
    vehicle_type TEXT,

    violation_type TEXT,
    offence_code TEXT,

    created_datetime TIMESTAMPTZ,
    modified_datetime TIMESTAMPTZ,

    device_id TEXT,
    created_by_id TEXT,

    center_code DOUBLE PRECISION,

    police_station TEXT,

    data_sent_to_scita BOOLEAN,

    junction_name TEXT,

    data_sent_to_scita_timestamp TIMESTAMPTZ,

    updated_vehicle_number TEXT,
    updated_vehicle_type TEXT,

    validation_status TEXT,

    validation_timestamp TIMESTAMPTZ,

    hour DOUBLE PRECISION,
    day_of_week TEXT,
    month DOUBLE PRECISION,

    weekend BOOLEAN,
    peak_hour BOOLEAN
);

ALTER TABLE violations
ADD COLUMN geom GEOMETRY(Point,4326);

CREATE INDEX violations_geom_idx
ON violations
USING GIST(geom);