library(shiny)
library(Rmpfr)
library(RMySQL)

			
shinyServer(function(input, output){


      
      output$result <- renderText({
            
            precisionBits <- input$precision
            one <- mpfr(1, precBits = precisionBits) 
            e <- exp(one)
            # TODO fix printing...
            x <- capture.output(print(e, ndigits = precisionBits))[2]
            gsub("^\\[1\\] (.+)$", "\\1", x)
          })
		  
		  
	con<-dbConnect(MySQL(),dbname="gz_data",username="baidu",
                password="123456",host="localhost",port=8836)
    query<-dbGetQuery(con, "SELECT * from r_zx_cash limit 10")		  
		  
		  
	 output$tbl <- DT::renderDataTable({	  
		  datatable(query)
		  
		  })
      
    })
