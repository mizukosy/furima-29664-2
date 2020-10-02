class CreateItems < ActiveRecord::Migration[6.0]

  def change
    create_table :items do |t|
      t.string     :name,                 null:false
      t.text       :text,                 null:false
      t.integer    :category_id,          null:false
      t.integer    :status_id,            null:false
      t.integer    :price,                null:false
      t.integer    :delivery_chager_id,   null:false
      t.integer    :prefecture_id,        null:false
      t.integer    :delivery_days_id,     null:false
      t.references :user,                 null:false, forgen_key: true
      t.timestamps
    end
  end
end