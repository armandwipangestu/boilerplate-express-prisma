import { execSync } from "child_process";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    try {
        console.log("Dropping all tables...");
        // Menjalankan perintah SQL mentah untuk menjatuhkan semua tabel
        // execSync(`npx prisma migrate reset --force`);

        console.log("Applying schema migration...");
        // Menerapkan definisi skema kembali menggunakan migrasi
        // execSync(`npx prisma migrate dev --name up`);

        console.log("Seeding data...");
        // Mulai seeding data
        await seedData();

        console.log("Seeding completed.");
    } catch (error) {
        console.error("An error occurred:", error);
    } finally {
        await prisma.$disconnect();
    }
}

async function seedData() {
    const userData = [
        {
            name: "John",
            email: "john@prisma.io",
            Post: {
                create: [
                    {
                        title: "Join the Prisma Stack",
                        published: true,
                        CategorysOnPost: {
                            create: [
                                {
                                    category: {
                                        create: {
                                            name: "Database",
                                        },
                                    },
                                },
                                {
                                    category: {
                                        create: {
                                            name: "Big Data",
                                        },
                                    },
                                },
                            ],
                        },
                    },
                ],
            },
        },
        {
            name: "Jack",
            email: "jack@prisma.io",
            Post: {
                create: [
                    {
                        title: "Follow Prisma on Twitter",
                        published: true,
                        CategorysOnPost: {
                            create: [
                                {
                                    category: {
                                        connect: {
                                            category_id: 1,
                                        },
                                    },
                                },
                            ],
                        },
                    },
                ],
            },
        },
        {
            name: "Sara",
            email: "sara@prisma.io",
            Post: {
                create: [
                    {
                        title: "Ask a question about Primsa on GitHub",
                        published: true,
                        CategorysOnPost: {
                            create: [
                                {
                                    category: {
                                        connect: {
                                            category_id: 2,
                                        },
                                    },
                                },
                            ],
                        },
                    },
                    {
                        title: "Prisma on YouTube",
                        CategorysOnPost: {
                            create: [
                                {
                                    category: {
                                        connect: {
                                            category_id: 1,
                                        },
                                    },
                                },
                            ],
                        },
                    },
                ],
            },
        },
    ];

    for (const u of userData) {
        const user = await prisma.user.create({
            data: {
                ...u,
                role: "USER",
            },
            include: {
                Post: {
                    include: {
                        CategorysOnPost: true,
                    },
                },
            },
        });
        console.log(`Created user with id: ${user.id}`);
    }
}

main();
