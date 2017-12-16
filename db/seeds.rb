game_kind_list = ['Cartas', 'Tabuleiro', 'Miniaturas', 'RPG', 'Dados', 'Enigmas', 'Acessórios']
theme_list = ['Civilizações e mitologia', 'Monstros e criaturas', 'Medieval e fantasia', 'Zumbis', 'Contemporâneos', 'Ficção Científica']

def seed_names_models(klass, name)
    klass.create!(name: name)
end

game_kind_list.each { |game_kind| seed_names_models(GameKind, game_kind) } 
theme_list.each { |theme| seed_names_models(Theme, theme) } 

caio = User.create(name: 'Caio Vitor', surname: 'Souza Santos', email: 'caiovitor.santos@gmail.com', password: 'caiovitor')
renan = User.create(name: 'Renan', surname: 'Noible', email: 'renanlnobile@gmail.com', password: 'renannobile')
erik = User.create(name: 'Erik', surname: 'Hebeler', email: 'erik@gmail.com', password: 'renannobile')

Address.create(street: 'Rua Caminho do Guaramar', number: '199', complement: 'bloco B21 apto 24',
               zip_code: '11721050', neighborhood: 'Vila Antartica', city: 'Praia Grande', state: 'São Paulo',
               country: 'Brasil', user_id: caio.id)

Address.create(street: 'Rua Rui Barbosa', number: '753', complement: 'apto 11',
               zip_code: '11700170', neighborhood: 'Canto do Forte', city: 'Praia Grande', state: 'São Paulo',
               country: 'Brasil', user_id: renan.id)

Address.create(street: 'Rua Carlos Gomes', number: '300', complement: '21',
               zip_code: '11721050', neighborhood: 'Marapé', city: 'Santos', state: 'São Paulo',
               country: 'Brasil', user_id: erik.id)
