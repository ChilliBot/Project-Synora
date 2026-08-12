CREATE TYPE "IdentityStatus" AS ENUM ('pending', 'ready', 'failed', 'deleted');
CREATE TYPE "GrantStatus" AS ENUM ('active', 'revoked', 'expired');
CREATE TYPE "RepresentationStatus" AS ENUM ('requested', 'queued', 'processing', 'validating', 'ready', 'failed', 'invalidated', 'deleted');
CREATE TYPE "JobStatus" AS ENUM ('queued', 'leased', 'running', 'retry_wait', 'succeeded', 'failed', 'cancelled');

CREATE TABLE "User" ("id" TEXT PRIMARY KEY, "status" TEXT NOT NULL DEFAULT 'active', "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "updatedAt" TIMESTAMP(3) NOT NULL);
CREATE TABLE "Identity" ("id" TEXT PRIMARY KEY, "userId" TEXT NOT NULL, "status" "IdentityStatus" NOT NULL DEFAULT 'pending', "canonicalVersion" INTEGER NOT NULL DEFAULT 1, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "updatedAt" TIMESTAMP(3) NOT NULL, "deletedAt" TIMESTAMP(3));
CREATE TABLE "DeveloperApplication" ("id" TEXT PRIMARY KEY, "ownerId" TEXT NOT NULL, "name" TEXT NOT NULL, "environment" TEXT NOT NULL, "clientType" TEXT NOT NULL, "status" TEXT NOT NULL DEFAULT 'active', "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE "AuthorizationGrant" ("id" TEXT PRIMARY KEY, "userId" TEXT NOT NULL, "identityId" TEXT NOT NULL, "applicationId" TEXT NOT NULL, "scopes" TEXT[], "status" "GrantStatus" NOT NULL DEFAULT 'active', "grantedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "revokedAt" TIMESTAMP(3));
CREATE TABLE "RepresentationProfile" ("id" TEXT NOT NULL, "version" INTEGER NOT NULL, "applicationId" TEXT NOT NULL, "representationType" TEXT NOT NULL, "constraints" JSONB NOT NULL, "status" TEXT NOT NULL DEFAULT 'active', PRIMARY KEY ("id", "version"));
CREATE TABLE "Representation" ("id" TEXT PRIMARY KEY, "identityId" TEXT NOT NULL, "applicationId" TEXT NOT NULL, "profileId" TEXT NOT NULL, "profileVersion" INTEGER NOT NULL, "canonicalVersion" INTEGER NOT NULL, "status" "RepresentationStatus" NOT NULL DEFAULT 'requested', "generatorVersion" TEXT NOT NULL, "assetSetId" TEXT, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE "ProcessingJob" ("id" TEXT PRIMARY KEY, "jobType" TEXT NOT NULL, "subjectId" TEXT NOT NULL, "idempotencyKey" TEXT NOT NULL, "status" "JobStatus" NOT NULL DEFAULT 'queued', "attempt" INTEGER NOT NULL DEFAULT 0, "availableAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "leaseOwner" TEXT, "leaseExpiresAt" TIMESTAMP(3), "errorCode" TEXT, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "startedAt" TIMESTAMP(3), "completedAt" TIMESTAMP(3));
CREATE TABLE "Asset" ("id" TEXT PRIMARY KEY, "assetSetId" TEXT NOT NULL, "kind" TEXT NOT NULL, "format" TEXT NOT NULL, "storageReference" TEXT NOT NULL, "checksum" TEXT NOT NULL, "sizeBytes" BIGINT NOT NULL, "metadata" JSONB NOT NULL, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "expiresAt" TIMESTAMP(3));
CREATE TABLE "AuditEvent" ("id" TEXT PRIMARY KEY, "actorType" TEXT NOT NULL, "actorId" TEXT NOT NULL, "action" TEXT NOT NULL, "subjectType" TEXT NOT NULL, "subjectId" TEXT NOT NULL, "applicationId" TEXT, "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "metadataSafe" JSONB NOT NULL);

CREATE UNIQUE INDEX "AuthorizationGrant_identityId_applicationId_key" ON "AuthorizationGrant"("identityId", "applicationId");
CREATE UNIQUE INDEX "ProcessingJob_jobType_idempotencyKey_key" ON "ProcessingJob"("jobType", "idempotencyKey");
ALTER TABLE "Identity" ADD CONSTRAINT "Identity_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id");
ALTER TABLE "AuthorizationGrant" ADD CONSTRAINT "AuthorizationGrant_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id");
ALTER TABLE "AuthorizationGrant" ADD CONSTRAINT "AuthorizationGrant_identityId_fkey" FOREIGN KEY ("identityId") REFERENCES "Identity"("id");
ALTER TABLE "AuthorizationGrant" ADD CONSTRAINT "AuthorizationGrant_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "DeveloperApplication"("id");
ALTER TABLE "RepresentationProfile" ADD CONSTRAINT "RepresentationProfile_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "DeveloperApplication"("id");
ALTER TABLE "Representation" ADD CONSTRAINT "Representation_identityId_fkey" FOREIGN KEY ("identityId") REFERENCES "Identity"("id");
ALTER TABLE "Representation" ADD CONSTRAINT "Representation_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "DeveloperApplication"("id");
ALTER TABLE "Representation" ADD CONSTRAINT "Representation_profileId_profileVersion_fkey" FOREIGN KEY ("profileId", "profileVersion") REFERENCES "RepresentationProfile"("id", "version");
