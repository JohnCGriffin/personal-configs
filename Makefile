
griffinish: Dockerfile
	docker build -t griffinish .

run: 
	docker run --rm -it -v `pwd`:/WORK griffinish || exit 0

clean:
	docker image rm $(docker image ls -q griffinish)
