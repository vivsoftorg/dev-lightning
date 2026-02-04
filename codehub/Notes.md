How I installed in dev-enbuild

docker buildx build --platform linux/amd64 -t codehub .

helm upgrade --install codehub jupyterhub/jupyterhub --values values.yaml -n codehub
