.PHONY: build
build:
	jekyll build
	
.PHONY: clean
clean:
	rm -rf _site .jekyll-cache

.PHONY: push
push:
	git commit -am "coding ..." && \
	git push origin `git branch | grep \* | cut -d ' ' -f2`
