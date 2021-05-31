class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
    authorize(@doctor)
  end

  # def show
  #   @doctor = Doctor.find(params[:id])
  # end

  def create
    @doctor = Doctor.new(doctor_params)
    authorize(@doctor)
    if @doctor.save
      redirect_to profile_path(@doctor)
    else
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
    authorize(@doctor)
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    authorize(@doctor)
    redirect_to profile_path(@doctor)
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to profile_path(@doctor)
  end

  # if saved
  #     redirect_to timeline_path(anchor: "consultation_#{@consultation.id}", params: { choice: 'consultation', focus: "consultation_#{@consultation.id}" })
  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty, :phone_number, :address, :email)
  end

end

