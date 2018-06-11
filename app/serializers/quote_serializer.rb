class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :author

  def author
    [
      {
        id: object.author.id,
        name: object.author.name
      }
    ]
  end

end
