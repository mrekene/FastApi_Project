install:
	#install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	#format code
	black *.py	mylib/*.py
lint:
	#flask8 or #pylint #(R=recommended, C=configuration)
	pylint --disable=R,C *.py mylib/*.py
test:
	#test
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	#build container
deploy:
	#deploy
all: install lint test deploy