require 'user'
require 'pg'

describe User do
  describe '.all' do
    scenario 'list all users' do
      connection = PG.connect(dbname: 'chitter_app_test')
      user = User.create(username: 'jed123', email: 'jed@makers.com')
      User.create(username: 'sadie123', email: 'sadie@makers.com')

      users = User.all

      expect(users.length).to eq 2
      expect(users.first.username).to eq 'jed123'
      expect(users.first.email).to eq 'jed@makers.com'
      expect(users.first.id).to eq user.id
    end
  end

  describe '.create' do
    scenario 'create new user' do
      connection = PG.connect(dbname: 'chitter_app_test')
      user = User.create(username: 'jed999', email: 'jedo@makers.com')

      expect(user.username).to eq 'jed999'
      expect(user.email).to eq 'jedo@makers.com'
    end
  end
end
