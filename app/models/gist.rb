class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  LENGTH_LIMITATION = 25

  def small_text
    question.body.truncate(LENGTH_LIMITATION)
  end

  def hash_url
    url[/gist.github.com\/(\w+)/, 1]
  end
end
