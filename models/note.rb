class Note < ActiveRecord::Base
  belongs_to :talk
  belongs_to :author, class_name: "User"

  def author_name
    author.present? ? author.name : ""
  end

end
