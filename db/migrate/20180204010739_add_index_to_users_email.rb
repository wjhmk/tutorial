class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
    #add_indexメソッド、add_index(テーブル名, インデックスを付与するカラム名 [, オプション])
  end
end
