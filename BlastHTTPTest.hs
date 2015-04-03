-- | BlastHTTP test script
-- /scr/kronos/egg/ghc/ghc/bin/runghc BlastHTTPTest.hs /home/mescalin/egg/initialfasta/RybB/aeromonas.fa

module Main where
    
import System.Environment (getArgs)
import System.Process 
import Text.ParserCombinators.Parsec
import System.IO
import System.Environment
import Data.List
import System.Directory
import System.Process
import Control.Monad    
import Data.Either.Unwrap
import Bio.Core.Sequence
import Bio.BlastHTTP
import Bio.Sequence.Fasta
import qualified Data.ByteString.Lazy.Char8 as L8
    
main = do
  args <- getArgs
  let input_file = (head args)
  putStrLn "Test:"
  inputFasta <- readFasta input_file
  --let blastQuery = BlastHTTPQuery (Just "ebi") (Just "blastn") (Just "em_rel_mam") (Just fastaSeqData) Nothing
  let blastQuery = BlastHTTPQuery (Just "ncbi") (Just "blastn") (Just "nt") inputFasta Nothing
  blastOutput <- blastHTTP blastQuery 
  print blastOutput

