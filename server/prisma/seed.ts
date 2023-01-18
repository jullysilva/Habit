import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

async function main() {
    await prisma.habit.create({
        data: {
            title: 'Tomar agua',
            created_at: new Date('2023-01-18-T00:00:00.000z')
        }
    })

}

main().then(async () => {
    await prisma.$disconnect()
}).catch(async (e) => {
    console.log(e)
    await prisma.$disconnect()
    process.exit(1)
})