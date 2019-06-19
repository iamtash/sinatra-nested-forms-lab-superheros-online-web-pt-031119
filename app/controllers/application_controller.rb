require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :'teams/new'
    end

    post '/teams' do
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        
        params[:team][:members].each do |member|
            @hero = Hero.new(name: member[:name], power: member[:power], bio: member[:bio])
        end
        
        @heroes = Hero.all

        erb :'teams/show'
    end

end

