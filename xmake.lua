set_project("CPP_Xmake_Env_Template")
set_languages("c99", "cxx17")

--切换EMCC工具链(需要先安装Emscripten) apt install emscripten
-- xmake f -p wasm

-- 编译模式 --
-- 模式切换：xmake f -m debug/release
add_rules("mode.debug", "mode.release")

-- 生成调试信息 --
-- xmake project -k compile_commands

-- 程序检查工具 --
-- 命令：xmake f -m debug -v --policies=build.sanitizer.address,build.sanitizer.undefined
--     set_policy("build.sanitizer.address", true) --快速的内存错误检测工具
--     set_policy("build.sanitizer.thread", true) --检测线程安全问题
--     set_policy("build.sanitizer.memory", true) --检测内存问题
--     set_policy("build.sanitizer.leak", true) --检测内存泄漏问题
--     set_policy("build.sanitizer.undefined", true) --检测未定义行为

-- 项目设置 --
-- 导入二级目录子项目配置
includes("*/xmake.lua")

-- 全局范围内可使用的依赖包 --
-- 使用本地仓库
add_repositories("local-repo xmake-repo")

-- 导入外部依赖包
add_requires("emscripten") -- Emscripten是一个WebAssembly工具链,提供必要的绑定和API

