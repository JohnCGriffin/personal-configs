# personal-configs

Nice debian box setup in Docker with emacs 26, g++ 8, python3.7

```
make 
```

A handy script in ~/bin/az which mounts read-only credentials to AWS
and read-only access to SSH credentials.

```
#!/bin/bash

exec docker run --rm -it  -v `pwd`:/WORK \
	-v `echo ~`/.ssh:/home/griffin/.ssh:ro \
	-v `echo ~`/.aws:/home/griffin/.aws:ro \
	griffinish-amazonlinux

```


