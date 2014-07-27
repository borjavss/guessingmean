library(shiny)
shinyUI(pageWithSidebar(
   headerPanel("Guess the galaxies velocity expansion mean"),
   sidebarPanel(
      sliderInput('mu', 'What is the mean? Have a try!', value = 10000, min = 10^4, max = 3*10^4, step = 10,),
      h4('The goal is guess velocity expansion!'),
      p('Try to reduce RMSE value ;)')
   ),
   mainPanel(
      plotOutput('newHist'),
      h3('--------------------------------------------------------'),
      h4('You said that the mean velocity (Km/s) is:'),
      textOutput('out1'),
      h4('but, in fact, it is 20830 Km/s (solution).'),
      h5('--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- '),
      h4('So, you commited an error (Km/s) of:'),
      textOutput('out2'),
      h4('It means, your RMSE (Km/s) square error is:'),
      textOutput('out3'),
      h3('Try to minimize it!'),
      h4('You can use next graphic ;) '),
      h3('--------------------------------------------------------'),
      plotOutput('plot2')
   )
))
