class Indexing < ActiveRecord::Migration
  def change
    add_column :people, :tsv_body, :tsvector
    add_index(:people, :tsv_body, using: 'gin')

    create_trigger(compatibility: 1).on(:people).before(:insert, :update) do
      "new.tsv_body := to_tsvector('pg_catalog.english', coalesce(new.body,''));"
    end
  end
end
