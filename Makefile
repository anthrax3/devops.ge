dev:
	hugo server --bind 0.0.0.0 --theme=vec --buildDrafts -b devops.ge -p 80
html:
	rm -rf ~/devops.ge/public
	hugo --theme=hemingway
	rm -rf /var/www/html/*
	cp -r ./public/* /var/www/html/
