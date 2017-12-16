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

Game.create(name: 'Arcadia', description: 'Jogo Arcadia', players: 2, user_id: caio.id, game_kind_id: 2,
            permitted_instant_reservation: false, price: rand(10..60), theme_id: 1)

Game.create(name: 'Shot Dama', description: 'Jogo de damas com copos shot e tabuleiro de metal', players: 2, user_id: caio.id, game_kind_id: 2,
            permitted_instant_reservation: false, price: rand(10..90), theme_id: 5)

Game.create(name: 'Yugioh cards', description: 'Jogo de cartas com 2 decks', players: 2, user_id: renan.id, game_kind_id: 1,
            permitted_instant_reservation: false, price: rand(10..50), theme_id: 2)

Game.create(name: 'Dungeons and Dragons', description: 'Dungeons & Dragons tem o seu início em 1974 como fruto da imaginação de Gary Gygax e Dave Arneson.',
            players: 4, user_id: erik.id, game_kind_id: 4, permitted_instant_reservation: false, price: rand(10..60), theme_id: 2)

Game.create(name: 'Xadrez', description: 'Jogo de damas com copos shot e tabuleiro de metal', players: 2, user_id: caio.id, game_kind_id: 2,
            permitted_instant_reservation: false, price: rand(10..90), theme_id: 5)

Game.create(name: 'Uno', description: 'Jogo de cartas Uno', players: 6, user_id: renan.id, game_kind_id: 1,
            permitted_instant_reservation: true, price: rand(10..30), theme_id: 5)

Game.create(name: 'Call of Cthulhu', description: 'Call of Cthulhu é baseado nas obras de H.P. Lovecraft, um dos autores da década de 1920 que se especializou em horror.',
            players: 6, user_id: caio.id, game_kind_id: 4, permitted_instant_reservation: false, price: rand(10..60), theme_id: 2)

Game.create(name: 'Dominó', description: 'Dispensa Apresentações', players: 4, user_id: erik.id, game_kind_id: 2,
            permitted_instant_reservation: true, price: rand(10..20), theme_id: 5)

Game.create(name: 'O que sou', description: 'O jogo vem com 50 cartas, uma ampulheta e 6 alças de cartas para o seu filho brincar em se transformar em várias coisas.',
            players: 6, user_id: renan.id, game_kind_id: 1, permitted_instant_reservation: false, price: rand(10..50), theme_id: 5)