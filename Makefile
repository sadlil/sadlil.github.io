serve:
	hugo --log --source=src server -d=$(PWD)/docs --watch

build:
	hugo -v --log --source=src -d=$(PWD)/docs --gc --forceSyncStatic --cleanDestinationDir
	cp -R src/public/ docs/

MSG ?= "Update site"
deploy: build
	git add --all
	git commit -m "$(MSG)"
	git push
