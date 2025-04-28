package("libcyaml")
    set_homepage("https://github.com/tlsa/libcyaml")
    set_description("C library for reading and writing YAML.")
    set_license("ISC")

    add_urls("https://github.com/tlsa/libcyaml/archive/refs/tags/$(version).tar.gz",
             "https://github.com/tlsa/libcyaml.git")

    add_versions("v1.4.2", "3211b2a0589ebfe02c563c96adce9246c0787be2af30353becbbd362998d16dc")

    on_install(function (package)
        local configs = {}
        io.writefile("xmake.lua", [[
            add_rules("mode.release", "mode.debug")
            target("libcyaml")
                set_kind("")
                add_files("src/*.c")
                add_headerfiles("src/(*.h)")
        ]])
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("foo", {includes = "foo.h"}))
    end)
