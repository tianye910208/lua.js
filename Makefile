all: wasm


wasm: lua.c liblua_wasm1
	emcc -Ilua-5.3.6/src lua-5.3.6/src/liblua.a lua.c -s WASM=1 -O2 -o lua.js -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -s EXPORTED_FUNCTIONS='["_exec"]'

liblua_wasm1: clean
	cd lua-5.3.6/src && make generic CC='emcc -s WASM=1'


asm.js: lua.c liblua_wasm0
	emcc -Ilua-5.3.6/src lua-5.3.6/src/liblua.a lua.c -s WASM=0 -O2 -o lua.asm.js -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -s EXPORTED_FUNCTIONS='["_exec"]'

liblua_wasm0: clean
	cd lua-5.3.6/src && make generic CC='emcc -s WASM=0'



clean:
	cd lua-5.3.6/src && make clean



