class PanelsController < ApplicationController
	def create
  	@panel = Panel.new(report_params)
  	@panel.save
  	redirect_to @report, notice: 'Created'
  end

  def update
  	# shouldn't be updateing panel
  end


  def index
  	@panels= Panel.order(:name)
  	respond_to do |format|
  		format.html
  		format.csv { send_data @panels.to_csv }
  	end
  end

  def show
  end

  def edit
  	# shouldn't need to edit panel
  end

  def import
  	Panel.import(params[:file])
	redirect_to panels_path, notice: "Report imported."
  end

  private

  def report_params
  	params.require(:panel).permit(:name)
  end

end

