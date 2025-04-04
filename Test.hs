import Data.Text.IO as T
import qualified Data.Text as T

main :: IO()
main = do
    content <- T.readFile "Basic.vm"
    let lines = T.lines content
    T.putStrLn $ head lines 