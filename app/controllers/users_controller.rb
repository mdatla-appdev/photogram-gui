class UsersController < ApplicationController
  def home 
  
    redirect_to("/users")
  end


  def index
   matching_users = User.all

   @list_of_users = matching_users.order({ :username => :asc })

    render ({ :template => "user_templates/index.html.erb"})

  end

  def show 
  url_username = params.fetch("path_username")
  
  matching_username = User.where ({ :username => url_username})

  @the_user = matching_username.at(0)

  # if the_user == nil 
   # redirect_to ("/")
 #  else
    render ({ :template => "user_templates/show.html.erb"})
 # end
end

def create
 # Parameters: {"query_username"=>"mdatla"}
 
 input_username = params.fetch("query_username")

 
 a_new_user = User.new

a_new_user.username =  input_username 

 a_new_user.save

 next_url = "/users/" + a_new_user.username.to_s
 
 redirect_to(next_url)
 
  # render({ :template => "user_templates/create.html.erb"})
end

def update
  #  Parameters: {"query_username"=>"mdatla", "modify_user"=>"122"}


  the_id = params.fetch("modify_user")

  matching_users = User.where({ :id => the_id})

  the_user = matching_users.at(0)

input_username = params.fetch("query_username")

the_user.username = input_username

the_user.save

next_url = "/users/" + the_user.username.to_s
redirect_to(next_url)
#  render({ :template => "user_templates/update.html.erb"})
end
end
