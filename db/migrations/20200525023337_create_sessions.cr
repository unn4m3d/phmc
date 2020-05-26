class CreateSessions::V20200525023337 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Session) do
      primary_key id : Int64
      add_timestamps
      add sid : String
      add access_token : String
      add_belongs_to user : User, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(Session)
  end
end
