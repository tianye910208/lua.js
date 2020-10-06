
#include "lua.h"
#include <lauxlib.h>
#include <lualib.h>

int exec(const char* lua) {
	lua_State* L = luaL_newstate();
	luaL_openlibs(L);
	luaL_dostring(L, lua);
	return 0;
}


