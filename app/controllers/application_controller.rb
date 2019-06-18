require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :'teams/new'
    end

    post '/teams' do
        binding.pry
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        binding.pry
        params[:team][:members].each do |member|
            @hero = Hero.new(member)
            @hero.team = @team
            @hero.save
        end

        @heros = Hero.all
        
        erb :'teams/show'
    end
end
