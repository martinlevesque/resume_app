class GeneralInfo < ApplicationRecord
  store :data, accessors: [ :about, :github, :display_name, :title ]
end
