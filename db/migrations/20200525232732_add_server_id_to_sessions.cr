class AddServerIdToSessions::V20200525232732 < Avram::Migrator::Migration::V1
  def migrate
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    # create table_for(Thing) do
    #   primary_key id : Int64
    #   add_timestamps
    #
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"

    alter :sessions do
      add server_id : String, default: ""
    end
  end

  def rollback
    alter :sessions do
      remove :server_id
    end
  end
end
