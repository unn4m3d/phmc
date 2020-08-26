class Articles::New < BrowserAction
  route do
    html NewPage, operation: SaveArticle.new
  end
end
