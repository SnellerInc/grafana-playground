# Build plugin

cd ./sneller-datasource

yarn install --pure-lockfile
yarn build

mage

mv dist/ snellerinc-sneller-datasource
zip snellerinc-sneller-datasource-1.0.0.zip snellerinc-sneller-datasource -r

# Build custom docker image

cd ..

docker build \
  --build-arg "GRAFANA_VERSION=latest" \
  -t grafana-sneller .
