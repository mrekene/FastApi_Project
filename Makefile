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
all: install lint test deploy