-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateEnum
CREATE TYPE "ContactMethod" AS ENUM ('EMAIL', 'PHONE', 'SMS', 'WHATSAPP', 'SOCIAL_MEDIA');

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Customer" (
    "CustomerID" TEXT NOT NULL,
    "FirstName" TEXT,
    "LastName" TEXT,
    "Email" TEXT,
    "PhoneNumber" BIGINT,
    "Address" TEXT,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("CustomerID")
);

-- CreateTable
CREATE TABLE "Contact" (
    "ContactID" TEXT NOT NULL,
    "CustomerID" TEXT NOT NULL,
    "ContactDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ContactMethod" "ContactMethod" NOT NULL,
    "Notes" TEXT NOT NULL,

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("ContactID")
);

-- CreateTable
CREATE TABLE "Products" (
    "ProductID" TEXT NOT NULL,
    "ProductName" TEXT NOT NULL,
    "ProductDescription" TEXT NOT NULL,
    "Price" INTEGER NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("ProductID")
);

-- CreateTable
CREATE TABLE "Sales" (
    "SaleID" TEXT NOT NULL,
    "CustomerID" TEXT NOT NULL,
    "ProductID" TEXT NOT NULL,
    "DateOfSale" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Amount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Sales_pkey" PRIMARY KEY ("SaleID")
);

-- CreateTable
CREATE TABLE "Employees" (
    "EmployeeID" TEXT NOT NULL,
    "FirstName" TEXT,
    "LastName" TEXT,
    "Role" "Role" NOT NULL,
    "Email" TEXT NOT NULL,

    CONSTRAINT "Employees_pkey" PRIMARY KEY ("EmployeeID")
);

-- CreateIndex
CREATE INDEX "Post_name_idx" ON "Post"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_CustomerID_fkey" FOREIGN KEY ("CustomerID") REFERENCES "Customer"("CustomerID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_CustomerID_fkey" FOREIGN KEY ("CustomerID") REFERENCES "Customer"("CustomerID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES "Products"("ProductID") ON DELETE CASCADE ON UPDATE CASCADE;
