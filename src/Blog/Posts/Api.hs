{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Blog.Posts.Api where

import Servant hiding (Post)
import Blog.Posts.Types (Post, NewPostIn, EditPostIn)

type BlogService = "blog" :> PostsAPI

type PostsAPI 
  = "posts" :> 
    ( IndexPost 
      :<|> ShowPost 
      :<|> CreatePost
      :<|> UpdatePost
      :<|> DestoryPost
    )
  
type IndexPost
  =  Get '[JSON] [Post]

type ShowPost
  = Capture "postId" Int 
  :> Get '[JSON] Post

type CreatePost
  = ReqBody '[JSON] NewPostIn 
  :> PostCreated '[JSON] Post

type UpdatePost
  = Capture "postId" Int 
  :> ReqBody '[JSON] EditPostIn 
  :> Put '[JSON] Post

type DestoryPost
  = Capture "postId" Int
  :> DeleteNoContent