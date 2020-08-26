class Articles::Edit < BrowserAction
  route do
    article = ArticleQuery.find(article_id)
    html EditPage,
      operation: SaveArticle.new(article),
      article: article
  end
end
