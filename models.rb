require 'mongoid'


Mongoid.load!("mongoid.yml", :development)

class Programme
  include Mongoid::Document

  field :daad_id, type: Integer

  field :uni_logo, type: String
  field :uni_poster, type: String
  field :uni_reg, type: String

  field :overview, type: String
  field :prog_title, type: String
end


