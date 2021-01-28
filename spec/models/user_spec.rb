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

require 'rails_helper'

RSpec.describe User, type: :model do
  # 基本的にはここに、Userモデルにあるメソッドに対するテストコードを記述していく
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '#age' do # テスト対象
    context '20年前の生年月日の場合' do # どういう条件下で行うテストかを記載
       # そのcontextを表すユーザーを定義する
       # letはrspec独自のもの
      let(:user) {User.new(birthday: Time.zone.now - 20.years)}

      it '年齢が20歳であること' do # itブロックで、最終的にどういう状態が正しいのかどうかをテストする
        expect(user.age).to eq 20 # このuserに、letで書いた通りUser.newしたオブジェクトが入っている
        # eq以外のマッチャは、be_truthy,be_falsey,raise_errorなど
      end
    end
  end
end
