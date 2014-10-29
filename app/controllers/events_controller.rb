class EventsController < ApplicationController
  def index
    @events = Event.sorted
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event =Event.new
  end

  def create


    # The 4 steps of form processing
    # 1) Instantiate a new object using form parameters
    # 2) Save the object
    # 3) if save succeds, redirec to the index action
    # 4) if save fails, redisplay the form so user can fix problems 
    @event = Event.new(subject_params)


      if @event.save
        flash[:notice] = "Event Created successfully"
      redirect_to(:action =>'index')
      else

      render('new')
      end

  end

  def edit

    @event = Event.find(params[:id])

  end

  def update


    @event = Event.find(params[:id])
  


      if @event.update_attributes(subject_params)

        flash[:notice] = "Event Updated successfully"
      redirect_to(:action =>'show', :id => @event.id)
      else

      render('edit')
      end

  end













  def delete

    @event = Event.find(params[:id])
  end

   def destroy

    event = Event.find(params[:id]).destroy

    flash[:notice] = "Event  '#{event.title}' destroyed successfully"
    redirect_to(:action =>'index')
  end



  private 

  def subject_params
    # It raises an error if email is not assigned
    # allows mass asign the fileds in permit
    params.require(:event).permit(:title,:description,:email,:category,:when,:where,:time)

  end


end
