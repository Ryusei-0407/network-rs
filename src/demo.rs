use std::error::Error;
use std::fs::File;
use std::net::Ipv6Addr;

fn main() -> Result<(), Box<dyn Error>> {
    let _f = File::open("demo.txt")?;

    let _localhost = "::1".parse::<Ipv6Addr>()?;

    Ok(())
}
