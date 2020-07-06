class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create!(object: Faker::Book.title, body: Faker::RickAndMorty.quote, read: false)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])

    # Mark an email as read
    @email.update!(read: true)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])

    # Change email status
    @email.update!(read: !@email.read)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end

