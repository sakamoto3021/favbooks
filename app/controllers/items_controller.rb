class ItemsController < ApplicationController
  def new
    @items = []
    
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        booksGenreld: 001004,
        hits: 20,
      })
      
      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end

  
  private
  
  def read(result)
    title = result['title']
    url = result['itemUrl']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')
    
    {
      title: title,
      url: url,
      image_url: image_url,
    }
    
  end
end
  