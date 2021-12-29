run: lint
	cargo run -q

build: lint
	cargo build --release

check: format
	cargo check

format:
	rustfmt src/*

lint: check
	cargo clippy
