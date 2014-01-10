class ReportsController < Admin::ApplicationController
  layout 'application'
  def create
  	@report = Report.new(report_params)
  	@report.save
  	redirect_to @report, notice: 'Created'
  end

  def update
  	@report = Report.find params[:id]
    # raise @report.inspect
  	panel_id = @report.panel_id
  	org_rank = @report.rank
  	new_rank = report_params[:rank].to_i
  	panel = Report.where("panel_id = ?", panel_id)
  	@report.update(report_params)
    @report.update(:former_rank => org_rank)
  	panel.each do |report|
  		next if report == @report
  			hash = {}
  			if new_rank <= report.rank.to_i && report.rank.to_i < org_rank
  				report.rank += 1

  			elsif org_rank < report.rank.to_i && report.rank.to_i <= new_rank
  				report.rank -=1
  				
  			end
  		hash[:rank]=report.rank
  		report.update(hash)
  		end
  	redirect_to panel_reports_path(panel_id)
  end

  def index
  	@reports = Report.where("panel_id = ?", params[:panel_id]).order(:rank)
  	respond_to do |format|
  		format.html
  		format.csv { send_data @reports.to_csv }
  	end
  end


  def show
    @reports = Report.find(:panel_id)
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
  	params.require(:report).permit(:application_number, :applicant_name, :applicant_level, :avg_z_score,
  									:quality_group, :rank, :reviewer_1, :raw_score_1, :z_score_1,
  									:reviewer_2, :raw_score_2, :z_score_2,
  									:reviewer_3, :raw_score_3, :z_score_3,
  									:reviewer_4, :raw_score_4, :z_score_4, :panel_id)
  end

end

