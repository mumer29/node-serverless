# aws-cli ou seja tudo através do terminal 

# 1. criar arquivo .json de política de segurança, onde fica quais serviços pode ser acessado (obs version vem na doc da aws).

# 2. fazer role de segurança na AWS, usando IAM com comando
aws iam create-role \
 --role-name lambda-teste1 \
 --assume-role-policy-document file://politicas.json \
 | tee logs/role.log

# 3. criar arquivo com conteúdo e zipa-lo, no caso o arquivo index.js
zip function.zip index.js
 
aws lambda create-function \
 --function-name teste-cli \
 --zip-file fileb://function.zip \
 --handler index.handler \
 --runtime nodejs12.x \
 --role arn:aws:iam::051407999025:role/lambda-teste1 \
 | tee logs/lambda-create.log

# 4. após ter criado e feito upload, neste passo ‘invoke lambda’ onde é simulado um evento recebendo o resultado na tela (abrir arquivo lamba-execute.log que será criado na pasta logs)
aws lambda invoke \
 --function-name teste-cli \
 --log-type Tail \
 logs/lambda-execute.log

# 5. atualizando, lembrando que apos atualizar o index.js é necessário zipar arquivo novamente e executar novamente
zip function.zip index.js

aws lambda update-function-code \
 --zip-file fileb://function.zip \
 --function-name teste-cli \
 --publish \
 | tee logs/lambda-update.log

aws lambda invoke \
 --function-name teste-cli \
 --log-type Tail \
 logs/lambda-execute-update.log

# 6 delete, é sempre importante ao final de cada teste remover tudo assim não fica dados/funções perdidas na conta (obs os comando não tem saídas, ou seja não notifica nada no terminal, para ter certeza verifica na conta aws/iam/funções no navegador)
aws lambda delete-function \
 --function-name teste-cli

aws iam delete-role \
 --role-name lambda-teste1