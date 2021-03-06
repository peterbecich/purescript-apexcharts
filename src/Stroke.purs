
module Apexcharts.Stroke where


import Apexcharts


import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Stroke

data Curve = 
    Smooth 
    | Straight 
    | Stepline

curveToString :: Curve -> String
curveToString = case _ of
    Smooth -> "smooth"
    Straight -> "straight" 
    Stepline-> "stepline"

data LineCap = 
    Butt  
    | Square
    | Round 

lineCapToString :: LineCap -> String
lineCapToString = case _ of
    Butt -> "butt"
    Square -> "square"
    Round -> "round"

stroke :: Option Apexoptions (Options Stroke)
stroke = cmap Opt.options (opt "stroke")

show :: Option Stroke Boolean
show = opt "show"

curve :: Option Stroke Curve
curve = cmap curveToString (opt "curve")

lineCap :: Option Stroke LineCap
lineCap = cmap lineCapToString (opt "lineCap")

colors :: Option Stroke (Array String)
colors = opt "colors"


class StrokeWidth a where
    width :: Option Stroke a
  
instance numwidth :: StrokeWidth Number where
    width = opt "width"

instance intwidth :: StrokeWidth Int where
    width = opt "width"

instance arrayNumwidth :: StrokeWidth (Array Number) where
    width = opt "width"

instance arrayIntwidth :: StrokeWidth (Array Int) where
    width = opt "width"


dashArray :: Option Stroke Number
dashArray = opt "dashArray"

