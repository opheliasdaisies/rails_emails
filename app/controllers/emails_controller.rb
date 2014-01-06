class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])
    if @email.save
      redirect_to "/emails"
    else
      render "new"
    end
  end

  def show
    @email = Email.find(params[:id])
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    if @email.update_attributes(params[:email])
      redirect_to @email
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to emails_url
  end
end