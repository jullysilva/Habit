/*
  Warnings:

  - You are about to drop the column `habbit_id` on the `habbit_week_days` table. All the data in the column will be lost.
  - Added the required column `habit_id` to the `habbit_week_days` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_habbit_week_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "habbit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_habbit_week_days" ("id", "week_day") SELECT "id", "week_day" FROM "habbit_week_days";
DROP TABLE "habbit_week_days";
ALTER TABLE "new_habbit_week_days" RENAME TO "habbit_week_days";
CREATE UNIQUE INDEX "habbit_week_days_habit_id_week_day_key" ON "habbit_week_days"("habit_id", "week_day");
CREATE TABLE "new_day_habbit" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_id" TEXT NOT NULL,
    "habit_id" TEXT NOT NULL,
    CONSTRAINT "day_habbit_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "day_habbit_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_day_habbit" ("day_id", "habit_id", "id") SELECT "day_id", "habit_id", "id" FROM "day_habbit";
DROP TABLE "day_habbit";
ALTER TABLE "new_day_habbit" RENAME TO "day_habbit";
CREATE UNIQUE INDEX "day_habbit_day_id_habit_id_key" ON "day_habbit"("day_id", "habit_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
