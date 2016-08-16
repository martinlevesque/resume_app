class GeneralInfo < ApplicationRecord
  store :data, accessors: [ :about, :github, :display_name, :title, :meta_title, :meta_description, :meta_keywords ]
end
