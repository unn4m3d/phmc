class Articles::Index < BrowserAction
  route do
    html IndexPage, articles: ArticleQuery.new
  end
end
