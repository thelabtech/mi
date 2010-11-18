class PeopleController < ApplicationController
  def search
    query = params[:name].strip.split(' ')
    first, last = query[0].to_s + '%', query[1].to_s + '%'
    if last == '%'
      conditions = ["preferredName like ? OR firstName like ? OR lastName like ?", first, first, first]
    else
      conditions = ["(preferredName like ? OR firstName like ?) AND lastName like ?", first, first, last]
    end
    @people = Person.where(conditions).order('lastName, firstName').paginate(:page => params[:page], :per_page => 50)
    render :layout => false
  end
  
  def show
    @person = Person.find(params[:id])
    render :layout => false
  end

end
