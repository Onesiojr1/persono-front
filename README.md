# persono-front

Um Projeto de listagem e criação de postagens realizado em Flutter, consumindo uma API em node.js;

## Importante

É importante que para o funcionamento do projeto, a API(Persono_server) já esteja rodando na porta padrão;

## Instalação

Para clonar o Projeto em seu computador utilize o comando:
```sh
git clone https://github.com/Onesiojr1/persono-front.git
```

Após clonar o projeto, você deve entrar no diretório do projeto e instalar suas dependênciascom os comandos:
```sh
cd .\persono-front\
pub get
```

Logo após todas as dependências estarem instaladas, deve abrir seu emulador de preferência e rodar o comando: 
```sh
flutter run
```

## Observações
Caso seja necessário mudar a rota da api, você deve mudar link de conexão da api no arquivo:
```sh
lib\services\remote_services.dart
```
