class Panel < ActiveRecord::Base
	has_many :reports


	def self.import(file)
		filename = file.original_filename.split(".").first
		p= Panel.create(name: filename)
		CSV.foreach(file.path, headers: true) do |row|
			Report.create(application_number: row[0], applicant_name: row[1], applicant_level: row[2], avg_z_score: row[3], quality_group: row[4],
						rank: row[5], reviewer_1: row[6], raw_score_1: row[7], z_score_1: row[8],
						reviewer_2: row[9], raw_score_2: row[10], z_score_2: row[11],
						reviewer_3: row[12], raw_score_3: row[13], z_score_3: row[14],
						reviewer_4: row[15], raw_score_4: row[16], z_score_4: row[17], panel_id: p.id)
		end
	end
end

