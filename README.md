# Reactively source + remove + call shiny modules with menu selectors

This is an example of how you can use a shiny menu selector to reactively source module scripts then use the functions loaded in to the global environment to call the module UI and Server. 

When the user selects a different tab from the menu, the functions in the global environment that are no longer needed will be removed. 

This could be useful for apps that use lots of modules across several pages, reducing the number of functions required in memory at any one time.

You can run this app locally with `shiny::runGitHub(repo = "PaulC91/reactive-modules")`

# TODO

* Find method for sourcing/removing/calling modules from within each session environment