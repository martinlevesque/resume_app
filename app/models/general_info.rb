class GeneralInfo < ApplicationRecord
  store :data, accessors: [ :about, :github ]
end
