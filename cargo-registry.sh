dnf upgrade -y

#frontend
dnf module install nodejs:16
#git clone http://git.istiak.com:3000/rust-lang/crates.io.git
git clone https://github.com/rust-lang/crates.io.git
cd crates.io/
npm install

#backend
dnf install -y rust
dnf install -y postgresql-server postgresql-contrib postgresql-devel pkgconfig
cargo install diesel_cli --no-default-features --features postgres
createdb cargo_registry
diesel migration run
./script/init-local-index.sh
cargo run --bin background-worker
#node http://localhost:4200!
npm run start
