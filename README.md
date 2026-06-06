# personal-configs

Nice debian box setup with emacs, go, c++, python, racket, git, etc.

build with: docker build . -t jcgdebian

```
griffin@griffins-MacBook-Air personal-configs % cat ~/bin/linux 
docker run  \
	-e TERM="$TERM"  \
	--rm -it \
	-v ~/.ssh:/home/griffin/.ssh:ro \
	-v ~/.gitconfig:/home/griffin/.gitconfig:ro \
	-v $(PWD):/WORK \
	jcgdebian $*
```

