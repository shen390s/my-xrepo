package("c-capnproto")
    set_homepage("https://github.com/shen390s/c-capnproto")
    set_description("")
    set_license("MIT")

    add_urls("https://github.com/shen390s/c-capnproto.git")
    add_versions("2025.05.09", "a86c5ab151d008570eb7321416a0a46dd6e19131")

    on_install(function (package)
        local configs = {}
        io.writefile("xmake.lua", [[
            add_rules("mode.release", "mode.debug")
            target("c-capnproto")
                set_kind("")
                add_files("src/*.c")
                add_headerfiles("src/(*.h)")
        ]])
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("foo", {includes = "foo.h"}))
    end)
