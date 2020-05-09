# personal-configs

Nice Amazon Linux box setup in Docker with emacs 25.3, g++ 7, python3.7

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
	griffinish-amazonlinux $*

```

In addition to just shell, you can edit code as in ```az emacs something.py```.


