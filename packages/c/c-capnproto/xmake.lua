package("c-capnproto")
    set_homepage("https://github.com/shen390s/c-capnproto")
    set_description("capnproto plugin to generate c ")
    set_license("MIT")

    add_urls("https://github.com/shen390s/c-capnproto.git")
    add_versions("1.1.0", "a86c5ab151d008570eb7321416a0a46dd6e19131")

    add_links("capnpc-c")

    on_install(function (package)
        local configs = {}
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("foo", {includes = "foo.h"}))
    end)
