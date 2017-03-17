# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

races = [
	"Affenpinscher" , 
	"Afghan hound" , 
	"Aidi", 
	"Airedale terrier", 
	"Akita americano", 
	"Akita Inu", 
	"American Pit Bull",
	"American staffordshire terrier",
	"Australian cattle dog",
	"Australian silky terrier",
	"Australian terrier",
	"Azawakh",
	"Azul da Gasconha",
	"Barbet",
	"Barzoi",
	"Basenji",
	"Basset Hound",
	"Basset alemão da Vestfália",
	"Basset alpino",
	"Basset artesiano normando",
	"Basset sueco",
	"Beagle",
	"Beagle Harrier"]


castrated = [true, false]

#So criar um novo cachorro caso não tenha um igual ja criado 
unless Dog.any?

	(1..1000).each do |i|
		telefone = Array.new(11) {| i | i = rand(9)}
		puts "Criando cachorro #{i}" 
		Dog.create!(name: "Dog_#{i}", race: races.sample , gender: rand(0..1), castrated: castrated.sample, birthday:"#{rand(1..28)}/#{rand(1..12)}/#{rand(2000..2017)}", name_owner: "Dono #{i}", phone: telefone.join(""))
	end
end
