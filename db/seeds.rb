r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
r3 = Role.create({name: "Super Admin", description: "Can perform any CRUD activities, including creating admin account"})

# g1 = Application.create({name: "Poker", image: "#"})
# g2 = Application.create({name: "Blackjack", image: "#"})
# g3 = Application.create({name: "Roulette", image: "#"})

u1 = User.create({name: "Ryan", email: "ryan@example.com", password:"aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})

# a1 = Account.create({username: "sue", password: "password", user_id: u2.id, application_id: g1.id})
# a2 = Account.create({username: "kev", password: "password", user_id: u3.id, application_id: g2.id})
# a3 = Account.create({username: "jack", password: "password", user_id: u4.id, application_id: g3.id})
