SET search_path=v1;

CREATE TABLE IF NOT EXISTS configuration_systems (
  "name"      TEXT NOT NULL PRIMARY KEY,
  created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP WITH TIME ZONE,
  description TEXT,
  icon_class  TEXT NOT NULL DEFAULT 'fas fa-slider-h'
);

COMMENT ON TABLE configuration_systems IS 'Systems used for project configuration';
COMMENT ON COLUMN configuration_systems.name IS 'Configuration system name';
COMMENT ON COLUMN configuration_systems.created_at IS 'When the record was created at';
COMMENT ON COLUMN configuration_systems.modified_at IS 'When the record was last modified';
COMMENT ON COLUMN configuration_systems.description IS 'Description of the configuration system';
COMMENT ON COLUMN configuration_systems.icon_class IS 'Font Awesome UI icon class';

GRANT SELECT ON configuration_systems TO reader;
GRANT SELECT, INSERT, UPDATE, DELETE ON configuration_systems TO admin;
