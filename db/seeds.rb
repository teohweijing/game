r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

g1 = Application.create({name: "Poker", image: "#"})
g2 = Application.create({name: "Blackjack", image: "#"})
g3 = Application.create({name: "Roulette", image: "#"})

u1 = User.create({name: "Ryan", email: "ryan@example.com", password:"aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})

a1 = Account.create({username: "sue", password: "password", user_id: u2.id, application_id: g1.id})
a2 = Account.create({username: "kev", password: "password", user_id: u3.id, application_id: g2.id})
a3 = Account.create({username: "jack", password: "password", user_id: u4.id, application_id: g3.id})
