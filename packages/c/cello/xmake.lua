package("cello")
    set_homepage("http://libcello.org/")
    set_description("Higher level programming in C")

    add_urls("https://github.com/orangeduck/Cello/archive/refs/tags/$(version).tar.gz",
             "https://github.com/orangeduck/Cello.git")

    add_versions("v2.0.3", "1afcae06f5efc10ea161737a862073ff5679c964540bca7cd719539609d0633c")

    on_install(function (package)
        local configs = {}
        io.writefile("xmake.lua", [[
            add_rules("mode.release", "mode.debug")
            target("cello")
                set_kind("")
                add_files("src/*.c")
                add_headerfiles("include/(*.h)")
        ]])
        import("package.tools.make")

	make.build(package, configs)
	make.make(package, table.join("install", "PREFIX=" .. package:installdir():gsub("\\", "/"), configs))
    end)

    on_test(function (package)
        assert(package:has_cfuncs("type_of", {includes = "Cello.h"}))
    end)
