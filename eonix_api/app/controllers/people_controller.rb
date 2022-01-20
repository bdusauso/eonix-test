class PeopleController < ApplicationController
  def index
    people = Person.by_name(params[:name])

    render json: people, status: 200
  end

  def create
    person = Person.create!(person_params)

    render json: person, status: 201
  end

  def update
    person = Person.find(params[:id])
    person.update(person_params)

    render json: person, status: 201
  end

  def destroy
    person = Person.find(params[:id])
    status = 
      if person
        person.destroy
        200
      else
        404
      end

    render json: {}, status: status
  end

  private
  
  def person_params
    params.require(:person).permit(:firstname, :lastname)
  end
end
