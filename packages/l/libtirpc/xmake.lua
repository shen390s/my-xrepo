package("libtirpc")
    set_homepage("https://github.com/openkylin/libtirpc")
    set_description("")

    add_urls("https://github.com/openkylin/libtirpc.git")
    add_versions("2024.04.18", "3a4c2ebcbc6bd2dbd90aae68cb90a7ba2a070eab")

    add_deps("autoconf", "automake", "libtool")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "--enable-shared=" .. (package:config("shared") and "yes" or "no"))
        if package:is_debug() then
            table.insert(configs, "--enable-debug")
        end
        import("package.tools.autoconf").install(package, configs)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("foo", {includes = "foo.h"}))
    end)
