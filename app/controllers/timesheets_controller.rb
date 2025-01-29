require 'date'

class TimesheetsController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:project_id])
    @timesheets = Timesheet.where(project: params[:project_id])
    @timesheet = Timesheet.new
    @timesheet.project = @project
  end

  def show
    @timesheet = Timesheet.find(params[:id])
  end

  # take new out of routes for timesheets - will be doing within index page

  def create
    @project = Project.find(params[:project_id])
    @timesheet = Timesheet.new
    @timesheet.project = @project
    @timesheet.start_date = DateTime.now
    if @timesheet.save
      redirect_to client_project_timesheets_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
