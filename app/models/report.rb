class Report < ActiveRecord::Base

	def self.to_csv(options ={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |report|
				csv << report.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Report.create(panel: row[0], closing: row[1], status: row[2])
		end
	end
end
