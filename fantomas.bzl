def fantomas_check(name, editor_config, srcs):
  check = [
    native.package_name() + "/" + x for x in srcs
  ]

  native.sh_test(
    name = name,
    srcs = [ "@//:fantomas.sh" ],
    args = [
      "--check",
    ] + check,
    data = srcs + [
      editor_config,
      "//:fantomas",
    ],
  )

  return name
