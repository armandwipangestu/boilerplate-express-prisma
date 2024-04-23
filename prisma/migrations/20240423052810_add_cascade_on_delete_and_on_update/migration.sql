-- DropForeignKey
ALTER TABLE "_CategorysOnPost" DROP CONSTRAINT "_CategorysOnPost_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "_CategorysOnPost" DROP CONSTRAINT "_CategorysOnPost_postId_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_authorId_fkey";

-- DropForeignKey
ALTER TABLE "profiles" DROP CONSTRAINT "profiles_userId_fkey";

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategorysOnPost" ADD CONSTRAINT "_CategorysOnPost_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategorysOnPost" ADD CONSTRAINT "_CategorysOnPost_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categorys"("category_id") ON DELETE CASCADE ON UPDATE CASCADE;
