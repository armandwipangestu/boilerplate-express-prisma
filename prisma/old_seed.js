import { PrismaClient, Prisma } from "@prisma/client";

const prisma = new PrismaClient();

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
                                        category_id: 11,
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
                                        category_id: 12,
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
                                        category_id: 11,
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

async function main() {
    console.log(`Cleaning database...`);

    await prisma.categorysOnPost.deleteMany({});
    await prisma.category.deleteMany({});
    await prisma.post.deleteMany({});
    await prisma.profile.deleteMany({});
    await prisma.user.deleteMany({});

    console.log(`Database cleaned.`);

    console.log(`Start seeding ...`);
    for (const u of userData) {
        const user = await prisma.user.create({
            data: u,
        });

        console.log(`Created user with id: ${user.id}`);
    }
    console.log(`Seeding finished.`);
}

main()
    .then(async () => {
        await prisma.$disconnect();
    })
    .catch(async (e) => {
        console.error(e);
        await prisma.$disconnect();
        process.exit(1);
    });
