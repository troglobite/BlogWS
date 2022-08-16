module Blog.Posts.Types where

import Data.Text (Text)
import Data.Time (UTCTime)
import Data.Functor.Identity (Identity)

data Post = Post
  { postId          :: Int
  , postTitle       :: Text
  , postContent     :: Text
  , postAuthor      :: Text
  , postPublishedAt :: UTCTime
  } deriving (Eq, Show)

data PostIn f = PostIn
  { npiTitle   :: f Text
  , npiContent :: f Text
  , npiAuthor  :: f Text
  }

type NewPostIn = PostIn Identity
type EditPostIn = PostIn Maybe