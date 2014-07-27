library(UsingR); data(galaxies)
# "galaxies" is a velocities vector (km/sec) of 82 galaxies of an unfilled survey of the Corona Borealis region
shinyServer(
   function(input, output) {
      output$newHist <- renderPlot({
         hist(galaxies, xlab='velocity (km/sec) from 6 well-separated conic sections', col="orange",
              main='Histogram respresentation - GUESS SOLUTION -', cex.lab=1.6, cex.main=2)
         mu <- input$mu
         lines(c(mu, mu), c(0, 26), col="red",lwd=5)
         rmse <- sqrt(mean((galaxies - mu)^2))
         dif<- (mean(galaxies) - mu)
         text(9300, 40, paste("you said: ", mu), cex = 1.6)
         text(10200, 35, paste("RMSE (error)= ", round(rmse, 0)), cex = 1.6, col="red")
         if(dif>0)
            text(9300, 30, paste("Add ", abs(round(dif, 0))), cex = 1.6, col="blue")
         if(dif<0)
            text(9300, 30, paste("Substract ", abs(round(dif, 0))), cex = 1.6, col="blue")
      })
      
      output$out1 <- renderText({input$mu})
      output$out2 <- renderText({mean(galaxies)-input$mu})
      output$out3 <- renderText({sqrt(mean((galaxies - input$mu)^2))})
      
      output$plot2 <- renderPlot({
         plot(galaxies, ylab='Velocity (km/sec)', xlab="Each one of the given galaxies in data set",
              col="orange", pch=8, lwd=3, main='Data set representation -SOLUTION-', cex.lab=1.6, cex.main=2.2)
         mu <- input$mu
         lines(x=c(0,length(galaxies)),y=c(mean(galaxies),mean(galaxies)), col="green",lwd=5)
         lines(x=c(0,length(galaxies)),y=c(mu,mu), col="red",lwd=5)
         rmse <- sqrt(mean((galaxies - mu)^2))
         dif<- (mean(galaxies) - mu)
         text(40, 32500, paste("you said", mu, ", your error is", round(rmse, 0)), cex = 2)
         if(dif>0)
            text(20, 25450, paste("Solution. Add ", abs(round(dif, 0))), cex = 2, col="blue")
         if(dif<0)
            text(30, 12550, paste("Solution. Substract ", abs(round(dif, 0))), cex = 2, col="blue")
      })
   }
)
