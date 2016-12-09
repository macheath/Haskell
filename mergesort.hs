
mergesort'split :: [a] -> ([a], [a])
mergesort'split xs = (take n xs, drop n xs)
                     where n = (length xs) `div` 2

mergesort'merge :: (Ord a) => [a] -> [a] -> [a]
mergesort'merge [] xs = xs
mergesort'merge xs [] = xs
mergesort'merge (x:xs) (y:ys)
              | (x<y) = x:mergesort'merge xs (y:ys)
              | otherwise = y:mergesort'merge (x:xs) ys

mergesort :: (Ord a) => [a] -> [a]
mergesort xs
    | (length xs) <= 1 = xs
    | otherwise = mergesort'merge (mergesort ls) (mergesort rs)
      where (ls, rs) = mergesort'split xs
