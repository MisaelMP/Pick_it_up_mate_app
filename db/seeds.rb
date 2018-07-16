User.destroy_all
u1 = User.create :email => 'misaelmdev@gmail.com', :password => 'chicken', :admin => true
u2 = User.create :email => 'trump@gmail.com', :password => 'chicken'



Item.destroy_all
i1 = Item.create :title => 'Blue chair', location:'Darlinghurst', :latitud: '-33.877945', longitude: '151.219051'
