{-# LANGUAGE RecordWildCards #-}

module LN.Sanitize.Board (
  sanitizeBoardRequest
) where



import           Prelude

import           LN.Sanitize.Internal (sanitizeLine)
import           LN.T.Board           (BoardRequest (..))



sanitizeBoardRequest :: BoardRequest -> BoardRequest
sanitizeBoardRequest (BoardRequest display_name m_desc is_anonymous can_create_sub_boards can_create_threads suggested_tags icon tags guard _ _) =
  BoardRequest
    (sanitizeLine display_name)
    (sanitizeLine <$> m_desc)
    is_anonymous
    can_create_sub_boards
    can_create_threads
    (map sanitizeLine suggested_tags)
    icon
    (map sanitizeLine tags)
    guard
    -- state
    Nothing
    Nothing
