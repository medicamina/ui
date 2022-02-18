import express, {
    Application,
    Request,
    Response,
    NextFunction,
    urlencoded,
    json,
    static as expressStatic
} from 'express';
import cors from 'cors';

const app: Application = express();
app.use(urlencoded({ extended: true }));
app.use(json());
app.set('trust proxy', true);
app.disable('x-powered-by');
app.use(cors());

declare global {
    namespace Express {
        interface Request {
            JWT: { _id: string; email: string; enterprise: string; };
            enterprise: string | undefined;
        }
        interface Application {
            _startup: Promise<boolean>;
        }
    }
}

app.use(async (req: Request, res: Response, next: NextFunction) => {
    const JWT_TOKEN: string | undefined = req.header("JWT");
    if (JWT_TOKEN) {
        try {
            // Decode for server sided use only
            req.JWT = await decodeJWT(JWT_TOKEN);
            req.enterprise = req.JWT.enterprise;
            // return (non-decoded) JWT token to client via HTTP
            res.setHeader('JWT', JWT_TOKEN);
        } catch (err) {
            // Remove server sided JWT
            delete req.JWT;
            // Remove JWT from HTTP response
            res.removeHeader('JWT');
        }
    }
    next();
});