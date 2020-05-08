class ClubsController < ApplicationController
  def club_params
    # params.require(:club).permit(:name, :description, :subcategory, :category => derive_category(:subcategory))
    params.require(:club).permit(:name, :description, :category, :subcategory, :url, :image, :president, :vice_president)
  end
  
  def index
    
    @search = params[:search]
    
    @all_categories = Club.all_categories
    @all_subcategories = Club.all_categories.values.flatten
    
    @sort = params[:sort] || session[:sort]
    
    params_subcategories_bool = !(params[:subcategories].nil?) && params[:subcategories].is_a?(Hash) && params[:commit] == "Filter"
    @subcategories = params_subcategories_bool ? params[:subcategories].keys : (session[:subcategories] || @all_subcategories)
    @subcategories_selected = params_subcategories_bool ? params[:subcategories].keys : (session[:subcategories] || [])
    
    @clubs = []
    
    if params[:commit] == "Search"
      if Club.not_found?(@search)
        flash[:not_found] = "Sorry, a club with that name does not exist."
        redirect_to clubs_path
      else 
        @clubs = Club.search_by(@search)
      end
    else
      @clubs = Club.with_categories(@subcategories, @sort)
      
      if params[:sort] != session[:sort] || params[:subcategories] != session[:subcategories]
        session[:sort] = @sort
        session[:subcategories] = @subcategories
      end
      
      if (params[:sort].nil? and !(session[:sort].nil?)) or (params[:subcategories].nil? and !(session[:subcategories].nil?))
        flash.keep
        redirect_to clubs_path(sort: @sort, subcategories: @subcategories)
      end
    end
  end
  
  def new
  end
  
  def create
    @club = Club.create!(club_params)
    flash[:notice] = "You successfully created #{@club.name}."
    redirect_to clubs_path
  end
  
  def destroy
    @club = Club.find params[:id]
    @club.destroy
    flash[:notice] = "You successfully deleted #{@club.name}."
    redirect_to clubs_path
  end
  
  def edit
    @club = Club.find params[:id]
  end
  
  def update
    @club = Club.find params[:id]
    @club.update_attributes!(club_params)
    flash[:notice] = "You successfully updated #{@club.name}."
    redirect_to clubs_path
  end
  
  def show
    @club = Club.find params[:id]
  end
  
  def join
    @club = Club.find params[:id]
    @user = current_user
    @temp = @user.joined.to_s
    @clubs = @temp.split('.').map(&:to_i)
    
    if !(@clubs.include? params[:id].to_i)
      @clubs.push(params[:id].to_i)
      @temp = @clubs.sort.join('.')
      @user.joined = @temp
      @user.save
      
      flash[:notice] = "Congratulations, you are now a member of #{@club.name}!"
    else
      @clubs.delete(params[:id].to_i)
      @temp = @clubs.sort.join('.')
      @user.joined = @temp
      @user.save
      flash[:notice] = "You are no longer a member of #{@club.name}."
    end
    redirect_to club_path(@club)
  end
  
  helper_method :hide_join
  def hide_join 
    @user = current_user
    @temp = @user.joined.to_s
    @clubs = @temp.split('.').map(&:to_i)
    "hide_join" if (@clubs.include? params[:id].to_i)
  end
  
  helper_method :hide_leave
  def hide_leave 
    @user = current_user
    @temp = @user.joined.to_s
    @clubs = @temp.split('.').map(&:to_i)
    "hide_leave" if !(@clubs.include? params[:id].to_i)
  end
  
end
