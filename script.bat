echo "Criando as imagens"

docker build -t vihhugo/projeto-backend:1.0 backend/.
docker build -t vihhugo/projeto-database:1.0 database/.

echo "Realizando o push das imagen"

docker push vihhugo/projeto-backend:1.0
docker push vihhugo/projeto-database:1.0 

echo "Criando servicos no cluster kubernets"

kubctl apply -f ./servicos.yml

echo "Criando os deployments"

kubctl apply -f ./deployment.yml