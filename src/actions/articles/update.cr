class Articles::Update < BrowserAction
  route do
    article = ArticleQuery.find(article_id)
    SaveArticle.update(article, params) do |operation, article|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(article.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, article: article
      end
    end
  end
end
