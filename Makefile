install:
	#install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	#format code
	black *.py	mylib/*.py
lint:
	#flask8 or #pylint #(--disable=R,C R=recommended, C=configuration)
	pylint --disable=R,C *.py mylib/*.py #pylint *.py mylib/*.py
test:
	#test
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	#build container
	docker build -t deploy-fastapi .
run:
	#run docker
	docker run -p 127.0.0.1:8080:8080 46b539d03dd8 /app/main.py
deploy:
	#deploy
	aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 238089408126.dkr.ecr.eu-central-1.amazonaws.com
	docker build -t wiki .
	docker tag wiki:latest 238089408126.dkr.ecr.eu-central-1.amazonaws.com/wiki:latest
	docker push 238089408126.dkr.ecr.eu-central-1.amazonaws.com/wiki:latest
all: install lint test deploy