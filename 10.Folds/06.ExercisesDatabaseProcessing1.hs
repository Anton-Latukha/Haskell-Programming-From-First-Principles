import Data.Time 

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
              (fromGregorian 1911 5 1)
              (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
              (fromGregorian 1921 5 1)
              (secondsToDiffTime 34123))]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate dbRecords = foldr (\ element result -> go element result) [] dbRecords
    where go element result
            | isDbDate (element) = result++[returnUTC (element)]
            | True = result



isDbString :: DatabaseItem -> Bool
isDbString (DbString _) = True
isDbString _     = False

isDbNumber :: DatabaseItem -> Bool
isDbNumber (DbNumber _) = True
isDbNumber _     = False

isDbDate :: DatabaseItem -> Bool
isDbDate (DbDate (UTCTime _ _)) = True
isDbDate _     = False

printUtc :: DatabaseItem -> IO ()
printUtc (DbDate time) = print time

returnUTC :: DatabaseItem -> UTCTime
returnUTC (DbDate time) = time
