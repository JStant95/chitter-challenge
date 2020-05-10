require 'pg'

class User
  attr_reader :username, :email, :id

  def initialize(username:, email:, id:)
    @username = username
    @email = email
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(username: user['username'], email: user['email'], id: user['id']) }
  end

  def self.create(username:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO users (username, email) VALUES('#{username}', '#{email}') RETURNING id, username, email")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end
