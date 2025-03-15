IMAGE_NAME = resume-gen

gen: image
	@mkdir -p dist
	@rm -rf dist/*
	docker run --rm \
		-v $(PWD):/work \
		$(IMAGE_NAME) \
		deno task make

image:
	docker build -t $(IMAGE_NAME) -f Containerfile .