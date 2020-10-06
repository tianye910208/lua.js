
all: wasm asm.js

wasm: lua.c liblua
	emcc -Ilua-5.3.6/src lua-5.3.6/src/liblua.a lua.c -s WASM=1 -O2 -o lua.js -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -s EXPORTED_FUNCTIONS='["_exec"]'


asm.js: lua.c liblua
	emcc -Ilua-5.3.6/src lua-5.3.6/src/liblua.a lua.c -s WASM=0 -O2 -o lua.asm.js -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -s EXPORTED_FUNCTIONS='["_exec"]'

liblua:
	cd lua-5.3.6/src && make a CC='emcc' AR='emar rcu'

clean:
	rm *.js
	rm *.wasm
	rm *.js.mem
	cd lua-5.3.6/src && make clean



