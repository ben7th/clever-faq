require 'rails_helper'

RSpec.describe User, type: :model do
  describe '模型关联测试' do
    it '创建用户' do
      user = User.create({
        email: 'ben7th@sina.com',
        login: 'ben7th',
        password: '123456'
      })

      expect(User.count).to eq 1
    end
  end
end
