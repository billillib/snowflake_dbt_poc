-- create database
create or replace database reddit;

use reddit;

-- file format
create or replace file format myjsonformat
  type = 'JSON'
  strip_outer_array = true;

-- stage
create or replace stage my_json_stage
  file_format = myjsonformat
  url = 's3://myredditkinesiss3bucket';


-- TABLE
create or replace table reddit_raw
    (response variant)
;

-- copy
copy into reddit_raw
  from @my_json_stage/2019/02/
  on_error = 'skip_file';
