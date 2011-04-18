require 'arid_cache'

class CustomName < ActiveRecord::Base
  set_table_name :custom_table_name
  set_primary_key :custom_pk_id
end
