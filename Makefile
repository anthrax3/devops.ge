dev:
	hugo server --bind 0.0.0.0 --theme=vec --buildDrafts -b localhost -p 5000
html:
	hugo --theme=vec
build:
	docker build -t registry.devops.ge:5000/devops.ge .
run: stop
	docker run -p 8080:80 -d --name devops.ge registry.devops.ge:5000/devops.ge
stop:
	docker stop devops.ge  && docker rm devops.ge
