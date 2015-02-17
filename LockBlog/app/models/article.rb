class Article < ActiveRecord::Base
	 default_scope -> { order(created_at: :desc) }
	#date_select("article", "written_on", selected: Date.today)
	validates :title, presence: true,
                    length: { minimum: 5 }
end
