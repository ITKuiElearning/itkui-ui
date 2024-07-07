#!/bin/sh

npx prisma generate --schema ./prisma/schema.prisma
npx prisma db push --schema ./prisma/schema.prisma