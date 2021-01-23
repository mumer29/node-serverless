# aws com serveless como framework

# 1. install
$ npm i -g serveless

# verificar se esta instado
$ sls -v

# comando help
$ sls -h

# 2. incializar/configurar um novo projeto, serveless
$ sls

# 3. sempre fazer deploy, como boa pratica e para verificar se esta com ambiente ok 
$ sls deploy

# 4. invocar a função na aws
$ sls invoke -f hello

# invocar a função local
$ sls invoke local -f hello --log

# invocar a função e monstra info
$ sls invoke -f hello --tail

# 5. remove bucket na aws e sls 
$ sls remove

# links suporte 
# https://rossener.com/como-configurar-serverless-com-aws/
# https://gist.github.com/ServerlessBot/7618156b8671840a539f405dea2704c8  