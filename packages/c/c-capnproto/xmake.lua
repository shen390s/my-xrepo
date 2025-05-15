package("c-capnproto")
    set_homepage("https://github.com/shen390s/c-capnproto")
    set_description("capnproto plugin to generate c ")
    set_license("MIT")

    add_urls("https://github.com/shen390s/c-capnproto.git")
    add_versions("1.1.0", "a86c5ab151d008570eb7321416a0a46dd6e19131")

--    add_links("capnpc-c")

    add_deps("cmake")

    on_install(function (package)
        local configs = {"-DBUILD_TESTING=OFF -DCMAKE_C_COMPILER=gcc"}
	table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package)
	package:addenv("PATH", "bin")
    end)

