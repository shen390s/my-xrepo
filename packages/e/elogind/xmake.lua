package("elogind")
    set_homepage("https://github.com/elogind/elogind")
    set_description("The systemd project's \"logind\", extracted to a standalone package")
    set_license("GPL-2.0")

    add_urls("https://github.com/elogind/elogind/archive/refs/tags/$(version).tar.gz",
             "https://github.com/elogind/elogind.git")

    add_versions("v255.17", "a9725ae3f73f8d910de84c108bc11bfd4c782bef6a4190b2ec70c5d2f22344db")

    add_deps("meson", "gperf", "ninja")
--    add_deps("libcap")

    on_install(function (package)
        local configs = {}
--        table.insert(configs, "--enable-shared=" .. (package:config("shared") and "yes" or "no"))
--        if package:is_debug() then
--            table.insert(configs, "--enable-debug")
--        end
        import("package.tools.meson").install(package, configs)
    end)

