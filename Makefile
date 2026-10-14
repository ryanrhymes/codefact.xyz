.PHONY: build
build:
	JEKYLL_ENV=production jekyll build

.PHONY: 
serve:
	bundle exec jekyll serve --future

.PHONY: clean
clean:
	rm -rf _site .jekyll-cache

.PHONY: push
push:
	git commit -am "coding ..." && \
	git push origin `git branch | grep \* | cut -d ' ' -f2`

.PHONY: release release-minor release-major _release
release:  ## Tag and push a patch release (v1.2.3 -> v1.2.4)
	@$(MAKE) --no-print-directory _release BUMP=patch

release-minor:  ## Tag and push a minor release (v1.2.3 -> v1.3.0)
	@$(MAKE) --no-print-directory _release BUMP=minor

release-major:  ## Tag and push a major release (v1.2.3 -> v2.0.0)
	@$(MAKE) --no-print-directory _release BUMP=major

_release:
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "Error: You have uncommitted changes. Commit them first."; \
		exit 1; \
	fi; \
	LATEST_TAG=$$(git describe --tags --abbrev=0 --match 'v[0-9]*.[0-9]*.[0-9]*' 2>/dev/null || echo "v0.0.0"); \
	set -- $$(echo "$$LATEST_TAG" | sed 's/^v//' | tr '.' ' '); \
	MAJOR=$$1; MINOR=$$2; PATCH=$$3; \
	case "$(BUMP)" in \
		major) MAJOR=$$((MAJOR + 1)); MINOR=0; PATCH=0 ;; \
		minor) MINOR=$$((MINOR + 1)); PATCH=0 ;; \
		patch) PATCH=$$((PATCH + 1)) ;; \
		*) echo "Error: BUMP must be patch, minor or major."; exit 1 ;; \
	esac; \
	NEW_TAG="v$$MAJOR.$$MINOR.$$PATCH"; \
	echo "Latest tag: $$LATEST_TAG"; \
	echo "New tag:    $$NEW_TAG"; \
	git tag -a "$$NEW_TAG" -m "Release $$NEW_TAG" && \
	git push origin "$$NEW_TAG" && \
	echo "✓ Release $$NEW_TAG created and pushed!"
