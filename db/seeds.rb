
@user = User.create(email: 'test@test.com', password: 'asdfasdf',
                    password_confirmation: 'asdfasdf', first_name: 'Juan',
                    last_name: 'perez', phone: '7208221211')

puts '1 user created'


AdminUser.create(email: 'admin@test.com', password: 'asdfasdf',
                 password_confirmation: 'asdfasdf', first_name: 'Admin',
                 last_name: 'User', phone: '7208221211')

puts '1 Admin User created'

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

100.times do |audit_log|
  AuditLog.create!(start_date: (Date.today - 6.days) , user_id: User.last.id, status: 0)
end

puts '100 audit logs created'
