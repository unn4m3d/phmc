class CreateArticles::V20200721010250 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Article) do
      primary_key id : Int64
      add_timestamps
      add title : String
      add text : String
      add status : String
      add_belongs_to author : User?, on_delete: :nullify
    end
  end

  def rollback
    drop table_for(Article)
  end
end
