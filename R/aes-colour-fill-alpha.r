#' Colour related aesthetics: colour, fill, and alpha
#'
#' These aesthetics parameters change the colour (`colour` and `fill`) and the
#' opacity (`alpha`) of geom elements on a plot. Almost every geom has either
#' colour or fill (or both), as well as can have their alpha modified.
#' Modifying colour on a plot is a useful way to enhance the presentation of data,
#' often especially when a plot graphs more than two variables.
#'
#' @section Colour and fill:
#'
#' Colours and fills can be specified in the following ways:
#' * A name, e.g., `"red"`. R has 657 built-in named colours, which can be
#' listed with [colours()].
#' * An rgb specification, with a string of the form `"#RRGGBB"` where each of the
#' pairs `RR`, `GG`, `BB` consists of two hexadecimal digits giving a value in the
#' range `00` to `FF`. You can optionally make the colour transparent by using the
#' form `"#RRGGBBAA"`.
#' * An `NA`, for a completely transparent colour.
#'
#' @section Alpha:
#'
#' Alpha refers to the opacity of a geom. Values of `alpha` range from 0 to 1,
#' with lower values corresponding to more transparent colors.
#'
#' Alpha can additionally be modified through the `colour` or `fill` aesthetic
#' if either aesthetic provides color values using an rgb specification
#' (`"#RRGGBBAA"`), where `AA` refers to transparency values.
#'
#'
#' @seealso
#' * Other options for modifying colour:
#' [scale_colour_brewer()], [scale_colour_distiller()],
#' [scale_colour_continuous()], [scale_colour_gradient()],
#' [scale_colour_gradient2()], [scale_colour_gradientn()],
#' [scale_colour_grey()], [scale_colour_hue()], [scale_colour_identity()],
#' [scale_colour_manual()], [scale_colour_viridis_d()]
#' * Other options for modifying fill:
#' [scale_fill_brewer()], [scale_fill_distiller()],
#' [scale_fill_continuous()], [scale_fill_gradient()],
#' [scale_fill_gradient2()], [scale_fill_gradientn()],
#' [scale_fill_grey()], [scale_fill_hue()], [scale_fill_identity()],
#' [scale_fill_manual()]
#' * Other options for modifying alpha: [scale_alpha()]
#' * [vignette("ggplot-specs")] provides an overview of other aesthestics that
#' can be modified
#'
#' @name aes_colour_fill_alpha
#' @aliases colour color fill
#' @examples
#' \donttest{
#'
#' # Bar chart example
#' c <- ggplot(mtcars, aes(factor(cyl)))
#' # Default plotting
#' c + geom_bar()
#' # To change the interior colouring use fill aesthetic
#' c + geom_bar(fill = "red")
#' # Compare with the colour aesthetic which changes just the bar outline
#' c + geom_bar(colour = "red")
#' # Combining both, you can see the changes more clearly
#' c + geom_bar(fill = "white", colour = "red")
#'
#' # The aesthetic fill also takes different colouring scales
#' # setting fill equal to a factor variable uses a discrete colour scale
#' k <- ggplot(mtcars, aes(factor(cyl), fill = factor(vs)))
#' k + geom_bar()
#'
#' # Fill aesthetic can also be used with a continuous variable
#' m <- ggplot(faithfuld, aes(waiting, eruptions))
#' m + geom_raster()
#' m + geom_raster(aes(fill = density))
#'
#' # Some geoms don't use both aesthetics (i.e. geom_point or geom_line)
#' b <- ggplot(economics, aes(x = date, y = unemploy))
#' b + geom_line()
#' b + geom_line(colour = "green")
#' b + geom_point()
#' b + geom_point(colour = "red")
#'
#' # For large datasets with overplotting the alpha
#' # aesthetic will make the points more transparent
#' df <- data.frame(x = rnorm(5000), y = rnorm(5000))
#' h  <- ggplot(df, aes(x,y))
#' h + geom_point()
#' h + geom_point(alpha = 0.5)
#' h + geom_point(alpha = 1/10)
#'
#' # Alpha can also be used to add shading
#' j <- b + geom_line()
#' j
#' yrng <- range(economics$unemploy)
#' j <- j + geom_rect(aes(NULL, NULL, xmin = start, xmax = end, fill = party),
#' ymin = yrng[1], ymax = yrng[2], data = presidential)
#' j
#' j + scale_fill_manual(values = alpha(c("blue", "red"), .3))
#' }
NULL
