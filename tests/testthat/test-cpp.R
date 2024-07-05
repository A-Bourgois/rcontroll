test_that("cpp", {
  # avoid fake parrallelisation for vscode debugger
  data("TROLLv3_species")
  data("TROLLv3_climatedaytime12")
  data("TROLLv3_daytimevar")
  data("TROLLv3_output")
  sim <- rcontroll:::.troll_child(
    name = "test",
    global = generate_parameters(
      rows = 100, cols = 100,
      iterperyear = 12, nbiter = 4,
      Rrecruit = 1,
      fecundity = 1,
      distdisperse = 1
    ),
    species = TROLLv3_species,
    climate = TROLLv3_climatedaytime12,
    daily = TROLLv3_daytimevar,
    # forest = get_forest(TROLLv3_output), # pour faire des tests à partir d'une forêt mature, à supprimer si on veut partir de 0
    verbose = TRUE
  )
  expect_s4_class(sim, "trollsim")
})
