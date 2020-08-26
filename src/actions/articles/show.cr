class Articles::Show < BrowserAction
  route do
    html ShowPage, article: ArticleQuery.find(article_id)
  end
end
