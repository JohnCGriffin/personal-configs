# personal-configs

Nice debian box setup in Docker with emacs 26, g++ 8, python3.7

```
make 
```

A handy script in ~/bin/d

```
#!/bin/bash

exec docker run --rm -it -v`echo ~`/.ssh:/home/griffin/.ssh:ro -v `pwd`:/WORK griffinish

```


