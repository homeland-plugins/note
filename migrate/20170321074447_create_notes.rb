class CreateNotes < ActiveRecord::Migration[5.0]
  def up
    return if ActiveRecord::Base.connection.table_exists? :notes

    create_table 'notes' do |t|
      t.string   'title',                         null: false
      t.text     'body',                          null: false
      t.integer  'user_id',                       null: false
      t.integer  'word_count',    default: 0,     null: false
      t.integer  'changes_count', default: 0,     null: false
      t.boolean  'publish',       default: false
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    add_index 'notes', ['user_id'], name: 'index_notes_on_user_id', using: :btree
  end

  def down
    drop_table :notes, if_exists: true
  end
end
