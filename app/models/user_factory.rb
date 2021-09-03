class UserFactory

  FOUNDER_WHITELIST = ['foundertest@nullmailer.com', 'jakeod99@gmail.com'] # add Cory, Max, Dylan, and Steven (unless uninterested)
  ADMIN_WHITELIST = ['admintest@nullmailer.com']

  class << self
    def create!(opts = {})
      if UserFactory.valid_opts? opts
        User.create!(UserFactory.create_payload(opts))
      end
    end

    def valid_opts?(opts = {})
      opts['email'] && opts['password'] && opts['password_confirmation']
    end

    def create_payload(opts = {})
      {
        email: opts['email'],
        password: opts['password'],
        password_confirmation: opts['password_confirmation']
      }.tap{ |payload| 
        payload['access_level'] = UserFactory.access_level(opts['email'])
        payload['display'] = opts['display'] unless opts['display'].nil?
        payload['default_version'] = opts['default_version'] unless opts['default_version'].nil?
      }
    end

    def access_level(email)
      if UserFactory::FOUNDER_WHITELIST.include?(email)
        'founder'
      elsif UserFactory::ADMIN_WHITELIST.include?(email)
        'admin'
      else
        'standard'
      end
    end
  end
end
