class Articles::Delete < BrowserAction
  route do
    ArticleQuery.find(article_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
