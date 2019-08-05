
griffinish: Dockerfile
	docker build -t griffinish-amazonlinux .

run: 
	docker run --rm -it -v `pwd`:/WORK griffinish-amazonlinux || exit 0

clean:
	docker image rm `docker image ls -q griffinish-amazonlinux`
