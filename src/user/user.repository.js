import prisma from "../../db/prisma.js";

const findUsers = async () => {
    const users = await prisma.user.findMany({
        include: {
            Profile: true,
        },
    });

    return users;
};

export { findUsers };
