select unnest((posts.postcontent).artworks)
from posts
where posts.author = 'john';