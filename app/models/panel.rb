class Panel < ActiveRecord::Base
	has_many :reports

	def self.import(file)
		filename = file.original_filename.split(".").first
		p= Panel.create(name: filename)
		CSV.foreach(file.path, headers: true) do |row|
			Report.create(panel: row[0], closing: row[1], status: row[2], panel_id: p.id)
		end
	end
end
