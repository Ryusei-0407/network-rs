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

create:
	sudo ip tuntap add mode tap name tap-rust user r9
	sudo ip link set tap-rust up
	sudo ip addr add 192.168.42.100/24 dev tap-rust
	sudo iptables -t nat -A POSTROUTING -s 192.168.42.0/24 -j MASQUERADE
	sudo sysctl net.ipv4.ip_forward=1

delete:
	sudo ip tuntap del mode tap name tap-rust

list:
	ip tuntap list
