class CreateServers::V20200524030727 < Avram::Migrator::Migration::V1
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
    create table_for(Server) do
      primary_key id : Int64
      add_timestamps
      add name : String
      add short_name : String
      add version : String
      add address : String
      add port : Int16
    end
  end

  def rollback
    drop table_for(Server)
  end
end
