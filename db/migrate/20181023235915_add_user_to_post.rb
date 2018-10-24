class AddUserToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, foreign_key: { on_delete: :cascade }
  end
end
