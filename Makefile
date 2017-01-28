build:
	docker build -t registry.devops.ge:tokozedg/devops.ge .
html:
	docker-compose run --rm hugo
#run: stop
	#docker run -p 8080:80 -d --name devops.ge registry.devops.ge:5000/devops.ge
#stop:
	#docker stop devops.ge  && docker rm devops.ge
#push:
	#docker push registry.devops.ge:5000/devops.ge
#dev:
	#hugo server --bind 0.0.0.0 --theme=vec --buildDrafts -b localhost -p 5000
