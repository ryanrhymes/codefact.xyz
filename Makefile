.PHONY: build
build:
	JEKYLL_ENV=production jekyll build

.PHONY: 
serve:
	bundle exec jekyll serve

.PHONY: clean
clean:
	rm -rf _site .jekyll-cache

.PHONY: push
push:
	git commit -am "coding ..." && \
	git push origin `git branch | grep \* | cut -d ' ' -f2`
