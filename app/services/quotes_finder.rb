class QuotesFinder
  # TO-DO: replace current filter with Postgres full-text search index
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
    if params[:tags].presence
      query = query.where(tags: {id: params[:tags]})
    end
    query
  end

  def filter_by_author(query)
    if params[:author].presence
      query = query.where("author iLIKE ? ", "%#{params[:author].titlecase}%")
    end
    query
  end

  def filter_by_source_title(query)
    if params[:source_title].presence
      query = query.where("source_title iLIKE ? ", "%#{params[:source_title].titlecase}%")
    end
    query
  end

  def filter_by_quote_text(query)
    if params[:quote_text].presence
      query = query.where("content iLIKE ? ",  "%#{params[:quote_text]}%")
    end
    query
  end

  def filter_by_all_params(query)
    if params[:q].presence
      query = query.where("source_title iLIKE ? ", "%#{params[:q].titlecase}%")
      .or(query.where("author iLIKE ? ", "%#{params[:q].titlecase}%"))
      .or(query.where("content iLIKE ? ",  "%#{params[:q]}%"))
    end
    query
  end
end
