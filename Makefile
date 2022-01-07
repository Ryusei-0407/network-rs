run: lint
	mold -run cargo run -q

build: lint
	mold -run cargo build --release

check: format
	cargo check

format:
	rustfmt src/*

lint: check
	cargo clippy

demo:
	rustc src/demo.rs
	./demo

clean:
	cargo clean && rm demo
