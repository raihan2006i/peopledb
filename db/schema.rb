# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160724043058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "blood_group"
    t.string   "email"
    t.string   "profession"
    t.text     "address"
    t.string   "phone"
    t.boolean  "approved",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.tsvector "tsv_body"
  end

  add_index "people", ["tsv_body"], name: "index_people_on_tsv_body", using: :gin

  # no candidate create_trigger statement could be found, creating an adapter-specific one
  execute(<<-TRIGGERSQL)
CREATE OR REPLACE FUNCTION public.people_before_insert_update_row_tr()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    new.tsv_body := to_tsvector('pg_catalog.english', coalesce(new.body,''));
    RETURN NEW;
END;
$function$
  TRIGGERSQL

  # no candidate create_trigger statement could be found, creating an adapter-specific one
  execute("CREATE TRIGGER people_before_insert_update_row_tr BEFORE INSERT OR UPDATE ON \"people\" FOR EACH ROW EXECUTE PROCEDURE people_before_insert_update_row_tr()")

end
