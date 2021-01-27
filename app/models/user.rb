# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  birthday        :date
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

class User < ApplicationRecord
  # has_secure_password の記述を追加するだけで色々な機能が使えるようになる
  # - password属性とpassword_confirmation属性がUserモデルに追加される
  has_secure_password

  validates :name,
    presence: true, # 必須
    uniqueness: true, # 重複不可
    length: {maximum: 16}, #文字数上限
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください' # デフォルトだと「不正な値です」とかのエラ〜メッセージになり、何が不正なのかよくわからないから
    }
  validates :password,
    length: {maximum: 8}

  # 生年月日から現在の年齢を返す
  def age 
    0
  end
end
