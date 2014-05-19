AdminUser.where(email: 'admin@example.com').first_or_create(password: 'password')

account = Account.find_or_create_by(name: 'MI6', phone: "555-555-5555", max_users: 1, subscription_plan: 1)

User.where(email: 'agent@example.com').first_or_create(password: 'password', account_id: account.id)