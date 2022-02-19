import { Secret, verify, sign } from 'jsonwebtoken';
import { CONFIG } from '../secure/config';

export const JWT_SECRET: Secret = CONFIG.jwt_secret as string;

// Encode a JWT
export function encodeJWT(payload: string | object | Buffer): Promise<string> {
	return new Promise((resolve, reject) => {
		sign(payload, JWT_SECRET, { expiresIn: '30d' }, (err, token) => {
			if (err) return reject(err);
			if (token)
				return resolve(token);
			return new Error("no token");
		});
	});
}

// Verify a JWT. 
// Note:  This can throw an error if the token is invalid, wrap it in a try catch
export function decodeJWT(token: string): Promise<any> {
	return new Promise((resolve, reject) => {
		verify(token, JWT_SECRET, (err, obj) => {
			if (err) return reject(err);
			return resolve(obj);
		});
	});
}