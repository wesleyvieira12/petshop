class Dog < ApplicationRecord
	enum gender: [:M,:F]

	# Verifica se não esta em branco os valores passados
	validates :name,:race,:gender,:birthday,:name_owner,:phone, presence: true
	# Verifica se é um numero
	validates :phone, :numericality => {:message => "invalido!"}
	# Verifica se o nome do cachorro é unico
	validates :name, uniqueness: true
end
