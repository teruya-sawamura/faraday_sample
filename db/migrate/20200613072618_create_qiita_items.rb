class CreateQiitaItems < ActiveRecord::Migration[6.0]
  def change
    create_table :qiita_items do |t|

      t.timestamps
    end
  end
end
