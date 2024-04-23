import prisma from "../db/prisma.js";
import { clean } from "./seed/helper/clean.js";
import { createUserWithProfile } from "./seed/helper/UserWithProfile.js";

async function main() {
    console.log(`Cleaning database...`);
    await clean();
    console.log(`Database cleaned.`);

    console.log(`Start seeding ...`);
    console.log(`Seeding createdUserWithProfile`);
    await createUserWithProfile(10)
        .then((usersWithProfiles) => {
            console.log(`Seeder createUserWithProfile success!`);
        })
        .catch((error) => {
            console.log(`Seeder createdUserWithProfile error: ${error}`);
        });
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
