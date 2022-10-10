# DEVELOPMENT ENVIRONMENT TEMPLATE (APACHE2 + COMPOSER + PHP)

Ambiente de desenvolvimento em container (Docker) contendo as seguintes configurações:

- Sistema GNU/Linux Debian (versão 11 bullseye)
- Servidor Web Apache (versão 2.4.52)
- PHP 7.4.28 (com as principais extensões para a instalação do laravel)
- Composer (versão 2)

Você pode usar este template como base para projetos em Laravel ou outro framework PHP. Para adicionar novos serviços, como bancos de dados, adicione o serviço desejado no arquivo docker-compose.yml.

Caso precise usar algum framework ou biblioteca baseada no Node.js, altere o arquivo Dockerfile para instalar a biblioteca no momento da criação da imagem.

## Configurações Iniciais

Baixe o projeto do repositório

```
git clone <link>
```

Dentro do diretório do projeto baixado há uma pasta chamada project. Esta pasta deve ser substituída pela pasta do seu projeto. Em seguida acesse o arquivo Dockerfile e na linha onde estiver escrito

```
WORKDIR /var/www/<project>
```

substitua \<project\> pelo nome do seu projeto. Em seguida abra o arquivo docker-compose.yml e faça a mesma coisa onde estiver escrito a tag \<project\>.

```
version: '3'
services:
  php-apache:
    container_name: php-apache
    build: .
    ports:
      - "8000:80"
    volumes:
      - ./<project>:/var/www/<project>
      - ./apacheconf/default.conf:/etc/apache2/sites-enabled/000-default.conf
```

Faça mesma coisa em apacheconf/default.conf, substitua \<project\> pelo nome de seu projeto.

```
<VirtualHost *:80>
    ServerName sistemaecad
    DocumentRoot /var/www/<project>/public

    <Directory /var/www/<project>>
        AllowOverride All
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

## Montando o container

Após fazer as configurações anteriores acesse a pasta do projeto e execute o comando a seguir

```
docker-compose up -d
```

Se seu projeto laravel estiver devidamente configurado basta somente acessar o endereço localhost:8000 no navegador e será possível acessar a página do seu projeto. Caso precise fazer algumas configurações adicionais, como instalar novas bibliotecas ou executar o artisan, execute:

```
docker exec -it php-apache bash
```
