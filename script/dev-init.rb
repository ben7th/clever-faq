# 此脚本用来初始化开发环境数据
# 注意！会清空原有数据

p '清空用户'
User.destroy_all


p '导入用户'
[
  {name: '刘备', login: 'user-001'},
  {name: '关羽', login: 'user-002'},
  {name: '张飞', login: 'user-003'},
  {name: '诸葛亮', login: 'user-004'},
].each do |u|
  User.create({
    name: u[:name],
    login: u[:login],
    email: "#{u[:login]}@test.com",
    password: '123456',  
  })
end