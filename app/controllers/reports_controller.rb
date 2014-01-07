class ReportsController < ApplicationController

  def create
  	@report = Report.new(report_params)
  	@report.save
  	redirect_to @report, notice: 'Created'
  end

  def update
  	@report = Report.find params[:id]
  	@report.update(report_params)
  	# raise @report.inspect
  	redirect_to reports_path
  end

  def index
  	@reports = Report.order(:panel)
  	respond_to do |format|
  		format.html
  		format.csv { send_data @reports.to_csv }
  	end
  end

  def show
  end

  def edit
  	@report = Report.find(params[:id])
  end

  def import
  	Report.import(params[:file])
	redirect_to reports_path, notice: "Report imported."
  end

  private

  def report_params
  	params.require(:report).permit(:panel, :closing, :status, :panel_id)
  end

end

