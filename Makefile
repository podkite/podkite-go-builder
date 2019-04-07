build:
	docker build -t podkite/podkite-go-builder:latest .

push:
	docker push podkite/podkite-go-builder:latest
