Param([alias("h")][int]$height=4,[alias("t")][string]$text="hello world")

Function Print-Barcode ([int] $_h, [string] $_b){

    $_b = (Text-Converter $_b)

    #add spaces before/after barcode
    $local:spaces = 2
    $_b = (" "*$spaces) + $_b + (" "*$spaces)

    #print
    Write-Host (" "*($_b.Length)) -ForegroundColor Black -BackgroundColor White
    for ($i=0;$i -le $_h;$i++)
    {
      Write-Host $_b -ForegroundColor Black -BackgroundColor White
    }
    Write-Host (" "*($_b.Length)) -ForegroundColor Black -BackgroundColor White
}

Function Text-Converter ([string] $_text){
    $_text              = "*" + ($_text.replace("*","").ToUpper()) + "*"
    $local:outBar       = ""
    $local:blackwhite   = ""
    foreach ($i in $_text.ToCharArray()) {


        #add space between char
        $outBar += "w"


        for ($j=0;$j -lt 9;$j++){
          if (![bool]($j%2))
          {
            if ([bool]$characters.Item($i.ToString()).word[$j]) { $outBar += "bb" } else { $outBar += "b" }
          }
          else
          {
            if ([bool]$characters.Item($i.ToString()).word[$j]) { $outBar += "ww" } else { $outBar += "w" }
          }
        }
    }
    if ([bool]($outBar.Length % 2)){$outBar += "w"}

    for ($i=0;$i -lt ($outBar.Length);$i+=2){
        $blackwhite += $bricks.($outBar.Substring($i,2))
    }

    return $blackwhite
}

[hashtable]$characters = @{
                           "0" = @{word = @(0,0,0,1,1,0,1,0,0); bars = @(0,0,1,1,0); spaces = @(0,1,0,0); value = 0}
                           "1" = @{word = @(1,0,0,1,0,0,0,0,1); bars = @(1,0,0,0,1); spaces = @(0,1,0,0); value = 1}
                           "2" = @{word = @(0,0,1,1,0,0,0,0,1); bars = @(0,1,0,0,1); spaces = @(0,1,0,0); value = 2}
                           "3" = @{word = @(1,0,1,1,0,0,0,0,0); bars = @(1,1,0,0,0); spaces = @(0,1,0,0); value = 3}
                           "4" = @{word = @(0,0,0,1,1,0,0,0,1); bars = @(0,0,1,0,1); spaces = @(0,1,0,0); value = 4}
                           "5" = @{word = @(1,0,0,1,1,0,0,0,0); bars = @(1,0,1,0,0); spaces = @(0,1,0,0); value = 5}
                           "6" = @{word = @(0,0,1,1,1,0,0,0,0); bars = @(0,1,1,0,0); spaces = @(0,1,0,0); value = 6}
                           "7" = @{word = @(0,0,0,1,0,0,1,0,1); bars = @(0,0,0,1,1); spaces = @(0,1,0,0); value = 7}
                           "8" = @{word = @(1,0,0,1,0,0,1,0,0); bars = @(1,0,0,1,0); spaces = @(0,1,0,0); value = 8}
                           "9" = @{word = @(0,0,1,1,0,0,1,0,0); bars = @(0,1,0,1,0); spaces = @(0,1,0,0); value = 9}
                           "A" = @{word = @(1,0,0,0,0,1,0,0,1); bars = @(1,0,0,0,1); spaces = @(0,0,1,0); value = 10}
                           "B" = @{word = @(0,0,1,0,0,1,0,0,1); bars = @(0,1,0,0,1); spaces = @(0,0,1,0); value = 11}
                           "C" = @{word = @(1,0,1,0,0,1,0,0,0); bars = @(1,1,0,0,0); spaces = @(0,0,1,0); value = 12}
                           "D" = @{word = @(0,0,0,0,1,1,0,0,1); bars = @(0,0,1,0,1); spaces = @(0,0,1,0); value = 13}
                           "E" = @{word = @(1,0,0,0,1,1,0,0,0); bars = @(1,0,1,0,0); spaces = @(0,0,1,0); value = 14}
                           "F" = @{word = @(0,0,1,0,1,1,0,0,0); bars = @(0,1,1,0,0); spaces = @(0,0,1,0); value = 15}
                           "G" = @{word = @(0,0,0,0,0,1,1,0,1); bars = @(0,0,0,1,1); spaces = @(0,0,1,0); value = 16}
                           "H" = @{word = @(1,0,0,0,0,1,1,0,0); bars = @(1,0,0,1,0); spaces = @(0,0,1,0); value = 17}
                           "I" = @{word = @(0,0,1,0,0,1,1,0,0); bars = @(0,1,0,1,0); spaces = @(0,0,1,0); value = 18}
                           "J" = @{word = @(0,0,0,0,1,1,1,0,0); bars = @(0,0,1,1,0); spaces = @(0,0,1,0); value = 19}
                           "K" = @{word = @(1,0,0,0,0,0,0,1,1); bars = @(1,0,0,0,1); spaces = @(0,0,0,1); value = 20}
                           "L" = @{word = @(0,0,1,0,0,0,0,1,1); bars = @(0,1,0,0,1); spaces = @(0,0,0,1); value = 21}
                           "M" = @{word = @(1,0,1,0,0,0,0,1,0); bars = @(1,1,0,0,0); spaces = @(0,0,0,1); value = 22}
                           "N" = @{word = @(0,0,0,0,1,0,0,1,1); bars = @(0,0,1,0,1); spaces = @(0,0,0,1); value = 23}
                           "O" = @{word = @(1,0,0,0,1,0,0,1,0); bars = @(1,0,1,0,0); spaces = @(0,0,0,1); value = 24}
                           "P" = @{word = @(0,0,1,0,1,0,0,1,0); bars = @(0,1,1,0,0); spaces = @(0,0,0,1); value = 25}
                           "Q" = @{word = @(0,0,0,0,0,0,1,1,1); bars = @(0,0,0,1,1); spaces = @(0,0,0,1); value = 26}
                           "R" = @{word = @(1,0,0,0,0,0,1,1,0); bars = @(1,0,0,1,0); spaces = @(0,0,0,1); value = 27}
                           "S" = @{word = @(0,0,1,0,0,0,1,1,0); bars = @(0,1,0,1,0); spaces = @(0,0,0,1); value = 28}
                           "T" = @{word = @(0,0,0,0,1,0,1,1,0); bars = @(0,0,1,1,0); spaces = @(0,0,0,1); value = 29}
                           "U" = @{word = @(1,1,0,0,0,0,0,0,1); bars = @(1,0,0,0,1); spaces = @(1,0,0,0); value = 30}
                           "V" = @{word = @(0,1,1,0,0,0,0,0,1); bars = @(0,1,0,0,1); spaces = @(1,0,0,0); value = 31}
                           "W" = @{word = @(1,1,1,0,0,0,0,0,0); bars = @(1,1,0,0,0); spaces = @(1,0,0,0); value = 32}
                           "X" = @{word = @(0,1,0,0,1,0,0,0,1); bars = @(0,0,1,0,1); spaces = @(1,0,0,0); value = 33}
                           "Y" = @{word = @(1,1,0,0,1,0,0,0,0); bars = @(1,0,1,0,0); spaces = @(1,0,0,0); value = 34}
                           "Z" = @{word = @(0,1,1,0,1,0,0,0,0); bars = @(0,1,1,0,0); spaces = @(1,0,0,0); value = 35}
                           "-" = @{word = @(0,1,0,0,0,0,1,0,1); bars = @(0,0,0,1,1); spaces = @(1,0,0,0); value = 36}
                           "." = @{word = @(1,1,0,0,0,0,1,0,0); bars = @(1,0,0,1,0); spaces = @(1,0,0,0); value = 37}
                           " " = @{word = @(0,1,1,0,0,0,1,0,0); bars = @(0,1,0,1,0); spaces = @(1,0,0,0); value = 38}
                           "*" = @{word = @(0,1,0,0,1,0,1,0,0); bars = @(0,0,1,1,0); spaces = @(1,0,0,0); value = $null}
                           "$" = @{word = @(0,1,0,1,0,1,0,0,0); bars = @(0,0,0,0,0); spaces = @(1,1,1,0); value = 39}
                           "/" = @{word = @(0,1,0,1,0,0,0,1,0); bars = @(0,0,0,0,0); spaces = @(1,1,0,1); value = 40}
                           "+" = @{word = @(0,1,0,0,0,1,0,1,0); bars = @(0,0,0,0,0); spaces = @(1,0,1,1); value = 41}
                           "%" = @{word = @(0,0,0,1,0,1,0,1,0); bars = @(0,0,0,0,0); spaces = @(0,1,1,1); value = 42}
}

[hashtable]$bricks = @{
            bb = (([char]0x2588).ToString())   # "XX"  # "█"
            bw = (([char]0x258C).ToString())   # "X "  # "▌"
            wb = (([char]0x2590).ToString())   # " X"  # "▐"
            ww = (([char]0x20).ToString())     # "  "  # " "
            }



Print-Barcode $height $text
