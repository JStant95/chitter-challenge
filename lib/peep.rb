require 'pg'

class Peep
  def self.all
  end

  def self.create
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO chitter (username, email) VALUES('#{username}', '#{email}') RETURNING id, username, email")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end 
