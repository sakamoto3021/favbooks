class ItemsController < ApplicationController
  def new
    @items = []
    
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        booksGenreId: '001004',
        hits: 20,
      })
      
      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end
  
  def create
    @item = Item.find_or_initialize_by(isbn: params[:isbn])
    
    unless @item.persisted?
      results = RakutenWebService::Books::Book.search(isbn: @item.isbn)
      @item = Item.new(read(results.first))
      @item.save
    end
    redirect_to new_post_path
  end

  
  private
  
  def read(result)
    title = result['title']
    url = result['itemUrl']
    isbn = result['isbn']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')
    
    {
      title: title,
      url: url,
      isbn: isbn,
      image_url: image_url,
    }
    
  end
end
  