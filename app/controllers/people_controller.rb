class PeopleController < ApplicationController
  def search
    term = '%' + params[:name].strip + '%'
    conditions = ["preferredName like ? OR firstName like ? OR lastName like ? OR concat(firstname, ' ', lastname) like ? OR concat(preferredName, ' ', lastname) like ?", term, term, term, params[:name].strip + '%', params[:name].strip + '%']
    @people = Person.where(conditions).limit(50).order('lastName, preferredName')
    @total = Person.where(conditions).count
    render :layout => false
  end
  
  def show
    @person = Person.find(params[:id])
    render :layout => false
  end

end
