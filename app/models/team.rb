# class Team < ActiveRecord::Base
#     has_many :heros
# end

class Team
    attr_reader :name, :motto

    def initialize(name:, motto:)
        @name = name 
        @motto = motto
    end
end