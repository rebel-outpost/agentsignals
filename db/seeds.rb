AdminUser.create!([
  {email: "admin@example.com", encrypted_password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil}
])
Account.create!([
  {name: "MI6", email: nil, assigned_to: nil, website: nil, phone: "555-555-5555", address: "", city: "", state: "", zip: "", uid: nil, organization_id: nil, max_users: 1, subscription_plan: 1}
])
User.create!([
  {email: "agent@example.com", encrypted_password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-05-18 18:45:19", last_sign_in_at: "2014-05-18 18:45:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: nil, last_name: nil, company: nil, phone: nil, account_role: nil, uid: nil, account_id: 1, background: "default-background"}
])
