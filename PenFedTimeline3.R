> ggplot(BankWages, aes(x = education)) +
  
  + geom_histogram(binwidth = 1)

> ggplot(economics,
         
         +        aes(x = date, y = pop)) +
  
  +     geom_line()

> da

> force(economics)

# A tibble: 574 x 6

date         pce    pop psavert uempmed unemploy

<date>     <dbl>  <dbl>   <dbl>   <dbl>    <dbl>
  
  1 1967-07-01  507. 198712    12.6     4.5     2944

2 1967-08-01  510. 198911    12.6     4.7     2945

3 1967-09-01  516. 199113    11.9     4.6     2958

4 1967-10-01  512. 199311    12.9     4.9     3143

5 1967-11-01  517. 199498    12.8     4.7     3066

6 1967-12-01  525. 199657    11.8     4.8     3018

7 1968-01-01  531. 199808    11.7     5.1     2878

8 1968-02-01  534. 199920    12.3     4.5     3001

9 1968-03-01  544. 200056    11.7     4.1     2877

10 1968-04-01  544  200208    12.3     4.6     2709

# ? with 564 more rows

> BankWages %>%
  
  +     dplyr::group_by(job) %>%
  
  +     dplyr::summarize(mean = mean(education),
                         
                         +                      median = median(education),
                         
                         +                      sd = sd(education),
                         
                         +                      var = var(education),
                         
                         +                      n = n(),
                         
                         +                      max= max(education),
                         
                         +                      min = min(education),
                         
                         +                      p95 = quantile(education, p=.95),
                         
                         +                      p05 = quantile(education, p=.05))

# A tibble: 3 x 10

job        mean median    sd   var     n   max   min   p95   p05

<ord>     <dbl>  <dbl> <dbl> <dbl> <int> <int> <int> <dbl> <dbl>
  
  1 custodial  10.2     12  2.22  4.93    27    15     8    12   8 

2 admin      12.9     12  2.33  5.44   363    19     8    16   8 

3 manage     17.2     17  1.61  2.60    84    21    12    19  15.2

>
  
  > BankWages %>%
  
  +     dplyr::group_by(job) %>%
  
  +     dplyr::summarize(mean_educ = mean(education)) %>%
  
  +     ggplot(aes(x = job, y = mean_educ)) +
  
  +     geom_bar(stat = "identity")

>
  
  > ggplot(economics,
           
           +        aes(x = unemploy, y = psavert)) +
  
  +     geom_point()

>
  
  > ggplot(economics,
           
           +        +        aes(x = unemploy, y = unempmed)) +
  
  +     +     geom_point()

Error in +aes(x = unemploy, y = unempmed) :
  
  invalid argument to unary operator

> ggplot(economics,aes(x = unemploy, y = unempmed)) + geom_point()

Error in FUN(X[[i]], ...) : object 'unempmed' not found

> ggplot(economics,aes(unemploy, unempmed)) + geom_point()

Error in FUN(X[[i]], ...) : object 'unempmed' not found

> ggplot(economics,aes(unemploy, uempmed)) + geom_point()

> ggplot(economics,aes(date, uempmed)) + geom_point()

> ggplot(econmics_l3year,aes(uempmed,unemploy,fill=year))+geom_point(shape=21,size=5)

Error in ggplot(econmics_l3year, aes(uempmed, unemploy, fill = year)) :
  
  object 'econmics_l3year' not found

> ggplot(economics_l3year,aes(uempmed,unemploy,fill=year))+geom_point(shape=21,size=5)

Error in ggplot(economics_l3year, aes(uempmed, unemploy, fill = year)) :
  
  object 'economics_l3year' not found

> ggplot(economics,aes(uempmed,unemploy,fill=year))+geom_point(shape=21,size=5)

Don't know how to automatically pick scale for object of type function. Defaulting to continuous.

Error: Aesthetics must be valid data columns. Problematic aesthetic(s): fill = year.

Did you mistype the name of a data column or forget to add stat()?

> economics_l3year<-economics_scatter[which(economics_scatter$year==2013|economics_scatter$year==2014|economics_scatter$year==2015),]

Error: object 'economics_scatter' not found

> economics_scatter<-economics

> economic_scatter$year<-as.numeric(format(economics$date,'%Y'))

Error in economic_scatter$year <- as.numeric(format(economics$date, "%Y")) :

  object 'economic_scatter' not found

> economics_scatter$year<-as.numeric(format(economics$date,'%Y'))

> view(economics_scatter)

> economics_l3year<-economics_scatter[which(economics_scatter$year==2013|economics_scatter$year==2014|economics_scatter$year==2015),]

> view(economics_l3year)

> ggplot(economics_l3year,aes(uempmed,unemploy,fill=year))+geom_point(shape=21,size=5)

> economics_l3year$year<-as factor(economics_l3year$year)

Error: unexpected symbol in "economics_l3year$year<-as factor"

> economics_l3year$year<-as.factor(economics_l3year$year)

> str(economics_l3year)

Classes ?tbl_df?, ?tbl? and 'data.frame': 28 obs. of  7 variables:

$ date    : Date, format: "2013-01-01" "2013-02-01" "2013-03-01" ...

$ pce     : num  11203 11240 11227 11205 11245 ...

$ pop     : num  315390 315520 315662 315818 315984 ...

$ psavert : num  6.3 5.8 5.9 6.4 6.7 6.8 6.6 6.7 6.8 6.3 ...

$ uempmed : num  15.8 17.2 17.6 17.1 17.1 17 16.2 16.5 16.5 16.3 ...

$ unemploy: num  12471 11950 11689 11760 11654 ...

$ year    : Factor w/ 3 levels "2013","2014",..: 1 1 1 1 1 1 1 1 1 1 ...

> ggplot(economics_l3year,aes(color = year,uempmed,unemploy,fill=year))+geom_point(shape=21,size=5)

> library(readr)

> PenFedTimeline <- read_csv("Downloads/PenFedTimeline.csv",

+     col_names = FALSE, col_types = cols(X1 = col_date(format = "%m/%d/%Y")))

> View(PenFedTimeline)

> ggplot(penfed,aes(color=X3,X1,X2))+geom_point(shape=21,size=5)

Error in ggplot(penfed, aes(color = X3, X1, X2)) :

  object 'penfed' not found

> ?PenFedTimeline

No documentation for ?PenFedTimeline? in specified packages and libraries:

you could try ???PenFedTimeline?

> ggplot(PenFedTimeline,aes(color=X3,X1,X2))+geom_point(shape=21,size=5)

> ggplot(PenFedTimeline,aes(color=X3,X1,X2))+geom_point(shape=21,size=4)

> ggplot(PenFedTimeline,aes(color=X3,X1,X2))+geom_point(shape=21,size=3)

> ggplot(PenFedTimeline,aes(color=X3,X1,X2))+geom_point(shape=2,size=3)

> ggplot(PenFedTimeline,aes(color=X3,X1,X2))+geom_point(shape=2,size=2)

> ggplot(iris, aes(Sepal.Length, Sepal.Width))+

+     geom_point(aes(color = Species)) +

+     geom_smooth(aes(color = Species, fill = Species), method = "lm") +

+     scale_color_viridis(discrete = TRUE, option = "D")+

+     scale_fill_viridis(discrete = TRUE)

Error in scale_color_viridis(discrete = TRUE, option = "D") :

  could not find function "scale_color_viridis"

> ggplot(iris, aes(Sepal.Length, Sepal.Width))

>     +     geom_point(aes(color = Species))

Error: Cannot use `+.gg()` with a single argument. Did you accidentally put + on a new line?

>     +     geom_smooth(aes(color = Species, fill = Species), method = "lm")

Error: Cannot use `+.gg()` with a single argument. Did you accidentally put + on a new line?

>  ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species)) + geom_smooth(aes(color = Species, fill = Species), method = "lm") + scale_color_viridis(discrete = TRUE, option = "D") + scale_fill_viridis(discrete = TRUE)

Error in scale_color_viridis(discrete = TRUE, option = "D") :

  could not find function "scale_color_viridis"

> ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species)) + geom_smooth(aes(color = Species, fill = Species), method = "lm") + scale_color_viridis(discrete = TRUE, option = "D")

Error in scale_color_viridis(discrete = TRUE, option = "D") :

  could not find function "scale_color_viridis"

> ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species)) + geom_smooth(aes(color = Species, fill = Species), method = "lm")

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_point(aes(color = X3)) + geom_smooth(aes(color = X3, fill = X3), method = "lm")

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_point(aes(color = X3))

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_smooth(aes(color = X3, fill = X3), method = "lm")

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_smooth(aes(color = X3, fill = X3), method = "lm") + 

+     facet_grid(group ~ .)

Error: At least one layer must contain all faceting variables: `group`.

* Plot is missing `group`

* Layer 1 is missing `group`

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_smooth(aes(color = X3, fill = X3), method = "lm") + facet_grid(X3)

Error in grid_as_facets_list(rows, cols) : object 'X3' not found

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_smooth(aes(color = X3, fill = X3), method = "lm") + facet_grid(X1,X3)

Error in facet_grid(X1, X3) : object 'X3' not found

> ?facet_grid

> p <- ggplot(mpg, aes(displ, cty)) + geom_point()

>

> p <- ggplot(mpg, aes(displ, cty)) + geom_point()

> p + facet_grid(rows = vars(drv))

> p + facet_grid(cols = vars(cyl))

> p + facet_grid(vars(drv), vars(cyl))

> x<-ggplot(PenFedTimeline, aes(X1, X2)) + geom_smooth(aes(color = X3, fill = X3), method = "lm")

> x + facet_grid(rows=vars(X1))

> x + facet_grid(cols=vars(X2))

Warning messages:

1: In qt((1 - level)/2, df) : NaNs produced

2: In qt((1 - level)/2, df) : NaNs produced

3: In qt((1 - level)/2, df) : NaNs produced

4: In qt((1 - level)/2, df) : NaNs produced

> x + facet_grid((vars(x1),vars(x2)))

Error: unexpected ',' in "x + facet_grid((vars(x1),"

> x + facet_grid((vars(x1),vars(x2))

Error: unexpected ',' in "x + facet_grid((vars(x1),"

> x + facet_grid(vars(x1),vars(x2))

Error: At least one layer must contain all faceting variables: `x1`.

* Plot is missing `x1`

* Layer 1 is missing `x1`

> x + facet_grid(cols=vars(X2))

Warning messages:

1: In qt((1 - level)/2, df) : NaNs produced

2: In qt((1 - level)/2, df) : NaNs produced

3: In qt((1 - level)/2, df) : NaNs produced

4: In qt((1 - level)/2, df) : NaNs produced

> x + facet_grid(cols=vars(X1))

> x + facet_grid(rows=vars(X2))

Warning messages:

1: In qt((1 - level)/2, df) : NaNs produced

2: In qt((1 - level)/2, df) : NaNs produced

3: In qt((1 - level)/2, df) : NaNs produced

4: In qt((1 - level)/2, df) : NaNs produced

> x + facet_grid(vars(x1),vars(x2))

Error: At least one layer must contain all faceting variables: `x1`.

* Plot is missing `x1`

* Layer 1 is missing `x1`

> x + facet_grid(vars(X1),vars(X2))

> x + facet_grid(rows=vars(X2))

Warning messages:

1: In qt((1 - level)/2, df) : NaNs produced

2: In qt((1 - level)/2, df) : NaNs produced

3: In qt((1 - level)/2, df) : NaNs produced

4: In qt((1 - level)/2, df) : NaNs produced

> ggplot(PenFedTimeline, aes(X1, X2)) + geom_smooth(aes(color = X2, fill = X2), method = "lm") + facet_grid(X2)

Error in grid_as_facets_list(rows, cols) : object 'X3' not found



;
)
glimpse(time_trend)
filter(.data2=PenFedTimeline4,X2=="Personal Loans")
head(PenFedTimeline4)
)
glimpse(x=PenFedTimeline4)


PenFedTimeline3 <- read_csv("R/PenFedTimeline3.txt" 
+  col_names = FALSE, col_types = cols(X1 = col_date,(format = "%m/%d/%y"))

PenFedTimeline3 <- read_csv("R/PenFedTimeline3.txt", 
+     col_names = FALSE, col_types = cols(X1 = col_date(format = "%m/%d/%y")))
