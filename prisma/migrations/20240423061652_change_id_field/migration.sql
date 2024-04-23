/*
  Warnings:

  - The primary key for the `categorys` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `category_id` on the `categorys` table. All the data in the column will be lost.
  - The `id` column on the `categorys` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `posts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `post_id` on the `posts` table. All the data in the column will be lost.
  - The `id` column on the `posts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `profiles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `profile_id` on the `profiles` table. All the data in the column will be lost.
  - The `id` column on the `profiles` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `user_id` on the `users` table. All the data in the column will be lost.
  - The `id` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[_uid]` on the table `categorys` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[_uid]` on the table `posts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[_uid]` on the table `profiles` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[_uid]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - The required column `_uid` was added to the `categorys` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `_uid` was added to the `posts` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `_uid` was added to the `profiles` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `_uid` was added to the `users` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "_CategorysOnPost" DROP CONSTRAINT "_CategorysOnPost_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "_CategorysOnPost" DROP CONSTRAINT "_CategorysOnPost_postId_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_authorId_fkey";

-- DropForeignKey
ALTER TABLE "profiles" DROP CONSTRAINT "profiles_userId_fkey";

-- DropIndex
DROP INDEX "categorys_id_key";

-- DropIndex
DROP INDEX "posts_id_key";

-- DropIndex
DROP INDEX "profiles_id_key";

-- DropIndex
DROP INDEX "users_id_key";

-- AlterTable
ALTER TABLE "categorys" DROP CONSTRAINT "categorys_pkey",
DROP COLUMN "category_id",
ADD COLUMN     "_uid" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "categorys_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "posts" DROP CONSTRAINT "posts_pkey",
DROP COLUMN "post_id",
ADD COLUMN     "_uid" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "profiles" DROP CONSTRAINT "profiles_pkey",
DROP COLUMN "profile_id",
ADD COLUMN     "_uid" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "user_id",
ADD COLUMN     "_uid" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "categorys__uid_key" ON "categorys"("_uid");

-- CreateIndex
CREATE UNIQUE INDEX "posts__uid_key" ON "posts"("_uid");

-- CreateIndex
CREATE UNIQUE INDEX "profiles__uid_key" ON "profiles"("_uid");

-- CreateIndex
CREATE UNIQUE INDEX "users__uid_key" ON "users"("_uid");

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategorysOnPost" ADD CONSTRAINT "_CategorysOnPost_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategorysOnPost" ADD CONSTRAINT "_CategorysOnPost_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categorys"("id") ON DELETE CASCADE ON UPDATE CASCADE;
