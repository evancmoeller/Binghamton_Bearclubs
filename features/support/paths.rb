# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
      when (/^the "Welcome Page"$/)
        welcome_login_path
        
      when (/^the "Dashboard Page"$/) 
        dashboard_index_path
      
      when (/^the "User Show Page" for "(.*)"$/)
        user_path(User.find_by_name($1))
        
      when (/^the "User Edit Page" for "(.*)"$/)
        edit_user_path(User.find_by_name($1))
      
      when (/^the "Clubs Page"$/)
        clubs_path
        
      when (/the "Create New Club Page"$/)
        new_club_path
        
      when (/^the "Club Show Page" for "(.*)"$/)
        club_path(Club.find_by_name($1))
        
      when (/^the "Club Edit Page" for "(.*)"$/)
        edit_club_path(Club.find_by_name($1))
        
      when(/^the "Events Page" for "(.*)"$/)
        club_events_path(Club.find_by_name($1))
        
      when (/^the "Create New Event Page" for "(.*)"$/)
        new_club_event_path(Club.find_by_name($1))
        
      when (/^the "Event Show Page" for "(.*)" in "(.*)"$/)
        club_event_path(Club.find_by_name($2), Event.find_by_name($1))
        
      when (/^the "Event Edit Page" for "(.*)" in "(.*)"$/)
        edit_club_event_path(Club.find_by_name($2), Event.find_by_name($1))

      when (/^the "Failure Page"$/)
        auth_failure_path
        
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
