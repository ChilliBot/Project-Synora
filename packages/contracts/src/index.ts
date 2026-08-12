export const serviceInfo = { api: "synora-api" } as const;
export type ErrorCode = "AUTHENTICATION_REQUIRED" | "AUTHORIZATION_REQUIRED" | "AUTHORIZATION_REVOKED" | "SCOPE_INSUFFICIENT" | "INTERNAL_ERROR";
export interface ApiError { error: { code: ErrorCode; message: string; request_id: string } }
