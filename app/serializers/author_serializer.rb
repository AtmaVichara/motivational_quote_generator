class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :quotes

  def quotes
    object.quotes.select(:id, :content)
  end

end
