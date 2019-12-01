class QuotesFinder
  def initialize(params:, base_query:)
    @params = params || {}
    @base_query = base_query || Quote.includes(:tags, :user).all
  end

  def filter
    query = base_query

    query = filter_by_author(query)
    query = filter_by_tag(query)
    query = filter_by_source_title(query)
    query = filter_by_quote_text(query)
    query = filter_by_all_params(query)
    query.recent_first
  end

  private

  attr_reader :params, :base_query

  def filter_by_tag(query)
    if params[:tags]
      query = query.where(tags: {id: params[:tags]})
    end
    query
  end

  def filter_by_author(query)
    if params[:author]
      query = query.where("author LIKE ? ", "%#{params[:author].titlecase}%")
    end
    query
  end

  def filter_by_source_title(query)
    if params[:source_title]
      query = query.where("source_title LIKE ? ", "%#{params[:source_title].titlecase}%")
    end
    query
  end

  def filter_by_quote_text(query)
    if params[:quote_text]
      query = query.where("content LIKE ? ",  "%#{params[:quote_text]}%")
    end
    query
  end

  def filter_by_all_params(query)
    if params[:q]
      query = query.where("source_title LIKE ? ", "%#{params[:q].titlecase}%")
      .or(query.where("author LIKE ? ", "%#{params[:q].titlecase}%"))
      .or(query.where("content LIKE ? ",  "%#{params[:q]}%"))
    end
    query
  end
end

