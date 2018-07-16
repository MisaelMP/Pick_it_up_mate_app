User.destroy_all
u1 = User.create :email => 'misaelmdev@gmail.com', :password => 'chicken', :admin => true
u2 = User.create :email => 'trump@gmail.com', :password => 'chicken'



Item.destroy_all
i1 = Item.create :title => 'Blue chair', :location => 'Darlinghurst', :latitude => -33.877945, :longitude => 151.219051, :image => 'https://winkgo.com/wp-content/uploads/2018/03/Artist-Draws-Sad-Clown-Faces-Thrown-Away-Objects-19-720x900.jpg'
i2 = Item.create :title => 'Arm chair', :location => 'Glebe', :latitude => -33.878265, :longitude => 151.184323, :image => 'http://wvs.topleftpixel.com/photos/2011/07/stripes-chair_ontario_street_sidewalk_01.jpg'


 u1.items << i1
u2.items << i2
