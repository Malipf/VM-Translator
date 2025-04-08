module Parser where

import qualified Data.Text as T

data CommandType = C_ARITHMETIC | C_POP | C_PUSH
  deriving (Show, Eq)

logicCmd :: [T.Text]
logicCmd = map T.pack ["add", "sub", "neg", "and", "or", "not", "ls", "eq", "gt"]

commandType :: T.Text -> CommandType
commandType cmd
  | cmd == T.pack "push" = C_PUSH
  | cmd == T.pack "pop"  = C_POP
  | cmd `elem` logicCmd  = C_ARITHMETIC

arg1 :: T.Text -> T.Text
arg1 cmd = case commandType cmd of
  C_ARITHMETIC                  -> cmd
  c | c == C_POP || c == C_PUSH -> head . tail . T.words $ cmd

arg2 :: T.Text -> Int
arg2 cmd = case commandType cmd of
  c | c == C_POP || c == C_PUSH -> read . T.unpack . (!!2) . T.words $ cmd