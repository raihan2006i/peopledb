class Indexing < ActiveRecord::Migration
  def up
    add_column :people, :tsv, :tsvector
    add_index :people, :tsv, using: "gin"

    execute <<-SQL
      CREATE TRIGGER tsvector_update_people BEFORE INSERT OR UPDATE
      ON people FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', name, email, blood_group
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE people SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvector_update_people
      ON people
    SQL

    remove_index :people, :tsv
    remove_column :people, :tsv
  end
end
